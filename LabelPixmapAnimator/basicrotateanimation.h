#ifndef BASICROTATEANIMATION_H
#define BASICROTATEANIMATION_H

#include <QVariantAnimation>

/**
 * @brief Animation for rotation
 * Subclass of variant animation for value between 0 and 360 degrees.
 * Base speed is 1 rpm. Can be changed using setDuration method.
 */
class BasicRotateAnimation : public QVariantAnimation
{
Q_OBJECT
public:
    BasicRotateAnimation(QObject * parent = nullptr);
    void stopStart(bool start = false);
    void setDuration(int msecs);
};

#endif // BASICROTATEANIMATION_H
