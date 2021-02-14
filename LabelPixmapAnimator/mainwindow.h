#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QtWidgets>
#include "startstopbutton.h"
#include "basicrotateanimation.h"
#include "smoothrotateanimation.h"
#include "steprotateanimation.h"
#include "textedit.h"


class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private:
    void setupLayout();

private:
    QHBoxLayout *m_mainLayout;
    QVBoxLayout *m_layout1;
    QLabel *m_label1;
    StartStopButton *m_button1;
    QVBoxLayout *m_layout2;
    QLabel *m_label2;
    StartStopButton *m_button2;
    QVBoxLayout *m_layout3;
    QLabel *m_label3;
    StartStopButton *m_button3;


    QPixmap m_image;
    BasicRotateAnimation m_animation1;
    SmoothRotateAnimation m_animation2;
    StepRotateAnimation m_animation3;
};
#endif // MAINWINDOW_H
