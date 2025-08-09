#!/bin/bash

rm -f CMakeCache.txt

TRI_INSTALL_PREFIX=$1/

# Create build directory if it doesn't exist
if [ ! -d "$5" ]; then
    mkdir -p "$5"
fi

cmake \
      -D CMAKE_INSTALL_PREFIX=$TRI_INSTALL_PREFIX \
      -D CMAKE_CXX_FLAGS="-std=c++17" \
      -D Trilinos_ENABLE_CXX11=ON \
      -D Trilinos_ENABLE_Fortran=OFF \
      -D CMAKE_C_COMPILER=$2 \
      -D CMAKE_CXX_COMPILER=$3 \
      -D Trilinos_ENABLE_OpenMP:BOOL=$4 \
      -D BUILD_SHARED_LIBS=ON \
      -D TPL_ENABLE_BLAS=ON \
      -D TPL_ENABLE_LAPACK=ON \
      -D TPL_BLAS_LIBRARIES="/usr/lib/x86_64-linux-gnu/libblas.so" \
      -D TPL_LAPACK_LIBRARIES="/usr/lib/x86_64-linux-gnu/liblapack.so" \
      -D TPL_ENABLE_Boost=ON \
      -D TPL_ENABLE_Cholmod=ON \
      -D TPL_Cholmod_INCLUDE_DIRS="/usr/include/suitesparse" \
      -D TPL_Cholmod_LIBRARIES="/usr/lib/x86_64-linux-gnu/libcholmod.so;/usr/lib/x86_64-linux-gnu/libamd.so;/usr/lib/x86_64-linux-gnu/libcolamd.so;/usr/lib/x86_64-linux-gnu/libccolamd.so;/usr/lib/x86_64-linux-gnu/libcamd.so;/usr/lib/x86_64-linux-gnu/libsuitesparseconfig.so" \
      -D TPL_ENABLE_SCALAPACK=OFF \
      -D TPL_ENABLE_ParMETIS=OFF \
      -D TPL_ENABLE_MUMPS=OFF \
      -D TPL_ENABLE_SuperLU=OFF \
      -D TPL_ENABLE_UMFPACK=OFF \
      -D TPL_Boost_INCLUDE_DIRS=/usr/include \
      -D TPL_Boost_LIBRARY_DIRS=/usr/lib/x86_64-linux-gnu \
      -D Trilinos_ENABLE_Amesos2=ON \
      -D Trilinos_ENABLE_Belos=ON \
      -D Trilinos_ENABLE_Ifpack2=ON \
      -D Trilinos_ENABLE_Kokkos=ON \
      -D Trilinos_ENABLE_MueLu=ON \
      -D Trilinos_ENABLE_Teuchos=ON \
      -D Trilinos_ENABLE_Tpetra=ON \
      -D Trilinos_ENABLE_Xpetra=ON \
      -D Trilinos_ENABLE_Zoltan2=ON \
      -D Kokkos_ENABLE_AGGRESSIVE_VECTORIZATION=ON \
      -D Tpetra_INST_COMPLEX_DOUBLE=ON \
      -D Trilinos_ENABLE_COMPLEX_DOUBLE=ON \
      -D Teuchos_ENABLE_COMPLEX=ON \
      -D Teuchos_ENABLE_THREAD_SAFE=ON \
      -D Tpetra_INST_INT_INT=ON \
      -D Tpetra_ENABLE_DEPRECATED_CODE=OFF \
      -D Trilinos_ENABLE_OpenMP=ON \
      -D TPL_ENABLE_MPI=ON \
      -D TPL_ENABLE_OpenMP=$4 \
      -D Trilinos_ENABLE_EXPLICIT_INSTANTIATION=ON \
      -D Kokkos_ENABLE_COMPILER_WARNINGS=ON \
      -D Amesos2_ENABLE_Basker=ON \
      -D Tpetra_INST_SERIAL:BOOL=ON \
      -D Trilinos_ENABLE_TESTS=OFF \
      -D Trilinos_ENABLE_ALL_FORWARD_DEP_PACKAGES=OFF \
      -D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES=OFF \
      -D CMAKE_VERBOSE_MAKEFILE=ON \
      "$5"