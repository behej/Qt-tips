#include "startstopbutton.h"


/**
 * @brief Constructor
 * @param parent Parent widget
 */
StartStopButton::StartStopButton(QWidget *parent) : QPushButton(parent)
{
    this->setText("Start");
    this->setCheckable(true);

    connect(this, &QPushButton::clicked, this, &StartStopButton::toggleCaption);
}



/**
 * @brief Toggle button caption stop/start
 * @param start true when start button is clicked
 * Caption set to 'Stop' if parameter set to true.
 * Caption set to 'Start' oterwise.
 */
void StartStopButton::toggleCaption(bool start)
{
    if (start)
        this->setText("Stop");
    else
        this->setText("Start");
}
