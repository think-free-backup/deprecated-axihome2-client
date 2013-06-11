#ifndef QMLBASEAPPLICATION_H
#define QMLBASEAPPLICATION_H

#include <QObject>
#include <QWidget>
#include <QQmlContext>

#include "../src/QmlViewer/qmldroidviewer.h"
#include "../src/NodeCommunication/networkmanager.h"
#include "../src/VariableModel/variablemodelmanager.h"
#include "../src/VariableModel/systemvariable.h"
#include "../src/PlatformInfo/platforminfo.h"
#include "../src/ShortCut/shortcut.h"

class QmlBaseApplication : public QWidget
{
    Q_OBJECT

    public:
        explicit QmlBaseApplication(QString qmlfile, QWidget *parent = 0);

    signals:

    public slots:
        void show();
        QQmlContext *getContext();

    private:

        NetworkManager * m_networkManager;
        VariableModelManager * m_model;
        PlatformInfo * m_osInfo;
        QmlDroidViewer * m_viewer;
        QString m_qmlFile;
};

#endif // QMLBASEAPPLICATION_H
