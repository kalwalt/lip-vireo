cmake_minimum_required(VERSION 3.0)
project(lip-vireo)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS " -Wall -fexceptions ")

# Add all the source files in your project
file(GLOB_RECURSE SOURCES "./*.cpp")
if(EMSCRIPTEN_COMP EQUAL 1)
    #list(FILTER SOURCES EXCLUDE REGEX ".*main\\.cpp$")
endif()

# Add executable
add_executable(${PROJECT_NAME} ${SOURCES})
if(EMSCRIPTEN_COMP EQUAL 1)
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -sUSE_LIBJPEG=1 -s USE_LIBPNG=1 -sUSE_ZLIB=1 ")
   set(CMAKE_LINK_LIBRARY_FLAG " -sSINGLE_FILE=1 ")
endif()

# Include directories
#target_include_directories(${PROJECT_NAME} PUBLIC /usr/include/lippng16)
