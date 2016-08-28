
    UltraModernUI Informations
    ==========================


The Ultra-Modern User Interface is a new interface with a style like the most recent installers for NSIS 3 (Nullsoft Scriptable Install System), the tool that allows programmers to create such installers for Windows. UltraModernUI and NSIS are released under an open source license.

The Ultra-Modern User Interface also features new pages (Confirm, Abort, AlternativeStartMenu, AdditionnalTasks, Information, Maintenance, Update, StupType, Serial Number...).

UltraModernUI include also ModernUIEx. ModernUIEx is the same User Interface as the original Modern UI style but with the support of the new Ultra-Modern pages.

Using the UltraModernUI macros and language files, writing scripts with an ultra-modern interface is easy. A lot of examples are available to show the different features and the documentation contains all information about writing UltraModernUI scripts and a reference of all settings.


What's new in UltraModernUI version 2.0?
----------------------------------------

  o  UltraModernUI is now fully compatible with NSIS version 3 x86 edition and now with the large string special build;
  o  The NSISArray plug-in was replaced by the new nsArray plug-in in version 1.1.1.7 who is faster and uses less memory;
  o  Updated the InstallOptionsEx plug-in to version 2.4.5 beta 3 with full unicode support;
  o  Updated the SkinnedControls plug-in to version 1.4 with support of the new NSIS plug-in API, ignore case parameters name support, unicode support, rewritten documentation and button image size are no more limited to allow smoother gradients;
  o  The information page is now compatible with UTF16LE text files if compiled in Unicode;
  o  The information page is now compatible with Unix style (LF only) line return text files;
  o  The UMUI_CUSTOM_SKIN define is now deprecated, it is no more necessary and you can simply use the UMUI_SKIN define with your custom skin;
  o  All button image was recreated with smoother gradient;
  o  Reduced weight of skin images;
  o  Updated and completed documentation;
  o  Added an example for nsDialogs based custom page and documentation;
  o  The default install directory for the NSIS + UltraModernUI package is now C:\ProgramData on Windows Vista and upper to allow examples to be compiled without access rights errors;
  o  A lot of bug fixes and optimizations;
  o  Source code now on GitHub: https://github.com/SuperPat45/UltraModernUI.
  