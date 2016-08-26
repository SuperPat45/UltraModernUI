@echo off
@echo Creating SkinnedControls zip archive

  del /Q SkinnedControls1.3.zip
  rmdir /S /Q temp

  mkdir temp

  mkdir "temp\Plugins\"
  copy Plugins\SkinnedControls_legacy.dll temp\Plugins
  mkdir "temp\Plugins\x86-ansi\"
  copy Plugins\x86-ansi\SkinnedControls.dll temp\Plugins\x86-ansi
  mkdir "temp\Plugins\x86-unicode\"
  copy Plugins\x86-unicode\SkinnedControls.dll temp\Plugins\x86-unicode

  mkdir "temp\Docs\SkinnedControls\"
  copy Docs\SkinnedControls\*.* temp\Docs\SkinnedControls
  mkdir "temp\Docs\SkinnedControls\images\"
  copy Docs\SkinnedControls\images\*.png temp\Docs\SkinnedControls\images
  copy Docs\SkinnedControls\images\*.gif temp\Docs\SkinnedControls\images

  mkdir "temp\Contrib\SkinnedControls\"
	copy Contrib\SkinnedControls\*.h temp\Contrib\SkinnedControls
	copy Contrib\SkinnedControls\*.c temp\Contrib\SkinnedControls
	copy Contrib\SkinnedControls\SkinnedControls.sln temp\Contrib\SkinnedControls
	copy Contrib\SkinnedControls\SkinnedControls.vcproj temp\Contrib\SkinnedControls
  mkdir "temp\Contrib\SkinnedControls\coolsb"
  copy Contrib\SkinnedControls\coolsb\*.h temp\Contrib\SkinnedControls\coolsb
  copy Contrib\SkinnedControls\coolsb\*.c temp\Contrib\SkinnedControls\
  copy Contrib\SkinnedControls\coolsb\detours.lib temp\Contrib\SkinnedControls\coolsb
  copy Contrib\SkinnedControls\coolsb\coolsb.vcproj temp\Contrib\SkinnedControls\coolsb

  mkdir "temp\Contrib\SkinnedControls\skins"
	copy Contrib\SkinnedControls\skins\*.bmp temp\Contrib\SkinnedControls\skins
	
  mkdir "temp\Examples\SkinnedControls\"
  copy Examples\SkinnedControls\*.nsi temp\Examples\SkinnedControls

  mkdir "temp\Contrib\UIs"
	copy Contrib\UIs\modern_sb.exe temp\Contrib\UIs
	copy Contrib\UIs\default_sb.exe temp\Contrib\UIs
	
  cd temp
  "C:\Program Files\7-Zip\7z.exe" a -tzip -mx9 ..\SkinnedControls1.3.zip *
  cd ..

  rmdir /S /Q temp

@echo Process completed
@echo on