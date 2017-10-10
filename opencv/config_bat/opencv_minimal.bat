rem BUILD OpenCV with minimal support: no CUDA, no SfM module
rem With python2 and python3 support, both from a conda environment.

rem @echo off
setlocal

set NOW_DIR=%~dp0

set BUILD_DIR=%NOW_DIR%


set WITHOUT_CUDA_PARAMS= -D WITH_CUDA=OFF
set WITHOUT_SfM_PARAMS=-D WITH_EIGEN=OFF ^
    -D WITH_LAPACK=OFF ^
    -D VTK_DIR=0 -D WITH_VTK=OFF ^
    -D GLOG_INCLUDE_DIR=0 -D Glog_LIBS=NOTFOUND ^
    -D Ceres_DIR=NOTFOUND


mkdir %BUILD_DIR%\_minimal
cd %BUILD_DIR%\_minimal

echo "Going to move all previous files in"
echo %BUILD_DIR%\_minimal
echo "<Enter> to continue, <q> to stop:"

set /p input_cmd=Please input:
echo %input_cmd%

rem NOT the colon around the %
if "%input_cmd%"=="q" (echo Good bye! 
	cd %NOW_DIR%
	exit /b 1
)

pause

rm * -rf

mkdir x64
cd x64
cmake -G "Visual Studio %VS_VERSION% Win64" %TOOLSET_VERSION% %CMAKE_PARAMS% %WITHOUT_CUDA_PARAMS% %WITHOUT_SfM_PARAMS% %CMAKE_OUTPUT_DIRS_X64% %SOURCE_DIR%
if errorlevel 1 goto exit_build
rem cmake --build . --config "Debug"
if errorlevel 1 goto exit_build
rem cmake --build . --config "Release"
if errorlevel 1 goto exit_build
cd ..

cd ..
:exit_build
cd ../..

cd %NOW_DIR%
exit /b 1    