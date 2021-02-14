#include "basicrotateanimation.h"
#include "globals.h"

/**
 * @brief Constructor
 * @param parent Parent object
 * 1s duration, complete rotation, repeat forever.
 */
BasicRotateAnimation::BasicRotateAnimation(QObject *parent) : QVariantAnimation(parent)
{
    setDuration(G_ANIMATION_DURATION_MS);
    setStartValue(G_ANIMATION_START_ANGLE);
    setEndValue(G_ANIMATION_END_ANGLE);
    setLoopCount(G_ANIMATION_LOOP_COUNT);
}

/**
 * @brief Toggles start/pause animation
 * @param start True to start animation
 */
void BasicRotateAnimation::stopStart(bool start)
{
    if (start == true)
        this->start();
    else
        pause();
}

/**
 * @brief Set duration value
 * @param msecs Animation duration (in milliseconds)
 */
void BasicRotateAnimation::setDuration(int msecs)
{
    QVariantAnimation::setDuration(msecs);
}
