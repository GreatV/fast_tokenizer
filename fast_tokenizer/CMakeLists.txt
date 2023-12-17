add_subdirectory(decoders)
add_subdirectory(models)
add_subdirectory(normalizers)
add_subdirectory(pretokenizers)
add_subdirectory(postprocessors)
add_subdirectory(utils)
add_subdirectory(core)


find_package(absl REQUIRED)
find_package(gflags REQUIRED)
find_package(glog REQUIRED)

# set the relative path of shared library
if (NOT APPLE AND NOT WIN32)
  set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-rpath='$ORIGIN'")
endif()

if (WITH_PYTHON)
  add_subdirectory(pybind)
#   cc_library(core_tokenizers SHARED
#              SRCS pybind/pybind.cc tokenizers/ernie_fast_tokenizer.cc
#              DEPS pybind python pybind_normalizers pybind_utils
#                   pybind_pretokenizers pybind_models pybind_decoders
#                   pybind_postprocessors pybind_tokenizers pybind_exception
#                   pybind_core normalizers pretokenizers core models
#                   tokenizer added_vocabulary postprocessors json)
  add_library(core_tokenizers SHARED pybind/pybind.cc tokenizers/ernie_fast_tokenizer.cc)
  set_target_properties(core_tokenizers PROPERTIES PREFIX "")
  if (WIN32)
    set_target_properties(core_tokenizers PROPERTIES SUFFIX ".pyd")
  else()
    set_target_properties(core_tokenizers PROPERTIES SUFFIX ".so")
  endif()

  if (APPLE)
    SET(CMAKE_INSTALL_RPATH "@loader_path/core_tokenizers.so")
  endif()

else(WITH_PYTHON)
#   cc_library(core_tokenizers SHARED
#             SRCS tokenizers/ernie_fast_tokenizer.cc tokenizers/clip_fast_tokenizer.cc
#             DEPS normalizers pretokenizers models decoders
#                   postprocessors core added_vocabulary tokenizer json)
  add_library(core_tokenizers SHARED tokenizers/ernie_fast_tokenizer.cc tokenizers/clip_fast_tokenizer.cc)
  target_link_libraries(core_tokenizers
  absl::base
  gflags
  glog::glog
  re2
#   absl::core_headers
# absl::fixed_array
absl::flags
# normalizers
# pretokenizers
postprocessors
added_vocabulary
core
base
tokenizer
sentencepiece_normalizer
# utils
models
failure
trie
lattice
decoders
pretokenizers
  )
#   target_link_libraries(core_tokenizers 
#     gflags
#     glog::glog
#     absl::base
#     absl::core_headers
#     absl::fixed_array
#     absl::flags
#     normalizers
#     pretokenizers
#     models
#     decoders
#     postprocessors
#     core
#     added_vocabulary
#     tokenizer
#     re2)

  if (APPLE)
    SET(CMAKE_INSTALL_RPATH "@loader_path/lib/libcore_tokenizers.dylib")
  endif()
endif(WITH_PYTHON)

# add_subdirectory(test)
