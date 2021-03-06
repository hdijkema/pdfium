// Copyright 2017 PDFium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Original code copyright 2014 Foxit Software Inc. http://www.foxitsoftware.com

#include "xfa/fxfa/app/cxfa_linkuserdata.h"

CXFA_LinkUserData::CXFA_LinkUserData(FX_WCHAR* pszText)
    : m_dwRefCount(1), m_wsURLContent(pszText) {}

CXFA_LinkUserData::~CXFA_LinkUserData() {}

uint32_t CXFA_LinkUserData::Retain() {
  return ++m_dwRefCount;
}

uint32_t CXFA_LinkUserData::Release() {
  uint32_t dwRefCount = --m_dwRefCount;
  if (dwRefCount <= 0)
    delete this;
  return dwRefCount;
}

const FX_WCHAR* CXFA_LinkUserData::GetLinkURL() {
  return m_wsURLContent.c_str();
}
