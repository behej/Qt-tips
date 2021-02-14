#include "textedit.h"

TextEdit::TextEdit(const QString &text, QWidget *parent) : QTextEdit(text, parent)
{
    setReadOnly(true);
}
