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
    src/VariableModel/systemvariable.h \
    src/VariableModel/variablemodelmanager.h \
    src/NodeCommunication/nodejscommunication.h \
    src/NodeCommunication/heartbeatmanager.h \
    src/Log/log.h \
    src/ShortCut/shortcut.h \
    src/PlatformInfo/platforminfo.h \
    src/Application/qmlbaseapplication.h \
    src/QmlViewer/qmldroidviewer.h \
    src/NodeCommunication/networkmanager.h

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += \
    src/main.cpp \
    src/VariableModel/systemvariable.cpp \
    src/VariableModel/variablemodelmanager.cpp \
    src/NodeCommunication/nodejscommunication.cpp \
    src/NodeCommunication/heartbeatmanager.cpp \
    src/Log/log.cpp \
    src/ShortCut/shortcut.cpp \
    src/PlatformInfo/platforminfo.cpp \
    src/Application/qmlbaseapplication.cpp \
    src/QmlViewer/qmldroidviewer.cpp \
    src/NodeCommunication/networkmanager.cpp

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
