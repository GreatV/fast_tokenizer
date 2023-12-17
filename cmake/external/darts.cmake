include(ExternalProject)

set(DARTS_PREFIX_DIR     ${THIRD_PARTY_PATH}/darts)
set(SOURCE_DIR ${THIRD_PARTY_ROOT}/darts)
set(DARTS_INCLUDE_DIR ${THIRD_PARTY_ROOT}/darts/include)
include_directories(${DARTS_INCLUDE_DIR})

ExternalProject_Add(
        extern_darts
        ${EXTERNAL_PROJECT_LOG_ARGS}
        SOURCE_DIR ${SOURCE_DIR}
        PREFIX            ${DARTS_PREFIX_DIR}
        # If we explicitly leave the `UPDATE_COMMAND` of the ExternalProject_Add
        # function in CMakeLists blank, it will cause another parameter GIT_TAG
        # to be modified without triggering incremental compilation, and the
        # third-party library version changes cannot be incorporated.
        # reference: https://cmake.org/cmake/help/latest/module/ExternalProject.html
        UPDATE_COMMAND    ""
        CONFIGURE_COMMAND ""
        BUILD_COMMAND     ""
        INSTALL_COMMAND   ""
        TEST_COMMAND      ""
)

add_library(darts INTERFACE)

add_dependencies(darts extern_darts)
