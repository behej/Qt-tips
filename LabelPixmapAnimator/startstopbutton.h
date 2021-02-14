#ifndef STARTSTOPBUTTON_H
#define STARTSTOPBUTTON_H

#include <QPushButton>

/**
 * @brief PushButton for stop and start actions
 * Start/Stop button that changed caption when clicked.
 * Emits true for start, then false for stop. And so on ...
 */
class StartStopButton : public QPushButton
{
Q_OBJECT
public:
    StartStopButton(QWidget *parent = nullptr);

private:
    void toggleCaption(bool start);
};

#endif // STARTSTOPBUTTON_H
