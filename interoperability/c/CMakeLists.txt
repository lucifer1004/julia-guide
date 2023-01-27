project(CJulia)

add_library(JuliaC SHARED "src/lib.c")
add_executable(CJulia "src/main.c")
target_include_directories(${PROJECT_NAME} PRIVATE ${Julia_INCLUDE_DIRS})
target_link_directories(${PROJECT_NAME} PRIVATE ${Julia_LIBRARY_DIR})
target_link_libraries(${PROJECT_NAME} ${Julia_LIBRARY})
