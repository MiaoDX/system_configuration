rem BUILD OpenCV with cuda support: no SfM module
rem With python2 and python3 support, both from a conda environment.

rem @echo off
setlocal

echo "Going to call opencv_common"
CALL opencv_common.bat
echo "OpenCV SOURCE_DIR, just to test we call it successfully"
echo %SOURCE_DIR%
echo "Enter to continue:"
pause

set NOW_DIR=%~dp0

set WITH_CUDA_PARAMS= -D WITH_CUDA=ON
set WITHOUT_SfM_PARAMS=-D WITH_EIGEN=OFF ^
    -D WITH_LAPACK=OFF ^
    -D VTK_DIR=0 -D WITH_VTK=OFF ^
    -D GLOG_INCLUDE_DIR=0 -D Glog_LIBS=NOTFOUND ^
    -D Ceres_DIR=NOTFOUND

mkdir %BUILD_DIR%\_cuda
cd %BUILD_DIR%\_cuda

echo "Going to move all previous files in"
echo %BUILD_DIR%\_cuda
echo "<Enter> to continue, <q> to stop:"

set /p input_cmd=Please input:
echo %input_cmd%
if "%input_cmd%"=="q" (echo Good bye!
	cd %NOW_DIR%
	exit /b 1
)

pause

rm * -rf

mkdir x64
cd x64
cmake -G "Visual Studio %VS_VERSION% Win64" %TOOLSET_VERSION% %CMAKE_PARAMS% %WITH_CUDA_PARAMS% %WITHOUT_SfM_PARAMS% %CMAKE_OUTPUT_DIRS_X64% %SOURCE_DIR%
if errorlevel 1 goto exit_build
rem cmake --build . --config "Debug"
if errorlevel 1 goto exit_build
rem cmake --build . --config "Release"
if errorlevel 1 goto exit_build


cd ..
:exit_build
cd ../..

cd %NOW_DIR%
exit /b 1