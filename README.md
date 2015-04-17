sqlite3pod
==========

The repository for the sqlite3 podspec in [CocoaPods](http://cocoapods.org).

Please refer to the [SQLite](https://www.sqlite.org) project if you encounter any problems related to SQLite itself: https://sqlite.org/support.html

**IMPORTANT**: I had to push this podspec with the version number incremented from 3.8.9.0 to 3.8.9.0.1 due to a SQLite upstream bug on iOS in relation to `gethostuuid` (see [this issue](https://github.com/clemensg/sqlite3pod/issues/1)). The bug appeared in SQLite version 3.8.9, so you can either roll back to version 3.8.8.3 by specifying `pod 'sqlite3', '3.8.8.3'` in your Podfile or use this fixed version via the usual `pod 'sqlite3'`.
Before incrementing the version number, I tried adding a suffix but CocoaPods did not regard those versions as newer. Sorry for the inconvenience.

Pull requests to improve this podspec are welcome.

This podspec is licensed under the MIT License.
All of the code and documentation in SQLite itself has been dedicated to the public domain by the authors: https://www.sqlite.org/copyright.html
