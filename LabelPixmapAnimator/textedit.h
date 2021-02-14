#ifndef TEXTEDIT_H
#define TEXTEDIT_H

#include <QTextEdit>

class TextEdit : public QTextEdit
{
public:
    TextEdit(const QString& text, QWidget *parent = nullptr);
};

#endif // TEXTEDIT_H
