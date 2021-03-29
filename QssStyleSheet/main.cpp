#include "mainwindow.h"

#include <QApplication>
#include <QFile>
#include <QFontDatabase>


void loadQss();
void loadFont();

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    loadQss();
    loadFont();
    MainWindow w;
    w.show();
    return a.exec();
}

/**
 * @brief load stylesheet file
 * setStyleSheet method takes as parameter a string formatted like CSS.
 * It is more common to store stylesheet into an external file, but file
 * can't be used directly.
 * File first needs to be read and content stored into a QString variable.
 * This variable can then be given to setStyleSheet method.
 */
void loadQss()
{
    QFile styleSheetFile(":/stylesheet.qss");
    styleSheetFile.open(QFile::ReadOnly);
    const QString stylesheet = styleSheetFile.readAll();

    qApp->setStyleSheet(stylesheet);
}

/**
 * @brief load font
 * Load font file from resources and make it available to whole
 * application, including stylesheet.
 */
void loadFont()
{
    QFontDatabase::addApplicationFont(":/font.ttf");
}
