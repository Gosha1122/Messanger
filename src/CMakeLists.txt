cmake_minimum_required(VERSION 3.16)

project(Messanger VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick QuickControls2 Network)


qt_standard_project_setup(REQUIRES 6.5)
qt_policy(SET QTP0004 NEW)

qt_add_executable(appMessanger
    main.cpp
    backend/simplemodel.h
    backend/simplemodel.cpp
    backend/networkmanager.h
    backend/networkmanager.cpp
    res.qrc
)

qt_add_qml_module(appMessanger
    URI Messanger
    VERSION 1.0
    QML_FILES
        ui/Main.qml
        ui/RegisterForm2.qml
        ui/LeftColumn.qml
        ui/RightColumn.qml
        ui/CenterColumn.qml
        ui/RegisterForm.qml
    RESOURCES
        res.qrc
)



# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appMessanger PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appMessanger
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appMessanger
    PRIVATE Qt6::Quick
    PRIVATE Qt6::QuickControls2
    PRIVATE Qt6::Network
)

include(GNUInstallDirs)
install(TARGETS appMessanger
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
