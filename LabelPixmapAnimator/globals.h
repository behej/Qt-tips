#ifndef GLOBALS_H
#define GLOBALS_H

#include <QString>

constexpr int G_LABEL_WIDTH = 250;      //!< Minimum width for label containing pixmap
constexpr int G_LABEL_HEIGHT = 250;     //!< Minimum height for label containing pixmap

constexpr int G_ANIMATION_DURATION_MS = 2000;       //!< Duration for animation (in ms)
constexpr double G_ANIMATION_START_ANGLE = 0.0;     //!< Start angle for animation
constexpr double G_ANIMATION_END_ANGLE = 360.0;     //!< End angle for animation (360 = complete rotation)
constexpr signed int G_ANIMATION_LOOP_COUNT = -1;   //!< Loop count for animation. -1 = infinite animation
constexpr int G_STEPS = 5;                          //!< Number of steps for stepped animation

const QString G_ANIMATION1_DESCRIPTION("Use of QVariantAnimation in its basic form to rotate a QPixMap. \
QVariantAnimation is subclassed only to simplify code in MainWindow: parameters settings and convenience slots. \
Connection between animation and pixmap is realized using lambda function directly into MainWindow.");
const QString G_ANIMATION2_DESCRIPTION("Same principle as basic animation. Only difference is the use of easing function \
to modify rotation speed. Used easing function smoothly accelerates and decelerates around nul angle. Several predefined \
easing functions are available. Refer to Qt documentation for more info.");
const QString G_ANIMATION3_DESCRIPTION("Instead of using predefined easing functions, we now define our own easing \
function by overriding the interpolated method. In this example, interpolated function is not continuous but behaves with steps. \
It is possible to define any behaviour we wish.");




#endif // GLOBALS_H
