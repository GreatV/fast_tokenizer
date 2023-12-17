# cc_library(normalizers 
#       SRCS normalizer.cc unicode.cc
#            utils.cc strip.cc replace.cc bert.cc
#            precompiled.cc 
#       DEPS re2 json sentencepiece_normalizer icuuc icudata)

find_package(glog REQUIRED)
find_package(pkgconfig REQUIRED)
pkg_check_modules(ICU REQUIRED icu-uc)
# find_package(icu REQUIRED)

add_library(normalizers normalizer.cc unicode.cc
            utils.cc strip.cc replace.cc bert.cc
            precompiled.cc 
            )
target_link_libraries(normalizers glog::glog ${ICU_LIBRARIES})
target_include_directories(normalizers PUBLIC ${ICU_INCLUDE_DIRS})
