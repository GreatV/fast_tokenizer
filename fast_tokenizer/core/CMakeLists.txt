# cc_library(added_vocabulary SRCS added_vocabulary.cc DEPS normalizers pretokenizers json)
# cc_library(base SRCS base.cc DEPS json)
# cc_library(tokenizer SRCS tokenizer.cc DEPS added_vocabulary json decoders trie models postprocessors base)
# cc_library(core SRCS encoding.cc DEPS json base)

find_package(glog REQUIRED)
find_package(absl REQUIRED)
add_library(added_vocabulary added_vocabulary.cc)
# target_include_directories(added_vocabulary PUBLIC ${JSON_INCLUDE_DIR} ${RE2_INCLUDE_DIR})
target_link_libraries(added_vocabulary glog::glog)

add_library(base base.cc)
# target_include_directories(base PUBLIC ${JSON_INCLUDE_DIR} ${RE2_INCLUDE_DIR})
# target_link_libraries(base json re2 glog::glog)

add_library(tokenizer tokenizer.cc)
target_link_libraries(tokenizer absl::base)

add_library(core encoding.cc)
target_link_libraries(core glog::glog)
