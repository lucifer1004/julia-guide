cmake_minimum_required(VERSION 3.15)

project(JuliaGuide)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

find_package(Julia REQUIRED)
add_subdirectory(interoperability/c)
