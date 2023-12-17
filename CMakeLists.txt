cmake_minimum_required(VERSION 3.10)

project(tokenizers LANGUAGES CXX C VERSION 1.0)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --std=c++17")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(cmake/third_party.cmake)

include_directories(${PROJECT_SOURCE_DIR})
add_subdirectory(fast_tokenizer)
