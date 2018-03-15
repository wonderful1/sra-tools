#-------------------------------------------------
#
# Project created by QtCreator 2017-05-24T11:29:35
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = sra-toolkit
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH +=  ../../../ncbi-vdb/interfaces

unix:!macx {
INCLUDEPATH +=  ../../../ncbi-vdb/interfaces/os/linux \
                ../../../ncbi-vdb/interfaces/os/unix \
                ../../../ncbi-vdb/interfaces/cc/gcc \
                ../../../ncbi-vdb/interfaces/cc/gcc/x86_64
LIBS += -L/home/boshkins/ncbi-outdir/ncbi-vdb/linux/gcc/x86_64/dbg/lib -lncbi-vdb -ldiagnose
}

macx {
    INCLUDEPATH +=  ../../../ncbi-vdb/interfaces/os/mac \
                    ../../../ncbi-vdb/interfaces/os/unix \
                    ../../../ncbi-vdb/interfaces/cc/gcc \
                    ../../../ncbi-vdb/interfaces/cc/gcc/x86_64

    CONFIG -= app_bundle

    CONFIG(debug) {
        BUILD = dbg
    } else {
        BUILD = rel
    }

    TARGDIR = $$OUT_PWD
    DESTDIR = $$TARGDIR

    make {
        LIBS += -L$$OUT_PWD/../../../../../../../../ncbi-vdb/mac/clang/x86_64/$$BUILD/lib -lncbi-vdb -ldiagnose
    } else {
# QCreator build
        LIBS += -L~/ncbi-outdir/ncbi-vdb/mac/clang/x86_64/$$BUILD/lib -lncbi-vdb -ldiagnose
    }
}

win32 {
    INCLUDEPATH += ../../../ncbi-vdb/interfaces/os/win \
                    ../../../ncbi-vdb/interfaces/cc/vc++

    CONFIG(debug) {
        BUILD = Debug
    } else {
        BUILD = Release
    }

    TARGDIR = $$OUT_PWD/../../../$$BUILD
    DESTDIR = $$TARGDIR/bin

    LIBS += $$OUT_PWD/../../../../../../../ncbi-vdb/win/v120/x64/$$BUILD/bin/ncbi-vdb-md.lib
}

OBJECTS_DIR = $$TARGDIR/obj/sra-toolkit
MOC_DIR = $$OBJECTS_DIR/.moc
RCC_DIR = $$OBJECTS_DIR/.rcc
UI_DIR = $$OBJECTS_DIR/.ui

SOURCES += main.cpp\
        sratoolkit.cpp \
        sratoolkitpreferences.cpp \
        sraworkspace.cpp \
        sratoolbar.cpp \
        sratoolview.cpp \
        config/sraconfigmodel.cpp \
        config/sraconfigview.cpp \
        ../vdb-config/configure.cpp \
        ../vdb-config/vdb-config-model.cpp \
        ../vdb-config/util.cpp \
        diagnostics/diagnosticstest.cpp \
        diagnostics/diagnosticsthread.cpp \
        diagnostics/sradiagnosticsview.cpp


HEADERS  += sratoolkit.h \
        sratoolkittemplate.h \
        sratoolkitglobals.h \
        sratoolkitpreferences.h \
        sraworkspace.h \
        sratoolbar.h \
        sratoolview.h \
        config/sraconfigmodel.h \
        config/sraconfigview.h \
        diagnostics/diagnosticstest.h \
        diagnostics/diagnosticsthread.h \
        diagnostics/sradiagnosticsview.h


RESOURCES += \
        resources.qrc

DISTFILES += \
    style.qss
