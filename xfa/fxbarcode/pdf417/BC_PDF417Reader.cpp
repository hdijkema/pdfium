// Copyright 2014 PDFium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Original code copyright 2014 Foxit Software Inc. http://www.foxitsoftware.com
// Original code is licensed as follows:
/*
 * Copyright 2009 ZXing authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <algorithm>
#include <limits>
#include <memory>

#include "xfa/fxbarcode/BC_BinaryBitmap.h"
#include "xfa/fxbarcode/BC_BinaryBitmap.h"
#include "xfa/fxbarcode/BC_DecoderResult.h"
#include "xfa/fxbarcode/BC_Reader.h"
#include "xfa/fxbarcode/BC_ResultPoint.h"
#include "xfa/fxbarcode/common/BC_CommonBitArray.h"
#include "xfa/fxbarcode/common/BC_CommonBitMatrix.h"
#include "xfa/fxbarcode/common/BC_CommonBitMatrix.h"
#include "xfa/fxbarcode/common/BC_CommonDecoderResult.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417BarcodeMetadata.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417BarcodeValue.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417BoundingBox.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417Codeword.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417CodewordDecoder.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417Common.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417DecodedBitStreamParser.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417DecodedBitStreamParser.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417DecodedBitStreamParser.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417DetectionResult.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417DetectionResultColumn.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417DetectionResultRowIndicatorColumn.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417Detector.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417DetectorResult.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417DetectorResult.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417ECErrorCorrection.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417ECModulusGF.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417ECModulusPoly.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417Reader.h"
#include "xfa/fxbarcode/pdf417/BC_PDF417ScanningDecoder.h"
#include "xfa/fxbarcode/utils.h"

CBC_PDF417Reader::CBC_PDF417Reader() {}
CBC_PDF417Reader::~CBC_PDF417Reader() {}

CFX_ByteString CBC_PDF417Reader::Decode(CBC_BinaryBitmap* image, int32_t& e) {
  return Decode(image, 0, e);
}
CFX_ByteString CBC_PDF417Reader::Decode(CBC_BinaryBitmap* image,
                                        FX_BOOL multiple,
                                        int32_t hints,
                                        int32_t& e) {
  CFX_ByteString results;
  std::unique_ptr<CBC_PDF417DetectorResult> detectorResult(
      CBC_Detector::detect(image, hints, multiple, e));
  BC_EXCEPTION_CHECK_ReturnValue(e, "");
  for (int32_t i = 0; i < detectorResult->getPoints()->GetSize(); i++) {
    CBC_ResultPointArray* points = detectorResult->getPoints()->GetAt(i);
    std::unique_ptr<CBC_CommonDecoderResult> ResultTemp(
        CBC_PDF417ScanningDecoder::decode(
            detectorResult->getBits(), points->GetAt(4), points->GetAt(5),
            points->GetAt(6), points->GetAt(7), getMinCodewordWidth(*points),
            getMaxCodewordWidth(*points), e));
    if (!ResultTemp) {
      e = BCExceptiontNotFoundInstance;
      return CFX_ByteString();
    }
    results += ResultTemp->GetText();
  }
  return results;
}

CFX_ByteString CBC_PDF417Reader::Decode(CBC_BinaryBitmap* image,
                                        int32_t hints,
                                        int32_t& e) {
  CFX_ByteString bs = Decode(image, FALSE, 0, e);
  BC_EXCEPTION_CHECK_ReturnValue(e, "");
  return bs;
}
int32_t CBC_PDF417Reader::getMaxWidth(CBC_ResultPoint* p1,
                                      CBC_ResultPoint* p2) {
  if (p1 == NULL || p2 == NULL) {
    return 0;
  }
  return (int32_t)FXSYS_fabs(p1->GetX() - p2->GetX());
}
int32_t CBC_PDF417Reader::getMinWidth(CBC_ResultPoint* p1,
                                      CBC_ResultPoint* p2) {
  if (!p1 || !p2)
    return std::numeric_limits<int32_t>::max();
  return (int32_t)FXSYS_fabs(p1->GetX() - p2->GetX());
}

int32_t CBC_PDF417Reader::getMaxCodewordWidth(
    const CFX_ArrayTemplate<CBC_ResultPoint*>& p) {
  int32_t a = getMaxWidth(p.GetAt(6), p.GetAt(2)) *
              CBC_PDF417Common::MODULES_IN_CODEWORD /
              CBC_PDF417Common::MODULES_IN_STOP_PATTERN;
  int32_t b = getMaxWidth(p.GetAt(7), p.GetAt(3)) *
              CBC_PDF417Common::MODULES_IN_CODEWORD /
              CBC_PDF417Common::MODULES_IN_STOP_PATTERN;
  int32_t c = std::min(a, getMaxWidth(p.GetAt(0), p.GetAt(4)));
  int32_t d = std::min(b, getMaxWidth(p.GetAt(1), p.GetAt(5)));
  return std::min(c, d);
}

int32_t CBC_PDF417Reader::getMinCodewordWidth(
    const CFX_ArrayTemplate<CBC_ResultPoint*>& p) {
  int32_t a = getMinWidth(p.GetAt(6), p.GetAt(2)) *
              CBC_PDF417Common::MODULES_IN_CODEWORD /
              CBC_PDF417Common::MODULES_IN_STOP_PATTERN;
  int32_t b = getMinWidth(p.GetAt(7), p.GetAt(3)) *
              CBC_PDF417Common::MODULES_IN_CODEWORD /
              CBC_PDF417Common::MODULES_IN_STOP_PATTERN;
  int32_t c = std::min(a, getMinWidth(p.GetAt(0), p.GetAt(4)));
  int32_t d = std::min(b, getMinWidth(p.GetAt(1), p.GetAt(5)));
  return std::min(c, d);
}