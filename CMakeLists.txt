cmake_minimum_required(VERSION 3.24 FATAL_ERROR)
project(llm_c_gpt2 LANGUAGES C CUDA)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(CUDAToolkit REQUIRED)
find_package(OpenMP REQUIRED)

add_definitions(-DOMP) 

add_executable(test_gpt2 test_gpt2.c)
add_executable(train_gpt2 train_gpt2.c)


add_executable(test_gpt2cu test_gpt2.cu)
add_executable(train_gpt2cu train_gpt2.cu)

set_target_properties(test_gpt2cu PROPERTIES CUDA_LANGUAGE ON)
set_target_properties(train_gpt2cu PROPERTIES CUDA_LANGUAGE ON)

target_link_libraries(test_gpt2cu  PRIVATE CUDA::cudart CUDA::cublas CUDA::nvml)
target_link_libraries(train_gpt2cu PRIVATE CUDA::cudart CUDA::cublas CUDA::nvml)

set_target_properties(test_gpt2 PROPERTIES 
    VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
)
set_target_properties(train_gpt2 PROPERTIES 
    VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
)
set_target_properties(test_gpt2cu PROPERTIES 
    VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
)
set_target_properties(train_gpt2cu PROPERTIES 
    VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
)

if(OPENMP_FOUND)
    target_link_libraries(test_gpt2 PRIVATE OpenMP::OpenMP_C)
endif()
if(OPENMP_FOUND)
    target_link_libraries(train_gpt2 PRIVATE OpenMP::OpenMP_C)
endif()
if(OPENMP_FOUND)
    target_link_libraries(test_gpt2cu PRIVATE OpenMP::OpenMP_C)
endif()
if(OPENMP_FOUND)
    target_link_libraries(train_gpt2cu PRIVATE OpenMP::OpenMP_C)
endif()
