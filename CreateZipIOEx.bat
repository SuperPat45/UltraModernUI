@echo off
@echo Creating InstallOptionsEx zip archive

  del /Q InstallOptionsEx2.4.5b3.zip
  rmdir /S /Q temp

  mkdir temp

  mkdir "temp\Plugins\"
  copy Plugins\InstallOptionsEx_legacy.dll temp\Plugins
  mkdir "temp\Plugins\x86-ansi\"
  copy Plugins\x86-ansi\InstallOptionsEx.dll temp\Plugins\x86-ansi
  mkdir "temp\Plugins\x86-unicode\"
  copy Plugins\x86-unicode\InstallOptionsEx.dll temp\Plugins\x86-unicode

  mkdir "temp\Docs\InstallOptionsEx\"
  copy Docs\InstallOptionsEx\*.* temp\Docs\InstallOptionsEx

  mkdir "temp\Contrib\InstallOptionsEx\"
	copy Contrib\InstallOptionsEx\*.h temp\Contrib\InstallOptionsEx
	copy Contrib\InstallOptionsEx\*.cpp temp\Contrib\InstallOptionsEx
	copy Contrib\InstallOptionsEx\*.c temp\Contrib\InstallOptionsEx
	copy Contrib\InstallOptionsEx\ioptdll.rc temp\Contrib\InstallOptionsEx
	copy Contrib\InstallOptionsEx\io.sln temp\Contrib\InstallOptionsEx
	copy Contrib\InstallOptionsEx\io.vcproj temp\Contrib\InstallOptionsEx
  mkdir "temp\Contrib\InstallOptionsEx\Controls"
  copy Contrib\InstallOptionsEx\Controls\*.h temp\Contrib\InstallOptionsEx\Controls

  mkdir "temp\Examples\InstallOptionsEx\"
  copy Examples\InstallOptionsEx\*.nsi temp\Examples\InstallOptionsEx
  copy Examples\InstallOptionsEx\*.ini temp\Examples\InstallOptionsEx

  cd temp
  "C:\Program Files\7-Zip\7z.exe" a -tzip -mx9 ..\InstallOptionsEx2.4.5b3.zip *
  cd ..

  rmdir /S /Q temp

@echo Process completed
@echo on