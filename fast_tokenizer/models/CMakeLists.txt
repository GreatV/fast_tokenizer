# cc_library(models
#         SRCS wordpiece.cc fast_wordpiece.cc bpe.cc unigram.cc
#         DEPS core json trie failure icuuc icudata lattice utils)

find_package(glog REQUIRED)
find_package(pkgconfig REQUIRED)
pkg_check_modules(ICU REQUIRED icu-uc)
add_library(models wordpiece.cc fast_wordpiece.cc bpe.cc unigram.cc)
target_include_directories(models PUBLIC ${ICU_INCLUDE_DIRS})
target_link_libraries(models glog::glog ${ICU_LIBRARIES})
