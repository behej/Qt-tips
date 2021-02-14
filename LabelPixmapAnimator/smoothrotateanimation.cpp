#include "smoothrotateanimation.h"

/**
 * @brief Constuctor
 * @param parent Parent widget
 */
SmoothRotateAnimation::SmoothRotateAnimation(QObject *parent) : BasicRotateAnimation(parent)
{
    /* Profile of transformation can be customized with EasingCurves.
     * There are several profiles available such as accel, decel or both.
     * There are bouncing or elastic profiles as well.
     * See documentation for all available options
     */
    this->setEasingCurve(QEasingCurve::InOutQuad);
}
