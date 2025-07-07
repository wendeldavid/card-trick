cmake_minimum_required(VERSION 3.31)
project(card-trick)

set(CMAKE_CXX_STANDARD 26)

file(GLOB_RECURSE SOURCES "src/**")

message(STATUS "Source files: ${SOURCES}")

add_executable(card-trick ${SOURCES}
        src/deck/Deck.cpp
        src/deck/Deck.h)