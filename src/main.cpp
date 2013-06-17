#include <QApplication>

#include "Application/qmlbaseapplication.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // Instanciate application

    QmlBaseApplication * baseApp = new QmlBaseApplication("qml/on-domo/main.qml");
        baseApp->show();

    return app.exec();

    // In QtActivity.java : setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_NOSENSOR);
}
