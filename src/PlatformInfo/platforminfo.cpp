#include "platforminfo.h"

PlatformInfo::PlatformInfo(QObject *parent) : QObject(parent)
{
    // Define platform variables

    QString OS;
    QString STORAGEPATH;
    bool TACTIL;

    #ifdef Q_OS_LINUX
        OS = "Linux";
        STORAGEPATH = QDir::homePath ();
        TACTIL = false;
    #endif
    #ifdef Q_OS_WIN
        OS = "Windows";
        STORAGEPATH = "/" + QDir::homePath ();
        TACTIL = false;
    #endif
    #ifdef Q_OS_MAC
        OS = "Mac";
        STORAGEPATH = QDir::homePath ();
        TACTIL = false;
    #endif
    #ifdef Q_OS_ANDROID
        OS = "Android";
        STORAGEPATH = getenv("EXTERNAL_STORAGE");
        TACTIL = true;
    #endif

    // Create storage folder if doesn't exists

    STORAGEPATH.append("/.acuity/");

    QDir dir;
    dir.mkdir(STORAGEPATH);

    // Set platform variables

    setPlatform(OS);
    setTactileScreen(TACTIL);
    setStoragePath(STORAGEPATH);
}
