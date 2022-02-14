#-------------------------------------------------------------------------------
# Project created by QtCreator 2017-01-10T21:16:43
#-------------------------------------------------------------------------------
# Installeren:
#  kopieer de 'public' map, de *.h bestanden naar $MYLIBDIR/include/pdfium
#  kopieer de libraries naar de $MYLIBDIR/lib of libd map.
#-------------------------------------------------------------------------------

QT       -= core gui

TARGET = pdfiumdll
TEMPLATE = lib

#win32: QMAKE_CFLAGS += -wd4100
#win32: QMAKE_CXXFLAGS += -wd4100
#win32: QMAKE_CFLAGS_WARN_OFF += 4100
#win32: QMAKE_CXXFLAGS_WARN_OFF += 4100
win32: QMAKE_CXXFLAGS += /wd4100
win32: QMAKE_CXXFLAGS_WARN_ON -= -w34100

win32: MYLIBDIR = c:/devel/libraries/win64
win32: INCLUDEPATH += $$MYLIBDIR/include

mac: message(Qt Deployment Target: $$QMAKE_MACOSX_DEPLOYMENT_TARGET)
mac: QMAKE_APPLE_DEVICE_ARCHS = x86_64 arm64

CONFIG(debug, debug|release) {
    win32: LIBS += -L$$MYLIBDIR/libd
} else {
    win32: LIBS += -L$$MYLIBDIR/lib
}
win32: LIBS += -lfreetype271 -llibjpeg -llibpng -llibtiff -lopenjp2 -lGdi32 -lUser32 -lAdvapi32

mac: MYLIBDIR=/Users/hans/devel/libraries/nosx
mac: INCLUDEPATH += $$MYLIBDIR/include
mac: INCLUDEPATH += $$MYLIBDIR/include/freetype2
mac: LIBS += -L$$MYLIBDIR/lib
mac: LIBS += -lfreetype -ljpeg -lpng -ltiff -lopenjp2 -lz -lbz2 -lbrotlidec -lharfbuzz -framework CoreFoundation -framework CoreGraphics -framework CoreText

INCLUDEPATH += ..


DEFINES += PDFIUMDLL_LIBRARY
#DEFINES += PDF_ENABLE_XFA
DEFINES += USE_SYSTEM_LIBJPEG
DEFINES += FPDFSDK_EXPORTS
DEFINES += HD


# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    ../core/fxge/ifx_renderdevicedriver.cpp \
    ../core/fdrm/crypto/fx_crypt.cpp \
    ../core/fdrm/crypto/fx_crypt_aes.cpp \
    ../core/fdrm/crypto/fx_crypt_sha.cpp \
    ../core/fpdfapi/cpdf_modulemgr.cpp \
    ../core/fpdfapi/cpdf_pagerendercontext.cpp \
    ../core/fpdfapi/cmaps/fpdf_cmaps.cpp \
    ../core/fpdfapi/cmaps/CNS1/Adobe-CNS1-UCS2_5.cpp \
    ../core/fpdfapi/cmaps/CNS1/B5pc-H_0.cpp \
    ../core/fpdfapi/cmaps/CNS1/B5pc-V_0.cpp \
    ../core/fpdfapi/cmaps/CNS1/cmaps_cns1.cpp \
    ../core/fpdfapi/cmaps/CNS1/CNS-EUC-H_0.cpp \
    ../core/fpdfapi/cmaps/CNS1/CNS-EUC-V_0.cpp \
    ../core/fpdfapi/cmaps/CNS1/ETen-B5-H_0.cpp \
    ../core/fpdfapi/cmaps/CNS1/ETen-B5-V_0.cpp \
    ../core/fpdfapi/cmaps/CNS1/ETenms-B5-H_0.cpp \
    ../core/fpdfapi/cmaps/CNS1/ETenms-B5-V_0.cpp \
    ../core/fpdfapi/cmaps/CNS1/HKscs-B5-H_5.cpp \
    ../core/fpdfapi/cmaps/CNS1/HKscs-B5-V_5.cpp \
    ../core/fpdfapi/cmaps/CNS1/UniCNS-UCS2-H_3.cpp \
    ../core/fpdfapi/cmaps/CNS1/UniCNS-UCS2-V_3.cpp \
    ../core/fpdfapi/cmaps/CNS1/UniCNS-UTF16-H_0.cpp \
    ../core/fpdfapi/cmaps/GB1/Adobe-GB1-UCS2_5.cpp \
    ../core/fpdfapi/cmaps/GB1/cmaps_gb1.cpp \
    ../core/fpdfapi/cmaps/GB1/GB-EUC-H_0.cpp \
    ../core/fpdfapi/cmaps/GB1/GB-EUC-V_0.cpp \
    ../core/fpdfapi/cmaps/GB1/GBK-EUC-H_2.cpp \
    ../core/fpdfapi/cmaps/GB1/GBK-EUC-V_2.cpp \
    ../core/fpdfapi/cmaps/GB1/GBK2K-H_5.cpp \
    ../core/fpdfapi/cmaps/GB1/GBK2K-V_5.cpp \
    ../core/fpdfapi/cmaps/GB1/GBKp-EUC-H_2.cpp \
    ../core/fpdfapi/cmaps/GB1/GBKp-EUC-V_2.cpp \
    ../core/fpdfapi/cmaps/GB1/GBpc-EUC-H_0.cpp \
    ../core/fpdfapi/cmaps/GB1/GBpc-EUC-V_0.cpp \
    ../core/fpdfapi/cmaps/GB1/UniGB-UCS2-H_4.cpp \
    ../core/fpdfapi/cmaps/GB1/UniGB-UCS2-V_4.cpp \
    ../core/fpdfapi/cmaps/Japan1/83pv-RKSJ-H_1.cpp \
    ../core/fpdfapi/cmaps/Japan1/90ms-RKSJ-H_2.cpp \
    ../core/fpdfapi/cmaps/Japan1/90ms-RKSJ-V_2.cpp \
    ../core/fpdfapi/cmaps/Japan1/90msp-RKSJ-H_2.cpp \
    ../core/fpdfapi/cmaps/Japan1/90msp-RKSJ-V_2.cpp \
    ../core/fpdfapi/cmaps/Japan1/90pv-RKSJ-H_1.cpp \
    ../core/fpdfapi/cmaps/Japan1/Add-RKSJ-H_1.cpp \
    ../core/fpdfapi/cmaps/Japan1/Add-RKSJ-V_1.cpp \
    ../core/fpdfapi/cmaps/Japan1/Adobe-Japan1-UCS2_4.cpp \
    ../core/fpdfapi/cmaps/Japan1/cmaps_japan1.cpp \
    ../core/fpdfapi/cmaps/Japan1/EUC-H_1.cpp \
    ../core/fpdfapi/cmaps/Japan1/EUC-V_1.cpp \
    ../core/fpdfapi/cmaps/Japan1/Ext-RKSJ-H_2.cpp \
    ../core/fpdfapi/cmaps/Japan1/Ext-RKSJ-V_2.cpp \
    ../core/fpdfapi/cmaps/Japan1/H_1.cpp \
    ../core/fpdfapi/cmaps/Japan1/UniJIS-UCS2-H_4.cpp \
    ../core/fpdfapi/cmaps/Japan1/UniJIS-UCS2-HW-H_4.cpp \
    ../core/fpdfapi/cmaps/Japan1/UniJIS-UCS2-HW-V_4.cpp \
    ../core/fpdfapi/cmaps/Japan1/UniJIS-UCS2-V_4.cpp \
    ../core/fpdfapi/cmaps/Japan1/V_1.cpp \
    ../core/fpdfapi/cmaps/Korea1/Adobe-Korea1-UCS2_2.cpp \
    ../core/fpdfapi/cmaps/Korea1/cmaps_korea1.cpp \
    ../core/fpdfapi/cmaps/Korea1/KSC-EUC-H_0.cpp \
    ../core/fpdfapi/cmaps/Korea1/KSC-EUC-V_0.cpp \
    ../core/fpdfapi/cmaps/Korea1/KSCms-UHC-H_1.cpp \
    ../core/fpdfapi/cmaps/Korea1/KSCms-UHC-HW-H_1.cpp \
    ../core/fpdfapi/cmaps/Korea1/KSCms-UHC-HW-V_1.cpp \
    ../core/fpdfapi/cmaps/Korea1/KSCms-UHC-V_1.cpp \
    ../core/fpdfapi/cmaps/Korea1/KSCpc-EUC-H_0.cpp \
    ../core/fpdfapi/cmaps/Korea1/UniKS-UCS2-H_1.cpp \
    ../core/fpdfapi/cmaps/Korea1/UniKS-UCS2-V_1.cpp \
    ../core/fpdfapi/cmaps/Korea1/UniKS-UTF16-H_0.cpp \
    ../core/fpdfapi/edit/cpdf_pagecontentgenerator.cpp \
    ../core/fpdfapi/edit/fpdf_edit_create.cpp \
    ../core/fpdfapi/font/cpdf_cidfont.cpp \
    ../core/fpdfapi/font/cpdf_font.cpp \
    ../core/fpdfapi/font/cpdf_fontencoding.cpp \
    ../core/fpdfapi/font/cpdf_simplefont.cpp \
    ../core/fpdfapi/font/cpdf_truetypefont.cpp \
    ../core/fpdfapi/font/cpdf_type1font.cpp \
    ../core/fpdfapi/font/cpdf_type3char.cpp \
    ../core/fpdfapi/font/cpdf_type3font.cpp \
    ../core/fpdfapi/font/fpdf_font.cpp \
    ../core/fpdfapi/font/fpdf_font_cid.cpp \
    ../core/fpdfapi/font/ttgsubtable.cpp \
    ../core/fpdfapi/page/cpdf_allstates.cpp \
    ../core/fpdfapi/page/cpdf_clippath.cpp \
    ../core/fpdfapi/page/cpdf_color.cpp \
    ../core/fpdfapi/page/cpdf_colorspace.cpp \
    ../core/fpdfapi/page/cpdf_colorstate.cpp \
    ../core/fpdfapi/page/cpdf_contentmark.cpp \
    ../core/fpdfapi/page/cpdf_contentmarkitem.cpp \
    ../core/fpdfapi/page/cpdf_contentparser.cpp \
    ../core/fpdfapi/page/cpdf_docpagedata.cpp \
    ../core/fpdfapi/page/cpdf_form.cpp \
    ../core/fpdfapi/page/cpdf_formobject.cpp \
    ../core/fpdfapi/page/cpdf_generalstate.cpp \
    ../core/fpdfapi/page/cpdf_graphicstates.cpp \
    ../core/fpdfapi/page/cpdf_image.cpp \
    ../core/fpdfapi/page/cpdf_imageobject.cpp \
    ../core/fpdfapi/page/cpdf_meshstream.cpp \
    ../core/fpdfapi/page/cpdf_page.cpp \
    ../core/fpdfapi/page/cpdf_pagemodule.cpp \
    ../core/fpdfapi/page/cpdf_pageobject.cpp \
    ../core/fpdfapi/page/cpdf_pageobjectholder.cpp \
    ../core/fpdfapi/page/cpdf_pageobjectlist.cpp \
    ../core/fpdfapi/page/cpdf_path.cpp \
    ../core/fpdfapi/page/cpdf_pathobject.cpp \
    ../core/fpdfapi/page/cpdf_pattern.cpp \
    ../core/fpdfapi/page/cpdf_shadingobject.cpp \
    ../core/fpdfapi/page/cpdf_shadingpattern.cpp \
    ../core/fpdfapi/page/cpdf_streamcontentparser.cpp \
    ../core/fpdfapi/page/cpdf_streamparser.cpp \
    ../core/fpdfapi/page/cpdf_textobject.cpp \
    ../core/fpdfapi/page/cpdf_textstate.cpp \
    ../core/fpdfapi/page/cpdf_tilingpattern.cpp \
    ../core/fpdfapi/page/fpdf_page_colors.cpp \
    ../core/fpdfapi/page/fpdf_page_func.cpp \
    ../core/fpdfapi/parser/cfdf_document.cpp \
    ../core/fpdfapi/parser/cpdf_array.cpp \
    ../core/fpdfapi/parser/cpdf_boolean.cpp \
    ../core/fpdfapi/parser/cpdf_crypto_handler.cpp \
    ../core/fpdfapi/parser/cpdf_data_avail.cpp \
    ../core/fpdfapi/parser/cpdf_dictionary.cpp \
    ../core/fpdfapi/parser/cpdf_document.cpp \
    ../core/fpdfapi/parser/cpdf_hint_tables.cpp \
    ../core/fpdfapi/parser/cpdf_indirect_object_holder.cpp \
    ../core/fpdfapi/parser/cpdf_linearized_header.cpp \
    ../core/fpdfapi/parser/cpdf_name.cpp \
    ../core/fpdfapi/parser/cpdf_null.cpp \
    ../core/fpdfapi/parser/cpdf_number.cpp \
    ../core/fpdfapi/parser/cpdf_object.cpp \
    ../core/fpdfapi/parser/cpdf_parser.cpp \
    ../core/fpdfapi/parser/cpdf_reference.cpp \
    ../core/fpdfapi/parser/cpdf_security_handler.cpp \
    ../core/fpdfapi/parser/cpdf_simple_parser.cpp \
    ../core/fpdfapi/parser/cpdf_stream.cpp \
    ../core/fpdfapi/parser/cpdf_stream_acc.cpp \
    ../core/fpdfapi/parser/cpdf_string.cpp \
    ../core/fpdfapi/parser/cpdf_syntax_parser.cpp \
    ../core/fpdfapi/parser/fpdf_parser_decode.cpp \
    ../core/fpdfapi/parser/fpdf_parser_utility.cpp \
    ../core/fpdfapi/render/cpdf_charposlist.cpp \
    ../core/fpdfapi/render/cpdf_devicebuffer.cpp \
    ../core/fpdfapi/render/cpdf_dibsource.cpp \
    ../core/fpdfapi/render/cpdf_dibtransferfunc.cpp \
    ../core/fpdfapi/render/cpdf_docrenderdata.cpp \
    ../core/fpdfapi/render/cpdf_imagecacheentry.cpp \
    ../core/fpdfapi/render/cpdf_imageloader.cpp \
    ../core/fpdfapi/render/cpdf_imagerenderer.cpp \
    ../core/fpdfapi/render/cpdf_pagerendercache.cpp \
    ../core/fpdfapi/render/cpdf_progressiverenderer.cpp \
    ../core/fpdfapi/render/cpdf_rendercontext.cpp \
    ../core/fpdfapi/render/cpdf_renderoptions.cpp \
    ../core/fpdfapi/render/cpdf_renderstatus.cpp \
    ../core/fpdfapi/render/cpdf_scaledrenderbuffer.cpp \
    ../core/fpdfapi/render/cpdf_textrenderer.cpp \
    ../core/fpdfapi/render/cpdf_transferfunc.cpp \
    ../core/fpdfapi/render/cpdf_type3cache.cpp \
    ../core/fpdfapi/render/cpdf_type3glyphs.cpp \
    ../core/fpdfdoc/cline.cpp \
    ../core/fpdfdoc/clines.cpp \
    ../core/fpdfdoc/cpdf_aaction.cpp \
    ../core/fpdfdoc/cpdf_action.cpp \
    ../core/fpdfdoc/cpdf_actionfields.cpp \
    ../core/fpdfdoc/cpdf_annot.cpp \
    ../core/fpdfdoc/cpdf_annotlist.cpp \
    ../core/fpdfdoc/cpdf_apsettings.cpp \
    ../core/fpdfdoc/cpdf_bookmark.cpp \
    ../core/fpdfdoc/cpdf_bookmarktree.cpp \
    ../core/fpdfdoc/cpdf_defaultappearance.cpp \
    ../core/fpdfdoc/cpdf_dest.cpp \
    ../core/fpdfdoc/cpdf_docjsactions.cpp \
    ../core/fpdfdoc/cpdf_filespec.cpp \
    ../core/fpdfdoc/cpdf_formcontrol.cpp \
    ../core/fpdfdoc/cpdf_formfield.cpp \
    ../core/fpdfdoc/cpdf_iconfit.cpp \
    ../core/fpdfdoc/cpdf_interform.cpp \
    ../core/fpdfdoc/cpdf_link.cpp \
    ../core/fpdfdoc/cpdf_linklist.cpp \
    ../core/fpdfdoc/cpdf_metadata.cpp \
    ../core/fpdfdoc/cpdf_nametree.cpp \
    ../core/fpdfdoc/cpdf_numbertree.cpp \
    ../core/fpdfdoc/cpdf_occontext.cpp \
    ../core/fpdfdoc/cpdf_pagelabel.cpp \
    ../core/fpdfdoc/cpdf_variabletext.cpp \
    ../core/fpdfdoc/cpdf_viewerpreferences.cpp \
    ../core/fpdfdoc/cpvt_color.cpp \
    ../core/fpdfdoc/cpvt_fontmap.cpp \
    ../core/fpdfdoc/cpvt_generateap.cpp \
    ../core/fpdfdoc/cpvt_sectioninfo.cpp \
    ../core/fpdfdoc/cpvt_wordinfo.cpp \
    ../core/fpdfdoc/csection.cpp \
    ../core/fpdfdoc/ctypeset.cpp \
    ../core/fpdfdoc/doc_tagged.cpp \
    ../core/fpdftext/cpdf_linkextract.cpp \
    ../core/fpdftext/cpdf_textpage.cpp \
    ../core/fpdftext/cpdf_textpagefind.cpp \
    ../core/fpdftext/unicodenormalizationdata.cpp \
    ../core/fxcodec/codec/fx_codec.cpp \
    ../core/fxcodec/codec/fx_codec_fax.cpp \
    ../core/fxcodec/codec/fx_codec_flate.cpp \
    ../core/fxcodec/codec/fx_codec_icc.cpp \
    ../core/fxcodec/codec/fx_codec_jbig.cpp \
    ../core/fxcodec/codec/fx_codec_jpeg.cpp \
    ../core/fxcodec/codec/fx_codec_jpx_opj.cpp \
    ../core/fxcodec/jbig2/JBig2_ArithDecoder.cpp \
    ../core/fxcodec/jbig2/JBig2_ArithIntDecoder.cpp \
    ../core/fxcodec/jbig2/JBig2_BitStream.cpp \
    ../core/fxcodec/jbig2/JBig2_Context.cpp \
    ../core/fxcodec/jbig2/JBig2_GrdProc.cpp \
    ../core/fxcodec/jbig2/JBig2_GrrdProc.cpp \
    ../core/fxcodec/jbig2/JBig2_GsidProc.cpp \
    ../core/fxcodec/jbig2/JBig2_HtrdProc.cpp \
    ../core/fxcodec/jbig2/JBig2_HuffmanDecoder.cpp \
    ../core/fxcodec/jbig2/JBig2_HuffmanTable.cpp \
    ../core/fxcodec/jbig2/JBig2_HuffmanTable_Standard.cpp \
    ../core/fxcodec/jbig2/JBig2_Image.cpp \
    ../core/fxcodec/jbig2/JBig2_PatternDict.cpp \
    ../core/fxcodec/jbig2/JBig2_PddProc.cpp \
    ../core/fxcodec/jbig2/JBig2_SddProc.cpp \
    ../core/fxcodec/jbig2/JBig2_Segment.cpp \
    ../core/fxcodec/jbig2/JBig2_SymbolDict.cpp \
    ../core/fxcodec/jbig2/JBig2_TrdProc.cpp \
    ../core/fxcodec/lbmp/fx_bmp.cpp \
    ../core/fxcodec/lgif/fx_gif.cpp \
    ../core/fxcrt/fx_basic_array.cpp \
    ../core/fxcrt/fx_basic_bstring.cpp \
    ../core/fxcrt/fx_basic_buffer.cpp \
    ../core/fxcrt/fx_basic_coords.cpp \
    ../core/fxcrt/fx_basic_gcc.cpp \
    ../core/fxcrt/fx_basic_memmgr.cpp \
    ../core/fxcrt/fx_basic_utf.cpp \
    ../core/fxcrt/fx_basic_util.cpp \
    ../core/fxcrt/fx_basic_wstring.cpp \
    ../core/fxcrt/fx_bidi.cpp \
    ../core/fxcrt/fx_extension.cpp \
    ../core/fxcrt/fx_ucddata.cpp \
    ../core/fxcrt/fx_unicode.cpp \
    ../core/fxcrt/fx_xml_composer.cpp \
    ../core/fxcrt/fx_xml_parser.cpp \
    ../core/fxcrt/fxcrt_posix.cpp \
    ../core/fxcrt/fxcrt_stream.cpp \
    ../core/fxcrt/fxcrt_windows.cpp \
    ../core/fxge/agg/fx_agg_driver.cpp \
    ../core/fxge/dib/fx_dib_composite.cpp \
    ../core/fxge/dib/fx_dib_convert.cpp \
    ../core/fxge/dib/fx_dib_engine.cpp \
    ../core/fxge/dib/fx_dib_main.cpp \
    ../core/fxge/dib/fx_dib_transform.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitDingbats.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitFixed.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitFixedBold.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitFixedBoldItalic.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitFixedItalic.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitSans.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitSansBold.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitSansBoldItalic.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitSansItalic.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitSansMM.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitSerif.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitSerifBold.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitSerifBoldItalic.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitSerifItalic.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitSerifMM.cpp \
    ../core/fxge/fontdata/chromefontdata/FoxitSymbol.cpp \
    ../core/fxge/freetype/fx_freetype.cpp \
    ../core/fxge/ge/cfx_cliprgn.cpp \
    ../core/fxge/ge/cfx_facecache.cpp \
    ../core/fxge/ge/cfx_folderfontinfo.cpp \
    ../core/fxge/ge/cfx_font.cpp \
    ../core/fxge/ge/cfx_fontcache.cpp \
    ../core/fxge/ge/cfx_fontmapper.cpp \
    ../core/fxge/ge/cfx_fontmgr.cpp \
    ../core/fxge/ge/cfx_gemodule.cpp \
    ../core/fxge/ge/cfx_graphstate.cpp \
    ../core/fxge/ge/cfx_graphstatedata.cpp \
    ../core/fxge/ge/cfx_pathdata.cpp \
    ../core/fxge/ge/cfx_renderdevice.cpp \
    ../core/fxge/ge/cfx_substfont.cpp \
    ../core/fxge/ge/cfx_unicodeencoding.cpp \
    ../core/fxge/ge/cttfontdesc.cpp \
    ../core/fxge/ge/fx_ge_fontmap.cpp \
    ../core/fxge/ge/fx_ge_linux.cpp \
    ../core/fxge/ge/fx_ge_text.cpp \
    ../third_party/agg23/agg_curves.cpp \
    ../third_party/agg23/agg_path_storage.cpp \
    ../third_party/agg23/agg_rasterizer_scanline_aa.cpp \
    ../third_party/agg23/agg_vcgen_dash.cpp \
    ../third_party/agg23/agg_vcgen_stroke.cpp \
    ../third_party/zlib_v128/adler32.c \
    ../third_party/zlib_v128/compress.c \
    ../third_party/zlib_v128/crc32.c \
    ../third_party/zlib_v128/deflate.c \
    ../third_party/zlib_v128/gzclose.c \
    ../third_party/zlib_v128/gzlib.c \
    ../third_party/zlib_v128/gzread.c \
    ../third_party/zlib_v128/gzwrite.c \
    ../third_party/zlib_v128/infback.c \
    ../third_party/zlib_v128/inffast.c \
    ../third_party/zlib_v128/inflate.c \
    ../third_party/zlib_v128/inftrees.c \
    ../third_party/zlib_v128/trees.c \
    ../third_party/zlib_v128/uncompr.c \
    ../third_party/zlib_v128/zutil.c \
    ../third_party/lcms2-2.6/src/cmscam02.c \
    ../third_party/lcms2-2.6/src/cmscgats.c \
    ../third_party/lcms2-2.6/src/cmscnvrt.c \
    ../third_party/lcms2-2.6/src/cmserr.c \
    ../third_party/lcms2-2.6/src/cmsgamma.c \
    ../third_party/lcms2-2.6/src/cmsgmt.c \
    ../third_party/lcms2-2.6/src/cmshalf.c \
    ../third_party/lcms2-2.6/src/cmsintrp.c \
    ../third_party/lcms2-2.6/src/cmsio0.c \
    ../third_party/lcms2-2.6/src/cmsio1.c \
    ../third_party/lcms2-2.6/src/cmslut.c \
    ../third_party/lcms2-2.6/src/cmsmd5.c \
    ../third_party/lcms2-2.6/src/cmsmtrx.c \
    ../third_party/lcms2-2.6/src/cmsnamed.c \
    ../third_party/lcms2-2.6/src/cmsopt.c \
    ../third_party/lcms2-2.6/src/cmspack.c \
    ../third_party/lcms2-2.6/src/cmspcs.c \
    ../third_party/lcms2-2.6/src/cmsplugin.c \
    ../third_party/lcms2-2.6/src/cmsps2.c \
    ../third_party/lcms2-2.6/src/cmssamp.c \
    ../third_party/lcms2-2.6/src/cmssm.c \
    ../third_party/lcms2-2.6/src/cmstypes.c \
    ../third_party/lcms2-2.6/src/cmsvirt.c \
    ../third_party/lcms2-2.6/src/cmswtpnt.c \
    ../third_party/lcms2-2.6/src/cmsxform.c \
    ../fpdfsdk/cba_annotiterator.cpp \
    ../fpdfsdk/cfx_systemhandler.cpp \
    ../fpdfsdk/cpdfsdk_annot.cpp \
    ../fpdfsdk/cpdfsdk_annothandlermgr.cpp \
    ../fpdfsdk/cpdfsdk_annotiterator.cpp \
    ../fpdfsdk/cpdfsdk_baannot.cpp \
    ../fpdfsdk/cpdfsdk_baannothandler.cpp \
    ../fpdfsdk/cpdfsdk_datetime.cpp \
    ../fpdfsdk/cpdfsdk_formfillenvironment.cpp \
    ../fpdfsdk/cpdfsdk_interform.cpp \
    ../fpdfsdk/cpdfsdk_pageview.cpp \
    ../fpdfsdk/cpdfsdk_widget.cpp \
    ../fpdfsdk/cpdfsdk_widgethandler.cpp \
    ../fpdfsdk/fpdf_dataavail.cpp \
    ../fpdfsdk/fpdf_ext.cpp \
    ../fpdfsdk/fpdf_flatten.cpp \
    ../fpdfsdk/fpdf_progressive.cpp \
    ../fpdfsdk/fpdf_searchex.cpp \
    ../fpdfsdk/fpdf_structtree.cpp \
    ../fpdfsdk/fpdf_sysfontinfo.cpp \
    ../fpdfsdk/fpdf_transformpage.cpp \
    ../fpdfsdk/fpdfdoc.cpp \
    ../fpdfsdk/fpdfeditimg.cpp \
    ../fpdfsdk/fpdfeditpage.cpp \
    ../fpdfsdk/fpdfppo.cpp \
    ../fpdfsdk/fpdfsave.cpp \
    ../fpdfsdk/fpdftext.cpp \
    ../fpdfsdk/fpdfview.cpp \
    ../fpdfsdk/fsdk_actionhandler.cpp \
    ../fpdfsdk/fsdk_pauseadapter.cpp \
    ../fpdfsdk/pdfsdk_fieldaction.cpp \
    ../fpdfsdk/formfiller/cba_fontmap.cpp \
    ../fpdfsdk/formfiller/cffl_checkbox.cpp \
    ../fpdfsdk/formfiller/cffl_combobox.cpp \
    ../fpdfsdk/formfiller/cffl_formfiller.cpp \
    ../fpdfsdk/formfiller/cffl_interactiveformfiller.cpp \
    ../fpdfsdk/formfiller/cffl_listbox.cpp \
    ../fpdfsdk/formfiller/cffl_pushbutton.cpp \
    ../fpdfsdk/formfiller/cffl_radiobutton.cpp \
    ../fpdfsdk/formfiller/cffl_textfield.cpp \
    ../fpdfsdk/fxedit/fxet_ap.cpp \
    ../fpdfsdk/fxedit/fxet_edit.cpp \
    ../fpdfsdk/fxedit/fxet_list.cpp \
    ../fpdfsdk/pdfwindow/PWL_Button.cpp \
    ../fpdfsdk/pdfwindow/PWL_Caret.cpp \
    ../fpdfsdk/pdfwindow/PWL_ComboBox.cpp \
    ../fpdfsdk/pdfwindow/PWL_Edit.cpp \
    ../fpdfsdk/pdfwindow/PWL_EditCtrl.cpp \
    ../fpdfsdk/pdfwindow/PWL_FontMap.cpp \
    ../fpdfsdk/pdfwindow/PWL_Icon.cpp \
    ../fpdfsdk/pdfwindow/PWL_ListBox.cpp \
    ../fpdfsdk/pdfwindow/PWL_ScrollBar.cpp \
    ../fpdfsdk/pdfwindow/PWL_SpecialButton.cpp \
    ../fpdfsdk/pdfwindow/PWL_Utils.cpp \
    ../fpdfsdk/pdfwindow/PWL_Wnd.cpp \
    ../fpdfsdk/javascript/JS_Runtime_Stub.cpp \
    ../fpdfsdk/fpdfformfill.cpp \
    ../core/fxcodec/codec/fx_codec_bmp.cpp \
    ../core/fxcodec/codec/fx_codec_gif.cpp \
    ../core/fxcodec/codec/fx_codec_png.cpp \
    ../core/fxcodec/codec/fx_codec_progress.cpp \
    ../core/fxcodec/codec/fx_codec_tiff.cpp

