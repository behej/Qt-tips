#include "steprotateanimation.h"
#include <QtMath>

/**
 * @brief Constructor
 * @param stepNumber Number of steps for a complete rotation
 * @param parent Parent object
 */
StepRotateAnimation::StepRotateAnimation(int stepNumber, QObject *parent)
    : BasicRotateAnimation(parent), m_steps(stepNumber)
{
}

/**
 * @brief StepRotateAnimation::interpolated
 * @param from Start value for animation
 * @param to End value for animation
 * @param progress Current advancement of animation. Between 0.0 and 1.0.
 * @return Value of animation to apply.
 * Reimplementing this function allows to define custom animation values.
 * In this case, value evolves in steps. Number of steps is defined through constructor.
 * All steps have the same value and are homogeneously distributed over duration.
 */
QVariant StepRotateAnimation::interpolated(const QVariant &from, const QVariant &to, qreal progress) const
{
    const qreal stepValue = (to.toReal() - from.toReal()) / (qreal)m_steps;
    const qreal currentStep = floor(progress * (qreal)m_steps);

    return QVariant(stepValue * currentStep);
}
