#include "mainwindow.h"
#include "globals.h"


/**
 * @brief Constructor
 * @param parent Parent widget
 */
MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent),
      m_image(":/tux.png"), m_animation1(this), m_animation2(this), m_animation3(G_STEPS, this)
{
    setupLayout();

    // Animation 1: constant speed rotation
    //=====================================
    /* First connection is to start and stop animation when button is clicked.
     * - Animation is a class that produces periodically a value that evolves from
     *   a start value to an end value in a given time.
     * Second connection is to use value provided by animation in order to perform
     * a transformation (a rotation in this case).
     * - We create a transorm class and we set transformation to be a rotation of given angle.
     * - Transformation is applied to pixmap (note that tranformation returns a copy and doesn't
     *   modify original object). New transformed pixmap is assigned to label for display.
     */
    connect(m_button1, &QPushButton::clicked, &m_animation1, &BasicRotateAnimation::stopStart);
    connect(&m_animation1, &QVariantAnimation::valueChanged, [=](const QVariant &val){
       QTransform t;
       t.rotate(val.toReal());
       m_label1->setPixmap(m_image.transformed(t));
    });

    // Animation 2: smooth accel and decel around nul angle
    //=====================================================
    connect(m_button2, &QPushButton::clicked, &m_animation2, &BasicRotateAnimation::stopStart);
    connect(&m_animation2, &QVariantAnimation::valueChanged, [=](const QVariant &val){
       QTransform t;
       t.rotate(val.toReal());
       m_label2->setPixmap(m_image.transformed(t));
    });

    // Animation 3: custom easing curve
    //=================================
    connect(m_button3, &QPushButton::clicked, &m_animation3, &BasicRotateAnimation::stopStart);
    connect(&m_animation3, &QVariantAnimation::valueChanged, [=](const QVariant &val){
       QTransform t;
       t.rotate(val.toReal());
       m_label3->setPixmap(m_image.transformed(t));
    });
}

/**
 * @brief Destructor
 */
MainWindow::~MainWindow()
{
}

/**
 * @brief Build mainWindow
 */
void MainWindow::setupLayout()
{
    // Main layout
    m_mainLayout = new QHBoxLayout();

    // 1st layout for 1st animation
    m_layout1 = new QVBoxLayout();
    m_label1 = new QLabel(this);
    m_label1->setMinimumSize(G_LABEL_WIDTH, G_LABEL_HEIGHT);
    m_label1->setAlignment(Qt::AlignCenter);
    m_button1 = new StartStopButton(this);
    m_layout1->addWidget(m_label1);
    m_layout1->addWidget(new TextEdit(G_ANIMATION1_DESCRIPTION, this));
    m_layout1->addWidget(m_button1);
    m_layout1->addStretch();

    // 2nd layout for 2nd animation
    m_layout2 = new QVBoxLayout();
    m_label2 = new QLabel(this);
    m_label2->setMinimumSize(G_LABEL_WIDTH, G_LABEL_HEIGHT);
    m_label2->setAlignment(Qt::AlignCenter);
    m_button2 = new StartStopButton(this);
    m_layout2->addWidget(m_label2);
    m_layout2->addWidget(new TextEdit(G_ANIMATION2_DESCRIPTION, this));
    m_layout2->addWidget(m_button2);
    m_layout2->addStretch();

    // 3rd layout for 3rd animation
    m_layout3 = new QVBoxLayout();
    m_label3 = new QLabel(this);
    m_label3->setMinimumSize(G_LABEL_WIDTH, G_LABEL_HEIGHT);
    m_label3->setAlignment(Qt::AlignCenter);
    m_button3 = new StartStopButton(this);
    m_layout3->addWidget(m_label3);
    m_layout3->addWidget(new TextEdit(G_ANIMATION3_DESCRIPTION, this));
    m_layout3->addWidget(m_button3);
    m_layout3->addStretch();

    // Add all layouts to mainWindow
    m_mainLayout->addLayout(m_layout1);
    m_mainLayout->addLayout(m_layout2);
    m_mainLayout->addLayout(m_layout3);
    this->setCentralWidget(new QWidget(this));
    this->centralWidget()->setLayout(m_mainLayout);

    // Set images to labels
    m_label1->setPixmap(m_image);
    m_label2->setPixmap(m_image);
    m_label3->setPixmap(m_image);
}
