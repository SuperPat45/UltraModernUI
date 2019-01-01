[![NSIS Ultra-Modern User Interface][2]][1]

  [1]: http://ultramodernui.sourceforge.net/
  [2]: http://ultramodernui.sourceforge.net/images/header.png (Go to the NSIS Ultra-Modern User Interface home page)

The Ultra-Modern User Interface is a new interface with a style like the most recent installers for NSIS 3 (Nullsoft Scriptable Install System), the tool that allows programmers to create such installers for Windows. Ultra-Modern UI and NSIS are released under an open source license.

The Ultra-Modern User Interface also features new pages (Confirm, Abort, AlternativeStartMenu, AdditionalTasks, Information, Maintenance, Update, SetupType...). The interface and the graphics can be customized using the provided settings and the new skins system.

Ultra-Modern UI include also another User Interface named Modern UIEx. Modern UIEx is the same User Interface as the original Modern UI style but with the support of the new ultra-modern pages and with a little more options.

Ultra-Modern UI include three NSIS plug-ins:

* [SkinnedControls](http://nsis.sourceforge.net/SkinnedControls_plug-in): a plug-in, natively integrated to Ultra-Modern UI, to skin all buttons and scroll bars of your installer;
* [InstallOptionsEx](http://nsis.sourceforge.net/InstallOptionsEx_plug-in): an extension, natively integrated to Ultra-Modern UI, of the original [InstallOptions](http://nsis.sourceforge.net/Docs/InstallOptions/Readme.html) plug-in with more feature to create custom pages;
* [nsArray](http://nsis.sourceforge.net/Arrays_in_NSIS): needed by some Ultra-Modern UI features, provide less out-of-the-box arrays and map features.

![](http://ultramodernui.sourceforge.net/images/screenshots/UMUI01.png)

# What’s new in Ultra-Modern UI version 2.0?

* Ultra-Modern UI is now fully compatible with NSIS version 3 x86 edition and now with the large string special build;
* The NSISArray plug-in was replaced by the new nsArray plug-in in version 1.1.1.7 who is faster and uses less memory;
* Updated the InstallOptionsEx plug-in to version 2.4.5 beta 3 with full unicode support;
* Updated the SkinnedControls plug-in to version 1.4 with support of the new NSIS plug-in API, ignore case parameters name support, unicode support, rewritten documentation and button image size are no more limited to allow smoother gradients;
* Several new and completed language files and other minor fixes:
  * Completed: German language file by Bodenseematze;
  * New: Greek language file by Bodenseematze;
  * New: Italian language file by Bodenseematze;
  * New: Lithuanian language file by Bodenseematze;
  * New: Russian language file by Bodenseematze;
  * New: Slovenian language file by Bodenseematze;
  * New: Spanish language file by Bodenseematze;
  * New: Turkish language file by Bodenseematze;
  * New: Bulgarian language file by Angel;
* The information page is now compatible with UTF16LE text files if compiled in Unicode;
* The information page is now compatible with Unix style (LF only) line return text files;
* The UMUI_CUSTOM_SKIN define is now deprecated, it is no more necessary and you can simply use the UMUI_SKIN define with your custom skin; 
* All button image was recreated with smoother gradient;
* Reduced weight of skin images;
* Updated and completed documentation;
* Added an example for nsDialogs based custom page and documentation;
* The default install directory for the NSIS + Ultra-Modern UI package is now C:\ProgramData on Windows Vista and upper to allow examples to be compiled without access rights errors;
* A lot of bug fixes and optimizations;
* Source code now on GitHub: https://github.com/SuperPat45/UltraModernUI.

# License

[zlib/libpng](LICENSE.md)