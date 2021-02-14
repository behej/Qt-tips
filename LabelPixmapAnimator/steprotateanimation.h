#ifndef STEPROTATEANIMATION_H
#define STEPROTATEANIMATION_H

#include "basicrotateanimation.h"


/**
 * @brief Animation for rotation with steps
 * Subclass of variant animation for value between 0 and 360 degrees.
 * Base speed is 1 rpm. Can be changed using setDuration method.
 * Animation doesn't rotate smoothly but has a limited number of steps.
 */
class StepRotateAnimation : public BasicRotateAnimation
{
public:
    StepRotateAnimation(int stepNumber, QObject * parent = nullptr);
protected:
    virtual QVariant interpolated(const QVariant &from, const QVariant &to, qreal progress) const override;

private:
    int m_steps;
};

#endif // STEPROTATEANIMATION_H
