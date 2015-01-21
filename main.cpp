#include <QApplication>
#include <QDeclarativeContext>
#include <QWSServer>
#include "qmlapplicationviewer.h"
#include "Colour.h"


Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));
    Colour colour;
    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/Illumination_Qt/main.qml"));
    viewer.showExpanded();
    viewer.rootContext()->setContextProperty("Colour", &colour);
#ifdef ON_DEV
    viewer.showFullScreen();
    QWSServer::setCursorVisible(false);
    app->setOverrideCursor(Qt::BlankCursor);
#endif
    return app->exec();
}