mac: SOURCES += \
    ../core/fxge/apple/fx_apple_platform.cpp \
    ../core/fxge/apple/fx_mac_imp.cpp \
    ../core/fxge/apple/fx_quartz_device.cpp


win32: SOURCES += \
    ../core/fxge/win32/cfx_psrenderer.cpp \
    ../core/fxge/win32/cpsoutput.cpp \
    ../core/fxge/win32/fx_win32_device.cpp \
    ../core/fxge/win32/fx_win32_dib.cpp \
    ../core/fxge/win32/fx_win32_dwrite.cpp \
    ../core/fxge/win32/fx_win32_gdipext.cpp \
    ../core/fxge/win32/fx_win32_print.cpp



HEADERS += \
    ../core/fxge/cfx_facecache.h \
    ../core/fxge/cfx_fontcache.h \
    ../core/fxge/cfx_fontmapper.h \
    ../core/fxge/cfx_fontmgr.h \
    ../core/fxge/cfx_fxgedevice.h \
    ../core/fxge/cfx_gemodule.h \
    ../core/fxge/cfx_graphstate.h \
    ../core/fxge/cfx_graphstatedata.h \
    ../core/fxge/cfx_pathdata.h \
    ../core/fxge/cfx_renderdevice.h \
    ../core/fxge/cfx_substfont.h \
    ../core/fxge/cfx_unicodeencoding.h \
    ../core/fxge/cfx_windowsdevice.h \
    ../core/fxge/fx_dib.h \
    ../core/fxge/fx_font.h \
    ../core/fxge/fx_freetype.h \
    ../core/fxge/ifx_renderdevicedriver.h \
    ../core/fxge/ifx_systemfontinfo.h \
    ../core/fdrm/crypto/fx_crypt.h \
    ../core/fpdfapi/cpdf_modulemgr.h \
    ../core/fpdfapi/cpdf_pagerendercontext.h \
    ../core/fpdfapi/cmaps/CNS1/cmaps_cns1.h \
    ../core/fpdfapi/cmaps/GB1/cmaps_gb1.h \
    ../core/fpdfapi/cmaps/Japan1/cmaps_japan1.h \
    ../core/fpdfapi/cmaps/Korea1/cmaps_korea1.h \
    ../core/fpdfapi/cmaps/cmap_int.h \
    ../core/fpdfapi/edit/cpdf_creator.h \
    ../core/fpdfapi/edit/cpdf_pagecontentgenerator.h \
    ../core/fpdfapi/edit/editint.h \
    ../core/fpdfapi/font/cpdf_cidfont.h \
    ../core/fpdfapi/font/cpdf_font.h \
    ../core/fpdfapi/font/cpdf_fontencoding.h \
    ../core/fpdfapi/font/cpdf_simplefont.h \
    ../core/fpdfapi/font/cpdf_truetypefont.h \
    ../core/fpdfapi/font/cpdf_type1font.h \
    ../core/fpdfapi/font/cpdf_type3char.h \
    ../core/fpdfapi/font/cpdf_type3font.h \
    ../core/fpdfapi/font/font_int.h \
    ../core/fpdfapi/font/ttgsubtable.h \
    ../core/fpdfapi/page/cpdf_allstates.h \
    ../core/fpdfapi/page/cpdf_clippath.h \
    ../core/fpdfapi/page/cpdf_color.h \
    ../core/fpdfapi/page/cpdf_colorspace.h \
    ../core/fpdfapi/page/cpdf_colorstate.h \
    ../core/fpdfapi/page/cpdf_contentmark.h \
    ../core/fpdfapi/page/cpdf_contentmarkitem.h \
    ../core/fpdfapi/page/cpdf_contentparser.h \
    ../core/fpdfapi/page/cpdf_countedobject.h \
    ../core/fpdfapi/page/cpdf_docpagedata.h \
    ../core/fpdfapi/page/cpdf_form.h \
    ../core/fpdfapi/page/cpdf_formobject.h \
    ../core/fpdfapi/page/cpdf_generalstate.h \
    ../core/fpdfapi/page/cpdf_graphicstates.h \
    ../core/fpdfapi/page/cpdf_image.h \
    ../core/fpdfapi/page/cpdf_imageobject.h \
    ../core/fpdfapi/page/cpdf_meshstream.h \
    ../core/fpdfapi/page/cpdf_page.h \
    ../core/fpdfapi/page/cpdf_pagemodule.h \
    ../core/fpdfapi/page/cpdf_pageobject.h \
    ../core/fpdfapi/page/cpdf_pageobjectholder.h \
    ../core/fpdfapi/page/cpdf_pageobjectlist.h \
    ../core/fpdfapi/page/cpdf_path.h \
    ../core/fpdfapi/page/cpdf_pathobject.h \
    ../core/fpdfapi/page/cpdf_pattern.h \
    ../core/fpdfapi/page/cpdf_psengine.h \
    ../core/fpdfapi/page/cpdf_shadingobject.h \
    ../core/fpdfapi/page/cpdf_shadingpattern.h \
    ../core/fpdfapi/page/cpdf_streamcontentparser.h \
    ../core/fpdfapi/page/cpdf_streamparser.h \
    ../core/fpdfapi/page/cpdf_textobject.h \
    ../core/fpdfapi/page/cpdf_textstate.h \
    ../core/fpdfapi/page/cpdf_tilingpattern.h \
    ../core/fpdfapi/page/pageint.h \
    ../core/fpdfapi/parser/cfdf_document.h \
    ../core/fpdfapi/parser/cpdf_array.h \
    ../core/fpdfapi/parser/cpdf_boolean.h \
    ../core/fpdfapi/parser/cpdf_crypto_handler.h \
    ../core/fpdfapi/parser/cpdf_data_avail.h \
    ../core/fpdfapi/parser/cpdf_dictionary.h \
    ../core/fpdfapi/parser/cpdf_document.h \
    ../core/fpdfapi/parser/cpdf_hint_tables.h \
    ../core/fpdfapi/parser/cpdf_indirect_object_holder.h \
    ../core/fpdfapi/parser/cpdf_linearized_header.h \
    ../core/fpdfapi/parser/cpdf_name.h \
    ../core/fpdfapi/parser/cpdf_null.h \
    ../core/fpdfapi/parser/cpdf_number.h \
    ../core/fpdfapi/parser/cpdf_object.h \
    ../core/fpdfapi/parser/cpdf_parser.h \
    ../core/fpdfapi/parser/cpdf_reference.h \
    ../core/fpdfapi/parser/cpdf_security_handler.h \
    ../core/fpdfapi/parser/cpdf_simple_parser.h \
    ../core/fpdfapi/parser/cpdf_stream.h \
    ../core/fpdfapi/parser/cpdf_stream_acc.h \
    ../core/fpdfapi/parser/cpdf_string.h \
    ../core/fpdfapi/parser/cpdf_syntax_parser.h \
    ../core/fpdfapi/parser/fpdf_parser_decode.h \
    ../core/fpdfapi/parser/fpdf_parser_utility.h \
    ../core/fpdfapi/render/cpdf_charposlist.h \
    ../core/fpdfapi/render/cpdf_devicebuffer.h \
    ../core/fpdfapi/render/cpdf_dibsource.h \
    ../core/fpdfapi/render/cpdf_dibtransferfunc.h \
    ../core/fpdfapi/render/cpdf_docrenderdata.h \
    ../core/fpdfapi/render/cpdf_imagecacheentry.h \
    ../core/fpdfapi/render/cpdf_imageloader.h \
    ../core/fpdfapi/render/cpdf_imagerenderer.h \
    ../core/fpdfapi/render/cpdf_pagerendercache.h \
    ../core/fpdfapi/render/cpdf_progressiverenderer.h \
    ../core/fpdfapi/render/cpdf_rendercontext.h \
    ../core/fpdfapi/render/cpdf_renderoptions.h \
    ../core/fpdfapi/render/cpdf_renderstatus.h \
    ../core/fpdfapi/render/cpdf_scaledrenderbuffer.h \
    ../core/fpdfapi/render/cpdf_textrenderer.h \
    ../core/fpdfapi/render/cpdf_transferfunc.h \
    ../core/fpdfapi/render/cpdf_type3cache.h \
    ../core/fpdfapi/render/cpdf_type3glyphs.h \
    ../core/fpdfdoc/cline.h \
    ../core/fpdfdoc/clines.h \
    ../core/fpdfdoc/cpdf_aaction.h \
    ../core/fpdfdoc/cpdf_action.h \
    ../core/fpdfdoc/cpdf_actionfields.h \
    ../core/fpdfdoc/cpdf_annot.h \
    ../core/fpdfdoc/cpdf_annotlist.h \
    ../core/fpdfdoc/cpdf_apsettings.h \
    ../core/fpdfdoc/cpdf_bookmark.h \
    ../core/fpdfdoc/cpdf_bookmarktree.h \
    ../core/fpdfdoc/cpdf_defaultappearance.h \
    ../core/fpdfdoc/cpdf_dest.h \
    ../core/fpdfdoc/cpdf_docjsactions.h \
    ../core/fpdfdoc/cpdf_filespec.h \
    ../core/fpdfdoc/cpdf_formcontrol.h \
    ../core/fpdfdoc/cpdf_formfield.h \
    ../core/fpdfdoc/cpdf_iconfit.h \
    ../core/fpdfdoc/cpdf_interform.h \
    ../core/fpdfdoc/cpdf_link.h \
    ../core/fpdfdoc/cpdf_linklist.h \
    ../core/fpdfdoc/cpdf_metadata.h \
    ../core/fpdfdoc/cpdf_nametree.h \
    ../core/fpdfdoc/cpdf_numbertree.h \
    ../core/fpdfdoc/cpdf_occontext.h \
    ../core/fpdfdoc/cpdf_pagelabel.h \
    ../core/fpdfdoc/cpdf_variabletext.h \
    ../core/fpdfdoc/cpdf_viewerpreferences.h \
    ../core/fpdfdoc/cpvt_arraytemplate.h \
    ../core/fpdfdoc/cpvt_color.h \
    ../core/fpdfdoc/cpvt_dash.h \
    ../core/fpdfdoc/cpvt_floatrect.h \
    ../core/fpdfdoc/cpvt_fontmap.h \
    ../core/fpdfdoc/cpvt_generateap.h \
    ../core/fpdfdoc/cpvt_line.h \
    ../core/fpdfdoc/cpvt_lineinfo.h \
    ../core/fpdfdoc/cpvt_secprops.h \
    ../core/fpdfdoc/cpvt_section.h \
    ../core/fpdfdoc/cpvt_sectioninfo.h \
    ../core/fpdfdoc/cpvt_word.h \
    ../core/fpdfdoc/cpvt_wordinfo.h \
    ../core/fpdfdoc/cpvt_wordplace.h \
    ../core/fpdfdoc/cpvt_wordprops.h \
    ../core/fpdfdoc/cpvt_wordrange.h \
    ../core/fpdfdoc/csection.h \
    ../core/fpdfdoc/ctypeset.h \
    ../core/fpdfdoc/fpdf_tagged.h \
    ../core/fpdfdoc/ipdf_formnotify.h \
    ../core/fpdfdoc/ipvt_fontmap.h \
    ../core/fpdfdoc/tagged_int.h \
    ../core/fpdftext/cpdf_linkextract.h \
    ../core/fpdftext/cpdf_textpage.h \
    ../core/fpdftext/cpdf_textpagefind.h \
    ../core/fpdftext/unicodenormalizationdata.h \
    ../core/fxcodec/codec/ccodec_basicmodule.h \
    ../core/fxcodec/codec/ccodec_bmpmodule.h \
    ../core/fxcodec/codec/ccodec_faxmodule.h \
    ../core/fxcodec/codec/ccodec_flatemodule.h \
    ../core/fxcodec/codec/ccodec_gifmodule.h \
    ../core/fxcodec/codec/ccodec_iccmodule.h \
    ../core/fxcodec/codec/ccodec_jbig2module.h \
    ../core/fxcodec/codec/ccodec_jpegmodule.h \
    ../core/fxcodec/codec/ccodec_jpxmodule.h \
    ../core/fxcodec/codec/ccodec_pngmodule.h \
    ../core/fxcodec/codec/ccodec_progressivedecoder.h \
    ../core/fxcodec/codec/ccodec_scanlinedecoder.h \
    ../core/fxcodec/codec/ccodec_tiffmodule.h \
    ../core/fxcodec/codec/codec_int.h \
    ../core/fxcodec/jbig2/JBig2_ArithDecoder.h \
    ../core/fxcodec/jbig2/JBig2_ArithIntDecoder.h \
    ../core/fxcodec/jbig2/JBig2_BitStream.h \
    ../core/fxcodec/jbig2/JBig2_Context.h \
    ../core/fxcodec/jbig2/JBig2_Define.h \
    ../core/fxcodec/jbig2/JBig2_GrdProc.h \
    ../core/fxcodec/jbig2/JBig2_GrrdProc.h \
    ../core/fxcodec/jbig2/JBig2_GsidProc.h \
    ../core/fxcodec/jbig2/JBig2_HtrdProc.h \
    ../core/fxcodec/jbig2/JBig2_HuffmanDecoder.h \
    ../core/fxcodec/jbig2/JBig2_HuffmanTable.h \
    ../core/fxcodec/jbig2/JBig2_HuffmanTable_Standard.h \
    ../core/fxcodec/jbig2/JBig2_Image.h \
    ../core/fxcodec/jbig2/JBig2_Page.h \
    ../core/fxcodec/jbig2/JBig2_PatternDict.h \
    ../core/fxcodec/jbig2/JBig2_PddProc.h \
    ../core/fxcodec/jbig2/JBig2_SddProc.h \
    ../core/fxcodec/jbig2/JBig2_Segment.h \
    ../core/fxcodec/jbig2/JBig2_SymbolDict.h \
    ../core/fxcodec/jbig2/JBig2_TrdProc.h \
    ../core/fxcodec/lbmp/fx_bmp.h \
    ../core/fxcodec/lgif/fx_gif.h \
    ../core/fxcodec/fx_codec.h \
    ../core/fxcodec/fx_codec_def.h \
    ../core/fxcodec/JBig2_DocumentContext.h \
    ../core/fxcrt/cfx_maybe_owned.h \
    ../core/fxcrt/cfx_observable.h \
    ../core/fxcrt/cfx_retain_ptr.h \
    ../core/fxcrt/cfx_shared_copy_on_write.h \
    ../core/fxcrt/cfx_string_c_template.h \
    ../core/fxcrt/cfx_string_data_template.h \
    ../core/fxcrt/cfx_string_pool_template.h \
    ../core/fxcrt/cfx_weak_ptr.h \
    ../core/fxcrt/extension.h \
    ../core/fxcrt/fx_basic.h \
    ../core/fxcrt/fx_bidi.h \
    ../core/fxcrt/fx_coordinates.h \
    ../core/fxcrt/fx_ext.h \
    ../core/fxcrt/fx_memory.h \
    ../core/fxcrt/fx_safe_types.h \
    ../core/fxcrt/fx_stream.h \
    ../core/fxcrt/fx_string.h \
    ../core/fxcrt/fx_system.h \
    ../core/fxcrt/fx_ucd.h \
    ../core/fxcrt/fx_xml.h \
    ../core/fxcrt/fxcrt_posix.h \
    ../core/fxcrt/fxcrt_windows.h \
    ../core/fxcrt/xml_int.h \
    ../core/fxge/agg/fx_agg_driver.h \
    ../core/fxge/dib/dib_int.h \
    ../core/fxge/fontdata/chromefontdata/chromefontdata.h \
    ../core/fxge/ge/cfx_cliprgn.h \
    ../core/fxge/ge/cfx_folderfontinfo.h \
    ../core/fxge/ge/cttfontdesc.h \
    ../core/fxge/ge/fx_text_int.h \
    ../public/fpdf_dataavail.h \
    ../public/fpdf_doc.h \
    ../public/fpdf_edit.h \
    ../public/fpdf_ext.h \
    ../public/fpdf_flatten.h \
    ../public/fpdf_formfill.h \
    ../public/fpdf_fwlevent.h \
    ../public/fpdf_ppo.h \
    ../public/fpdf_progressive.h \
    ../public/fpdf_save.h \
    ../public/fpdf_searchex.h \
    ../public/fpdf_structtree.h \
    ../public/fpdf_sysfontinfo.h \
    ../public/fpdf_text.h \
    ../public/fpdf_transformpage.h \
    ../public/fpdfview.h \
    ../third_party/agg23/agg_array.h \
    ../third_party/agg23/agg_basics.h \
    ../third_party/agg23/agg_clip_liang_barsky.h \
    ../third_party/agg23/agg_color_gray.h \
    ../third_party/agg23/agg_conv_adaptor_vcgen.h \
    ../third_party/agg23/agg_conv_dash.h \
    ../third_party/agg23/agg_conv_stroke.h \
    ../third_party/agg23/agg_curves.h \
    ../third_party/agg23/agg_math.h \
    ../third_party/agg23/agg_math_stroke.h \
    ../third_party/agg23/agg_path_storage.h \
    ../third_party/agg23/agg_pixfmt_gray.h \
    ../third_party/agg23/agg_rasterizer_scanline_aa.h \
    ../third_party/agg23/agg_render_scanlines.h \
    ../third_party/agg23/agg_renderer_base.h \
    ../third_party/agg23/agg_renderer_scanline.h \
    ../third_party/agg23/agg_rendering_buffer.h \
    ../third_party/agg23/agg_scanline_u.h \
    ../third_party/agg23/agg_shorten_path.h \
    ../third_party/agg23/agg_vcgen_dash.h \
    ../third_party/agg23/agg_vcgen_stroke.h \
    ../third_party/agg23/agg_vertex_sequence.h \
    ../third_party/zlib_v128/crc32.h \
    ../third_party/zlib_v128/deflate.h \
    ../third_party/zlib_v128/gzguts.h \
    ../third_party/zlib_v128/inffast.h \
    ../third_party/zlib_v128/inffixed.h \
    ../third_party/zlib_v128/inflate.h \
    ../third_party/zlib_v128/inftrees.h \
    ../third_party/zlib_v128/trees.h \
    ../third_party/zlib_v128/zconf.h \
    ../third_party/zlib_v128/zlib.h \
    ../third_party/zlib_v128/zutil.h \
    ../third_party/lcms2-2.6/include/lcms2.h \
    ../third_party/lcms2-2.6/include/lcms2_plugin.h \
    ../third_party/lcms2-2.6/src/lcms2_internal.h \
    ../fpdfsdk/cba_annotiterator.h \
    ../fpdfsdk/cfx_systemhandler.h \
    ../fpdfsdk/cpdfsdk_annot.h \
    ../fpdfsdk/cpdfsdk_annothandlermgr.h \
    ../fpdfsdk/cpdfsdk_annotiterator.h \
    ../fpdfsdk/cpdfsdk_baannot.h \
    ../fpdfsdk/cpdfsdk_baannothandler.h \
    ../fpdfsdk/cpdfsdk_datetime.h \
    ../fpdfsdk/cpdfsdk_formfillenvironment.h \
    ../fpdfsdk/cpdfsdk_interform.h \
    ../fpdfsdk/cpdfsdk_pageview.h \
    ../fpdfsdk/cpdfsdk_widget.h \
    ../fpdfsdk/cpdfsdk_widgethandler.h \
    ../fpdfsdk/fpdfview_c_api_test.h \
    ../fpdfsdk/fsdk_actionhandler.h \
    ../fpdfsdk/fsdk_common.h \
    ../fpdfsdk/fsdk_define.h \
    ../fpdfsdk/fsdk_pauseadapter.h \
    ../fpdfsdk/ipdfsdk_annothandler.h \
    ../fpdfsdk/pdfsdk_fieldaction.h \
    ../fpdfsdk/formfiller/cba_fontmap.h \
    ../fpdfsdk/formfiller/cffl_checkbox.h \
    ../fpdfsdk/formfiller/cffl_combobox.h \
    ../fpdfsdk/formfiller/cffl_formfiller.h \
    ../fpdfsdk/formfiller/cffl_interactiveformfiller.h \
    ../fpdfsdk/formfiller/cffl_listbox.h \
    ../fpdfsdk/formfiller/cffl_pushbutton.h \
    ../fpdfsdk/formfiller/cffl_radiobutton.h \
    ../fpdfsdk/formfiller/cffl_textfield.h \
    ../fpdfsdk/fxedit/fx_edit.h \
    ../fpdfsdk/fxedit/fxet_edit.h \
    ../fpdfsdk/fxedit/fxet_list.h \
    ../fpdfsdk/pdfwindow/PWL_Button.h \
    ../fpdfsdk/pdfwindow/PWL_Caret.h \
    ../fpdfsdk/pdfwindow/PWL_ComboBox.h \
    ../fpdfsdk/pdfwindow/PWL_Edit.h \
    ../fpdfsdk/pdfwindow/PWL_EditCtrl.h \
    ../fpdfsdk/pdfwindow/PWL_FontMap.h \
    ../fpdfsdk/pdfwindow/PWL_Icon.h \
    ../fpdfsdk/pdfwindow/PWL_ListBox.h \
    ../fpdfsdk/pdfwindow/PWL_ScrollBar.h \
    ../fpdfsdk/pdfwindow/PWL_SpecialButton.h \
    ../fpdfsdk/pdfwindow/PWL_Utils.h \
    ../fpdfsdk/pdfwindow/PWL_Wnd.h \
    ../fpdfsdk/javascript/ijs_context.h \
    ../fpdfsdk/javascript/ijs_runtime.h

mac: HEADERS += \
    ../core/fxge/apple/apple_int.h

win32: HEADERS += \
    ../core/fxge/win32/cfx_psrenderer.h \
    ../core/fxge/win32/cfx_windowsdib.h \
    ../core/fxge/win32/cpsoutput.h \
    ../core/fxge/win32/dwrite_int.h \
    ../core/fxge/win32/win32_int.h


unix {
    target.path = /usr/lib
    INSTALLS += target
}
