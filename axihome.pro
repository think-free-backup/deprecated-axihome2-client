# Add more folders to ship with the application, here
folder_01.source = qml/on-domo
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

QT += opengl network

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
# CONFIG += qdeclarative-boostable

# Please do not modify the following two lines. Required for deployment.
#include(qmlapplicationviewer/qmlapplicationviewer.pri)
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    src/Base/VariableModel/systemvariable.h \
    src/Base/VariableModel/variablemodelmanager.h \
    src/Base/NodeCommunication/nodejscommunication.h \
    src/Base/NodeCommunication/heartbeatmanager.h \
    src/Base/Log/log.h \
    src/Base/ShortCut/shortcut.h \
    src/Base/PlatformInfo/platforminfo.h \
    src/Base/Application/qmlbaseapplication.h \
    src/Base/QmlViewer/qmldroidviewer.h \
    src/Base/NodeCommunication/networkmanager.h

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += \
    src/main.cpp \
    src/Base/VariableModel/systemvariable.cpp \
    src/Base/VariableModel/variablemodelmanager.cpp \
    src/Base/NodeCommunication/nodejscommunication.cpp \
    src/Base/NodeCommunication/heartbeatmanager.cpp \
    src/Base/Log/log.cpp \
    src/Base/ShortCut/shortcut.cpp \
    src/Base/PlatformInfo/platforminfo.cpp \
    src/Base/Application/qmlbaseapplication.cpp \
    src/Base/QmlViewer/qmldroidviewer.cpp \
    src/Base/NodeCommunication/networkmanager.cpp

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += \
    android/AndroidManifest.xml \
    android/src/org/thinkfree/QtServiceActivity.java \
    android/src/org/thinkfree/QtService.java \
    android/src/org/thinkfree/NFC/NdefMessageParser.java \
    android/src/org/thinkfree/NFC/TagViewer.java \
    android/src/org/thinkfree/NFC/record/ParsedNdefRecord.java \
    android/src/org/thinkfree/NFC/record/SmartPoster.java \
    android/src/org/thinkfree/NFC/record/TextRecord.java \
    android/src/org/thinkfree/NFC/record/UriRecord.java
