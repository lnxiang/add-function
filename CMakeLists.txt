cmake_minimum_required(VERSION 3.1...3.29)
project (cmake_test VERSION 0.0.4)

set(HELLO_OUTPUT "${PROJECT_SOURCE_DIR}/../test-action/dist/x64")

link_directories("${HELLO_OUTPUT}/lib")

set(OUTPUT_DIRECTOY "${PROJECT_SOURCE_DIR}/dist/x64" CACHE PATH "output dir")
add_library(MyAddDemo SHARED main.cpp)
#link_directories("${OUTPUT_DIRECTOY}/lib")
target_link_libraries(MyAddDemo MyLibExample) 
set_target_properties(MyAddDemo PROPERTIES LIBRARY_OUTPUT_DIRECTORY "${OUTPUT_DIRECTOY}/lib" ARCHIVE_OUTPUT_DIRECTORY "${OUTPUT_DIRECTOY}/lib")

########################build package#############################
#seg package control info
SET(CPACK_GENERATOR "DEB")
SET(CPACK_PACKAGE_VENDOR "Test") #required
SET(CPACK_DEBIAN_PACKAGE_MAINTAINER "Lin") #required
SET(CPACK_PACKAGE_DIRECTORY ${PROJECT_SOURCE_DIR}/dist)
SET(CMAKE_INSTALL_BINDIR "/usr")
SET(VERSION "0.0.0.1")
if(DEFINED ENV{RDB_VERSION})
  SET(VERSION $ENV{RDB_VERSION})
endif()

SET(CPACK_PACKAGE_VERSION ${VERSION})
SET(CPACK_PACKAGE_NAME "add")
SET(CPACK_PACKAGE_FILE_NAME "add-${VERSION}")

INSTALL(TARGETS MyAddDemo RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
#set package postinst

INCLUDE(CPack)
