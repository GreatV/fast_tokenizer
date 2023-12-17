include(ExternalProject)

set(THIRD_PARTY_ROOT ${PROJECT_SOURCE_DIR}/third_party)
set(THIRD_PARTY_PATH "${CMAKE_BINARY_DIR}/third_party" CACHE STRING "A path setting third party libraries download & build directories.")

include(cmake/external/nlohmann_json.cmake)
include(cmake/external/re2.cmake)
include(cmake/external/darts.cmake)
