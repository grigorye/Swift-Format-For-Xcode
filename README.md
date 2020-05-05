# Integrating [swift-format](https://github.com/apple/swift-format) into Xcode

Please read below if you're formatting your Swift code in Xcode with Ctrl-I and want to try swift-format instead of built-in formatting.


# Requirements

* apple/swift-format[@your-version-is-here] installed and made available via [Mint](https://github.com/yonaskolb/Mint)


# Installation

1. Double-click "Swift Format.workflow" and "Swift Format Helper.workflow" to install both in ~/Library/Services.

2. In System Preferences > Keyboard > Shortcuts > Services:
	* Assign Ctrl-Option-I (or whatever else) to General > Swift Format 
	* Assign Ctrl-Option-Command-I to Text > Swift Format Helper (don't change **this** shortcut)

3. In Xcode select a block in .swift file and select Xcode > Services > Swift Format. (This step might be required for the keyboard shortcuts to start working).

    * If you get a prompt about assistive devices, allow whatever asked in System Preferences (Security & Privacy > Privacy > Accessibility > Allow the apps below to control your computer)
    * If you get errors even after that, try adding /Applications/Automator manually to the Accessibility control list (see above).

4. You can override default swift-format settings via `.swift-format`

5. You can override default Mint version of swift-format by placing it in `.swift-format-mint-version` somewhere up in the file hierarchy.

# Known limitations

* Renaming of the workflow is not supported
* Level of indentation of the result depends on the app:
	- To make it properly indented in Xcode you have to enable "Indent when typing" in Preferences > Text Editing > Indentation > Syntax-Aware Indenting (optionally enabling "Re-indent on paste" in the same group)
	- With other apps indentation level of the resultl is typically reset to zero
