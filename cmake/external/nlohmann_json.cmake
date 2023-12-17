include(ExternalProject)

set(JSON_PREFIX_DIR     ${THIRD_PARTY_PATH}/json)
set(SOURCE_DIR ${THIRD_PARTY_ROOT}/json)

set(JSON_INCLUDE_DIR ${THIRD_PARTY_ROOT}/json/single_include)
include_directories(${JSON_INCLUDE_DIR})

ExternalProject_Add(
  extern_json
  ${EXTERNAL_PROJECT_LOG_ARGS}
  SOURCE_DIR ${SOURCE_DIR}
  PREFIX ${JSON_PREFIX_DIR}
  UPDATE_COMMAND ""
  PATCH_COMMAND ""
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
  TEST_COMMAND "")

add_library(json INTERFACE)

add_dependencies(json extern_json)
