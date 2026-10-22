cmake_minimum_required(VERSION 3.16)
set(QT_CREATOR_SKIP_PACKAGE_MANAGER_SETUP ON)

project(Messanger LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 REQUIRED COMPONENTS Gui Qml Core)
find_package(Qt6 REQUIRED COMPONENTS Gui Qml Core)

# Подпроекты
add_subdirectory(src)

# add_subdirectory(AnotherSubproject)
