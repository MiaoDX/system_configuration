REM Inspired by https://gist.github.com/KindDragon/fb85ec81184a096953f9
echo "OpenCV common variables setting:"

@echo off

rem WE SHOULD NOT SETLOCAL, since we will need these in other files.
rem setlocal 

set OpenCV_GIT=C:/tools/opencv_gits
set PYTHON2_PATH=H:/py_env_conda/py_27_bare
set PYTHON3_PATH=H:/py_env_conda/py_36_bare
set SOURCE_DIR=%OpenCV_GIT%/opencv_git_checkout_3_3_0

rem We use \ because the mkdir require this
set BUILD_DIR=C:\tools\opencv_build_tmp\v3_3_0

set VS_VERSION=14 2015
set TOOLSET_VERSION=-T "v140"
rem RelWithDebInfo configuration do many problems in solution, allow creating pdb for Release configuration

rem set CMAKE_PARAMS=-D CMAKE_CONFIGURATION_TYPES:STRING=Debug;Release -D CMAKE_CXX_FLAGS_RELEASE:STRING="/MD /Zi /O2 /D NDEBUG" -D CMAKE_C_FLAGS_RELEASE:STRING="/MD /Zi /O2 /D NDEBUG" -D CMAKE_EXE_LINKER_FLAGS_RELEASE:STRING="/DEBUG /INCREMENTAL:NO" -D CMAKE_MODULE_LINKER_FLAGS_RELEASE:STRING="/DEBUG /INCREMENTAL:NO" -D CMAKE_SHARED_LINKER_FLAGS_RELEASE:STRING="/DEBUG /INCREMENTAL:NO"
set CMAKE_PARAMS=-D INSTALL_PYTHON_EXAMPLES=OFF ^
    -D INSTALL_C_EXAMPLES=OFF ^
    -D OPENCV_EXTRA_MODULES_PATH=%OpenCV_GIT%/opencv_contrib_checkout_3_3_0/modules ^
    -D PYTHON2_EXECUTABLE=%PYTHON2_PATH%/python ^
    -D PYTHON3_EXECUTABLE=%PYTHON3_PATH%/python ^
    -D BUILD_EXAMPLES=OFF ^
    -D BUILD_TESTS=OFF ^
    -D BUILD_DOCS=OFF

echo "OpenCV common variables setting, done"