#include "qmlbaseapplication.h"

QmlBaseApplication::QmlBaseApplication(QString qmlfile, QWidget *parent) : QWidget(parent)
{
    qmlRegisterType<SystemVariable>("org.arisnova.jsonstring", 1, 0, "JsonString");
    qmlRegisterType<Shortcut>("org.arisnova.shortcut", 1, 0, "Shortcut");

    m_qmlFile = qmlfile;

    m_networkManager = new NetworkManager("10.0.0.2",this);
    m_model = new VariableModelManager(this);
        QObject::connect(m_networkManager, SIGNAL(loggedChanged(bool)), m_model, SLOT(setServerAvailable(bool)));
        QObject::connect(m_networkManager, SIGNAL(systemVariableChanged(QString,QString,QVariant)), m_model, SLOT(updateSystemVariable(QString,QString,QVariant)));
        QObject::connect(m_model, SIGNAL(requestVariable(QString,QString)), m_networkManager, SLOT(requestVariable(QString,QString)));
        QObject::connect(m_model, SIGNAL(releaseVariable(QString)), m_networkManager, SLOT(releaseVariable(QString)));

        //m_model->localVariable("rpcActivated", false);

    m_osInfo = new PlatformInfo(this);
    m_viewer = new QmlDroidViewer();

    QQmlContext *context = m_viewer->rootContext();
        context->setContextProperty("variablesModel",m_model);
        context->setContextProperty("osInfo",m_osInfo);
        context->setContextProperty("network", m_networkManager);
        context->setContextProperty("viewer", m_viewer);
}

void QmlBaseApplication::show(){

    m_viewer->setMainQmlFile(m_qmlFile);

    if (m_osInfo->platform() != "Android"){
        m_viewer->setHeight(600);
        m_viewer->setWidth(800);
        m_viewer->show();
    }
    else{
        m_viewer->showExpanded();
    }
}

QQmlContext * QmlBaseApplication::getContext(){

    return m_viewer->rootContext();
}
