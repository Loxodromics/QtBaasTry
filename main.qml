import QtQuick 2.11
import QtQuick.Controls 2.4
import BaaS 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Tabs")


    Parse {
        id:backend
        hostURI:"https://parseapi.back4app.com"
        applicationId:"application"
        masterKey:"masterkey"
        restKey: "restkey"
    }

    BaaSModel{
        id: baasmodel
        source: backend
        endPoint:"users"
    }

    ListView{
        anchors.fill: parent
        model: baasmodel
    }

    Button {
        id: registerButton
        text: "register"

        anchors.top: parent.top

        onClicked: {
            backend.registerUser("philipp", "543211!")
        }
    }

    Button {
        id: loginButton
        text: "login"

        anchors.top: registerButton.bottom
        onClicked: {
            backend.signIn("philipp", "543211!")
        }
    }

//    footer: TabBar {
//        id: tabBar
//        currentIndex: swipeView.currentIndex

//        TabButton {
//            text: qsTr("Page 1")
//        }
//        TabButton {
//            text: qsTr("Page 2")
//        }
//    }
}
