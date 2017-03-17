set MING=0
echo CONDA_PY "%CONDA_PY%"
if "%CONDA_PY%"=="27" set MING=1

if %MING%==1 (
    echo using mingw compiler
    "%PYTHON%" setup.py build --compiler=mingw32
    if errorlevel 1 exit 1
    "%PYTHON%" setup.py build_ext --compiler=mingw32
    if errorlevel 1 exit 1
    "%PYTHON%" setup.py install
    if errorlevel 1 exit 1
) ELSE (
    echo using default compiler
    "%PYTHON%" setup.py build
    if errorlevel 1 exit 1
    "%PYTHON%" setup.py build_ext
    if errorlevel 1 exit 1
    "%PYTHON%" setup.py install
    if errorlevel 1 exit 1
)
