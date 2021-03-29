# Qt-tips
Some how-to's for a few Qt cool features

## LabelPixmapAnimator
Some examples of how to animate some QPixMap objects. Examples shown here consist
of rotating a simple png image contained within a QLabel. Principle can easily
be extended to other features.

__Note:__ To create an animation that only interract on basic properties of
a widget (such as position or size), you may rather consider QPropertyAnimator
class.

Available examples are:
1. Constant animation: Image rotates smoothly at constant speed.
1. Animation with predefined profile: Speed follows a predefined profile
for speed. There are several profiles available in Qt.
1. Custom animation: Equation for animation computation is user-defined. Example
shown here is a non linear movement.

## QssStyleSheet
A quick introduction to QssStyleSheet and also to font file.
* Load and apply a stylesheet stored in a file
* QssStyleSheet syntax
* Load a font file a make it available to application (incl. stylesheet)
