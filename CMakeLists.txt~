cmake_minimum_required(VERSION 3.24 FATAL_ERROR)
project(llm_c_gpt2 LANGUAGES C CUDA)

if (NOT DEFINED CMAKE_CUDA_ARCHITECTURES)

set(CMAKE_CUDA_ARCHITECTURES native)

endif()
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(CheckLanguage)

check_language(CUDA)

if(NOT CUDAToolkit_FOUND)

include(FindCUDAToolkit)

endif()
include_directories(${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})

set(CMAKE_CUDA_STANDARD 14)

set(CMAKE_CUDA_STANDARD_REQUIRED ON)

add_definitions(-DOMP) 
add_executable(test_gpt2 test_gpt2.c)
add_executable(train_gpt2 train_gpt2.c)

add_executable(test_gpt2cu test_gpt2.cu)
add_executable(train_gpt2cu train_gpt2.cu)

set_target_properties(test_gpt2cu PROPERTIES CUDA_LANGUAGE ON)
set_target_properties(train_gpt2cu PROPERTIES CUDA_LANGUAGE ON)

target_link_libraries(test_gpt2cu PUBLIC CUDA::cudart CUDA::cublas)
target_link_libraries(train_gpt2cu PUBLIC CUDA::cudart CUDA::cublas)

