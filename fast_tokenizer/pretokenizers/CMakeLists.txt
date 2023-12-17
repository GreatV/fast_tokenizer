# cc_library(pretokenizers
#       SRCS pretokenizer.cc whitespace.cc bert.cc metaspace.cc
#            sequence.cc byte_level.cc split.cc whitespace_and_punctuation.cc
#       DEPS normalizers core json utils)

find_package(glog REQUIRED)
add_library(pretokenizers
        pretokenizer.cc whitespace.cc bert.cc metaspace.cc
        sequence.cc byte_level.cc split.cc whitespace_and_punctuation.cc
        )
target_link_libraries(pretokenizers glog::glog utils normalizers)
