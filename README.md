sqlite3pod
==========

The repository for the sqlite3 podspec in [CocoaPods](http://cocoapods.org).

Please refer to the [SQLite](https://www.sqlite.org) project if you encounter any problems related to SQLite itself: https://sqlite.org/support.html

To use SQLite in your project, add `pod 'sqlite3'` to your Podfile. However, as clang reports many mostly harmless warnings, which need to be fixed upstream, you probably want to use `pod 'sqlite3', inhibit_warnings: true`. You do not have to add it to every subspec you use (e.g. `pod 'sqlite3/fts'`), adding the parameter to the main pod is sufficient.
For a description of all supported subspecs, please take a look at the `sqlite3.podspec` file.

Changelog: https://www.sqlite.org/news.html

Pull requests to improve this podspec are welcome.

This podspec is licensed under the MIT License.
All of the code and documentation in SQLite itself has been dedicated to the public domain by the authors: https://www.sqlite.org/copyright.html
