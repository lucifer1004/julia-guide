project(FortranJulia Fortran)

add_library(JuliaFortran SHARED "src/lib.f90")
add_executable(FortranJulia "src/main.f90")

target_include_directories(${PROJECT_NAME} PRIVATE ${Julia_INCLUDE_DIRS})
target_link_directories(${PROJECT_NAME} PRIVATE ${Julia_LIBRARY_DIR})
target_link_libraries(${PROJECT_NAME} ${Julia_LIBRARY})
