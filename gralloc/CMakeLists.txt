if (WIN32)
   set(VCOS_PLATFORM win32)
else ()
   set(VCOS_PLATFORM pthreads)
   add_definitions(-Wall -Werror)
endif ()

include_directories( ../ )

add_library(grlc ${SHARED} gralloc.c)

target_link_libraries(grlc vcos)

install(TARGETS grlc DESTINATION lib)

