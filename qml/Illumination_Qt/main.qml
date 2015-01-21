import QtQuick 1.0

Rectangle {
    width: 800
    height: 480
    focus: true
    property int toValue
    Image{
        id: bg
        source: "bg.png"
    }
    Text{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 16
        font.pointSize: 30
        text: "Illumination"
        color: "white"
    }

    BorderImage {
        id: sliderBG
        source: "slider bg.png"
        anchors.centerIn: parent
        width: 600; height: 8
        border.left: 5
        border.right: 5
    }
    BorderImage {
        id: sliderFill
        source: "fill.png"
        width: 100; height: 6
        border.left: 4
        border.right: 4
        anchors.left: sliderBG.left
        anchors.leftMargin: 1
        anchors.verticalCenter: sliderBG.verticalCenter
    }
    Image{
        id: knob
        source: "knob.png"
        anchors.top: sliderFill.top
        anchors.topMargin: -6
        anchors.horizontalCenter: sliderFill.right
    }

    Text {
        id: text
        property int value: 0
        text: (value * 0.00107 + 0.0418).toFixed(2)+"V"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: sliderBG.top
        anchors.bottomMargin: 10
        font.pointSize: 20
        color: "white"
        onValueChanged: {
            Colour.setValue(value)
            sliderFill.width = (value / 4095) * 600
        }
    }
    Grid{
        anchors.bottom: parent.bottom
        columns: 12
        width: parent.width

        x: 4
        BorderImage{
            id: button1
            width: parent.width / 12
            border.top: 6; border.bottom: 6
            border.left: 6; border.right: 6
            source: "button.png"
            Text{
                anchors.centerIn: parent
                text: "0%"
                color: "white"
            }
        }
        BorderImage{
            id: button2
            width: parent.width / 12
            border.top: 6; border.bottom: 6
            border.left: 6; border.right: 6
            source: "button.png"
            Text{
                anchors.centerIn: parent
                text: "9%"
                color: "white"
            }
        }
        BorderImage{
            id: button3
            width: parent.width / 12
            border.top: 6; border.bottom: 6
            border.left: 6; border.right: 6
            source: "button.png"
            Text{
                anchors.centerIn: parent
                text: "18%"
                color: "white"
            }
        }
        BorderImage{
            id: button4
            width: parent.width / 12
            border.top: 6; border.bottom: 6
            border.left: 6; border.right: 6
            source: "button.png"
            Text{
                anchors.centerIn: parent
                text: "27%"
                color: "white"
            }
        }
        BorderImage{
            id: button5
            width: parent.width / 12
            border.top: 6; border.bottom: 6
            border.left: 6; border.right: 6
            source: "button.png"
            Text{
                anchors.centerIn: parent
                text: "36%"
                color: "white"
            }
        }
        BorderImage{
            id: button6
            width: parent.width / 12
            border.top: 6; border.bottom: 6
            border.left: 6; border.right: 6
            source: "button.png"
            Text{
                anchors.centerIn: parent
                text: "45%"
                color: "white"
            }
        }
        BorderImage{
            id: button7
            width: parent.width / 12
            border.top: 6; border.bottom: 6
            border.left: 6; border.right: 6
            source: "button.png"
            Text{
                anchors.centerIn: parent
                text: "55%"
                color: "white"
            }
        }
        BorderImage{
            id: button8
            width: parent.width / 12
            border.top: 6; border.bottom: 6
            border.left: 6; border.right: 6
            source: "button.png"
            Text{
                anchors.centerIn: parent
                text: "64%"
                color: "white"
            }
        }
        BorderImage{
            id: button9
            width: parent.width / 12
            border.top: 6; border.bottom: 6
            border.left: 6; border.right: 6
            source: "button.png"
            Text{
                anchors.centerIn: parent
                text: "73%"
                color: "white"
            }
        }
        BorderImage{
            id: button10
            width: parent.width / 12
            border.top: 6; border.bottom: 6
            border.left: 6; border.right: 6
            source: "button.png"
            Text{
                anchors.centerIn: parent
                text: "82%"
                color: "white"
            }
        }
        BorderImage{
            id: button11
            width: parent.width / 12
            border.top: 6; border.bottom: 6
            border.left: 6; border.right: 6
            source: "button.png"
            Text{
                anchors.centerIn: parent
                text: "91%"
                color: "white"
            }
        }
        BorderImage{
            id: button12
            width: parent.width / 12
            border.top: 6; border.bottom: 6
            border.left: 6; border.right: 6
            source: "button.png"
            Text{
                anchors.centerIn: parent
                text: "100%"
                color: "white"
            }
        }
    }

    MouseArea {
        id: mousearea
        anchors.fill: parent
        onClicked: {
            Qt.quit()
        }
    }
    SequentialAnimation {
        id: animation
        running: true
        loops: Animation.Infinite
        NumberAnimation { target: text; property: "value"; duration: 3000; to: 4095; /*easing.type: Easing.OutQuad*/ }
        NumberAnimation { target: text; property: "value"; duration: 3000; to: 1000; /*easing.type: Easing.OutQuad*/ }
    }
    NumberAnimation { running:false; target: text; id: animate; property: "value"; duration: 200; to:toValue; /*easing.type: Easing.InOutQuad */}
    Keys.onPressed: {
        if (event.key === Qt.Key_A)
        {
            button1.source = "button.png";
        }
        else if (event.key === Qt.Key_B)
        {
            button2.source = "button.png";
        }
        else if (event.key === Qt.Key_C)
        {
            button3.source = "button.png";
        }
        else if (event.key === Qt.Key_D)
        {
            button4.source = "button.png";
        }
        else if (event.key === Qt.Key_E)
        {
            button5.source = "button.png";
        }
        else if (event.key === Qt.Key_F)
        {
            button6.source = "button.png";
        }
        else if (event.key === Qt.Key_G)
        {
            button7.source = "button.png";
        }
        else if (event.key === Qt.Key_H)
        {
            button8.source = "button.png";
        }
        else if (event.key === Qt.Key_I)
        {
            button9.source = "button.png";
        }
        else if (event.key === Qt.Key_J)
        {
            button10.source = "button.png";
        }
        else if (event.key === Qt.Key_K)
        {
            button11.source = "button.png";
        }
        else if (event.key === Qt.Key_L)
        {
            button12.source = "button.png";
        }
    }

    Keys.onReleased: {
        animation.running = false;

        if (event.key === Qt.Key_A)
        {
            toValue = 0;
            button1.source = "button-pressed.png";
        }
        else if (event.key === Qt.Key_B)
        {
            toValue = 4095 * 0.09;
            button2.source = "button-pressed.png";
        }
        else if (event.key === Qt.Key_C)
        {
            toValue = 4095 * 0.18;
            button3.source = "button-pressed.png";
        }
        else if (event.key === Qt.Key_D)
        {
            toValue = 4095 * 0.27;
            button4.source = "button-pressed.png";
        }
        else if (event.key === Qt.Key_E)
        {
            toValue = 4095 * 0.36;
            button5.source = "button-pressed.png";
        }
        else if (event.key === Qt.Key_F)
        {
            toValue = 4095 * 0.45;
            button6.source = "button-pressed.png";
        }
        else if (event.key === Qt.Key_G)
        {
            toValue = 4095 * 0.55;
            button7.source = "button-pressed.png";
        }
        else if (event.key === Qt.Key_H)
        {
            toValue = 4095 * 0.64;
            button8.source = "button-pressed.png";
        }
        else if (event.key === Qt.Key_I)
        {
            toValue = 4095 * 0.73;
            button9.source = "button-pressed.png";
        }
        else if (event.key === Qt.Key_J)
        {
            toValue = 4095 * 0.82;
            button10.source = "button-pressed.png";
        }
        else if (event.key === Qt.Key_K)
        {
            toValue = 4095 * 0.91;
            button11.source = "button-pressed.png";
        }
        else if (event.key === Qt.Key_L)
        {
            toValue = 4095
            button12.source = "button-pressed.png";
        }
        if (!animate.running)
        {
            animate.running = true;
        }
    }
}
