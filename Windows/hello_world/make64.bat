@echo off
set /p prog="[+] program name (without extension):"
"C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x64\ml64.exe" ^
	%prog%.asm /link /subsystem:console ^
	/defaultlib:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22000.0\um\x64\ntdll.lib" ^
	/defaultlib:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22000.0\um\x64\kernel32.lib" ^
	/defaultlib:"C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22000.0\um\x64\User32.Lib" ^
	/entry:Start ^
	/out:%prog%.exe ^
	/RELEASE
del %prog%.obj
del *.lnk
pause
