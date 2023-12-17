# cc_library(postprocessors SRCS bert.cc postprocessor.cc template.cc roberta.cc byte_level.cc DEPS core json)

find_package(glog REQUIRED)
add_library(postprocessors bert.cc postprocessor.cc template.cc roberta.cc byte_level.cc)
target_link_libraries(postprocessors PUBLIC glog::glog)
