#ifndef SMOOTHROTATEANIMATION_H
#define SMOOTHROTATEANIMATION_H

#include "basicrotateanimation.h"

/**
 * @brief Animation for rotation with accel/decel around 0 deg.
 * Subclass of variant animation for value between 0 and 360 degrees.
 * Base speed is 1 rpm. Can be changed using setDuration method.
 * Nul speed around angle 0 deg. Smoothly accelerates and then
 * smoothly decelerates when completing full turn.
 */
class SmoothRotateAnimation : public BasicRotateAnimation
{
public:
    SmoothRotateAnimation(QObject * parent = nullptr);
};

#endif // SMOOTHROTATEANIMATION_H
