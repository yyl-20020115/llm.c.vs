rmdir /s /q build
mkdir build
cd build
cmake ..
set PATH=%PATH%;"C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\"
msbuild.exe llm_c_gpt2.sln /p:Configuration=Release;Platform=x64
copy /y Release\*.exe ..
cd ..

python .\prepro_tinyshakespeare.py
python .\train_gpt2.py

.\train_gpt2cu
.\test_gpt2cu

.\train_gpt2
.\test_gpt2
