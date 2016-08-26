@echo off
@echo Creating UltraModernUI zip archive

  del /Q UltraModernUI_2.0b1.zip
  rmdir /S /Q temp

  mkdir temp

  mkdir "temp\Contrib\UltraModernUI\"
  copy Contrib\UltraModernUI\UMUI.nsh temp\Contrib\UltraModernUI
  mkdir "temp\Contrib\UltraModernUI\Ini"
  copy Contrib\UltraModernUI\Ini\*.ini temp\Contrib\UltraModernUI\Ini
  mkdir "temp\Contrib\UltraModernUI\Language files\"
  copy "Contrib\UltraModernUI\Language files\*.nsh" "temp\Contrib\UltraModernUI\Language files"
  mkdir "temp\Contrib\UltraModernUI\BGSkins\"
  xcopy Contrib\UltraModernUI\BGSkins\* temp\Contrib\UltraModernUI\BGSkins /S /E
  mkdir "temp\Contrib\UltraModernUI\Skins\"
  xcopy Contrib\UltraModernUI\Skins\* temp\Contrib\UltraModernUI\Skins /S /E

  mkdir "temp\Docs\UltraModernUI\"
  copy Docs\UltraModernUI\*.* temp\Docs\UltraModernUI
  mkdir "temp\Docs\UltraModernUI\images\"
  copy Docs\UltraModernUI\images\*.gif temp\Docs\UltraModernUI\images
  copy Docs\UltraModernUI\images\*.png temp\Docs\UltraModernUI\images

  mkdir "temp\Examples\UltraModernUI\"
  copy Examples\UltraModernUI\*.nsi temp\Examples\UltraModernUI
  copy Examples\UltraModernUI\*.ini temp\Examples\UltraModernUI
  copy Examples\UltraModernUI\*.txt temp\Examples\UltraModernUI

  mkdir "temp\Contrib\UIs\UltraModernUI\"
  copy Contrib\UIs\UltraModernUI\*.exe temp\Contrib\UIs\UltraModernUI

  mkdir "temp\Contrib\Graphics\UltraModernUI\"
  copy Contrib\Graphics\UltraModernUI\*.* temp\Contrib\Graphics\UltraModernUI

  mkdir "temp\Include\"
  copy Include\UMUI.nsh temp\Include
  copy Include\MUIEx.nsh temp\Include


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

rem  mkdir "temp\Contrib\UIs"
	copy Contrib\UIs\modern_sb.exe temp\Contrib\UIs
	copy Contrib\UIs\default_sb.exe temp\Contrib\UIs


rem  mkdir "temp\Plugins\x86-ansi\"
  copy Plugins\x86-ansi\InstallOptionsEx.dll temp\Plugins\x86-ansi
rem  mkdir "temp\Plugins\x86-unicode\"
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
  

rem  mkdir "temp\Plugins\x86-ansi\"
  copy Plugins\x86-ansi\nsArray.dll temp\Plugins\x86-ansi
rem  mkdir "temp\Plugins\x86-unicode\"
  copy Plugins\x86-unicode\nsArray.dll temp\Plugins\x86-unicode

rem  mkdir "temp\Include\"
  copy Include\nsArray.nsh temp\Include

  mkdir "temp\Docs\nsArray\"
  copy Docs\nsArray\*.* temp\Docs\nsArray

  mkdir "temp\Examples\nsArray\"
  copy Examples\nsArray\*.nsi temp\Examples\nsArray

  mkdir "temp\Contrib\nsArray\"
  copy Contrib\nsArray\*.* temp\Contrib\nsArray

  cd temp
  "C:\Program Files\7-Zip\7z.exe" a -tzip -mx9 ..\UltraModernUI_2.0b1.zip *
  cd ..

  rmdir /S /Q temp

@echo Process completed
@echo on