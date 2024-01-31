Pod::Spec.new do |s|
  s.name     = 'sqlite3'
  s.version  = '3.45.1'
  s.license  = { :type => 'Public Domain', :text => <<-LICENSE
All of the code and documentation in SQLite has been dedicated to the public domain by the authors.
All code authors, and representatives of the companies they work for, have signed affidavits dedicating their contributions to the public domain and originals of those signed affidavits are stored in a firesafe at the main offices of Hwaci.
Anyone is free to copy, modify, publish, use, compile, sell, or distribute the original SQLite code, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.
LICENSE
  }
  s.summary  = 'SQLite is an embedded SQL database engine'
  s.documentation_url = 'https://sqlite.org/docs.html'
  s.homepage = 'https://github.com/clemensg/sqlite3pod'
  s.authors  = { 'Clemens Gruber' => 'clemensgru@gmail.com' }

  v = s.version.to_s.split('.')
  archive_name = "sqlite-src-"+v[0]+v[1].rjust(2, '0')+v[2].rjust(2, '0')+"00"
  s.source   = { :http => "https://www.sqlite.org/#{Time.now.year}/#{archive_name}.zip" }
  s.prepare_command = <<-CMD
cd #{archive_name}
./configure
make sqlite3.c sqlite3.h sqlite3ext.h
CMD
  s.requires_arc = false

  s.default_subspecs = 'common'

  s.subspec 'common' do |ss|
    ss.source_files = "#{archive_name}/sqlite*.{h,c}"
    ss.public_header_files = "#{archive_name}/sqlite3.h,#{archive_name}/sqlite3ext.h"
    ss.osx.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DHAVE_USLEEP=1' }
    # Disable OS X / AFP locking code on mobile platforms (iOS, tvOS, watchOS)
    sqlite_xcconfig_ios = { 'OTHER_CFLAGS' => '$(inherited) -DHAVE_USLEEP=1 -DSQLITE_ENABLE_LOCKING_STYLE=0' }
    ss.ios.pod_target_xcconfig = sqlite_xcconfig_ios
    ss.tvos.pod_target_xcconfig = sqlite_xcconfig_ios
    ss.watchos.pod_target_xcconfig = sqlite_xcconfig_ios
  end

  # Detect misuse of SQLite API
  s.subspec 'api_armor' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_API_ARMOR=1' }
  end

  # API for column meta-data access
  s.subspec 'coldata' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_COLUMN_METADATA=1' }
  end

  # FTS4 full-text-search
  s.subspec 'fts' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_FTS4=1 -DSQLITE_ENABLE_FTS3_PARENTHESIS=1' }
  end

  # FTS5 full-text-search
  s.subspec 'fts5' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_FTS5=1' }
  end

  # Geopoly extension
  s.subspec 'geopoly' do |ss|
    ss.dependency 'sqlite3/common'
    ss.dependency 'sqlite3/rtree'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_GEOPOLY=1' }
  end

  # JSON1 extension for managing JSON content (Built-in since 3.38.0)
  s.subspec 'json1' do |ss|
    ss.dependency 'sqlite3/common'
  end

  # Recommended defaults for increased performance and reduced memory usage
  s.subspec 'perf' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_DQS=0 -DSQLITE_THREADSAFE=0 -DSQLITE_DEFAULT_MEMSTATUS=0 -DSQLITE_DEFAULT_WAL_SYNCHRONOUS=1 -DSQLITE_LIKE_DOESNT_MATCH_BLOBS=1 -DSQLITE_MAX_EXPR_DEPTH=0 -DSQLITE_OMIT_DECLTYPE=1 -DSQLITE_OMIT_DEPRECATED=1 -DSQLITE_OMIT_PROGRESS_CALLBACK=1 -DSQLITE_OMIT_SHARED_CACHE=1 -DSQLITE_USE_ALLOCA=1 -DSQLITE_STRICT_SUBTYPE=1' }
  end

  # Recommended defaults for increased performance and reduced memory usage (Threadsafe and with shared-cache mode)
  s.subspec 'perf-threadsafe' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_DQS=0 -DSQLITE_DEFAULT_MEMSTATUS=0 -DSQLITE_DEFAULT_WAL_SYNCHRONOUS=1 -DSQLITE_LIKE_DOESNT_MATCH_BLOBS=1 -DSQLITE_MAX_EXPR_DEPTH=0 -DSQLITE_OMIT_DECLTYPE=1 -DSQLITE_OMIT_DEPRECATED=1 -DSQLITE_OMIT_PROGRESS_CALLBACK=1 -DSQLITE_USE_ALLOCA=1 -DSQLITE_STRICT_SUBTYPE=1' }
  end

  # Resumable Bulk Update
  s.subspec 'rbu' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_RBU=1' }
  end

  # R*Tree index for range queries
  s.subspec 'rtree' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_RTREE=1' }
  end

  # Session extension: Record and package changes to rowid tables into files that can be applied to other DBs
  s.subspec 'session' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_PREUPDATE_HOOK=1 -DSQLITE_ENABLE_SESSION=1' }
  end

  # Interface for historical database snapshots
  s.subspec 'snapshot' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_SNAPSHOT=1' }
  end

  # Soundex phonetic string encoding function
  s.subspec 'soundex' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_SOUNDEX=1' }
  end

  # Enhanced ANALYZE and query planner (Deprecated!)
  s.subspec 'stat3' do |ss|
    # The legacy option SQLITE_ENABLE_STAT3 is a no-op since version 3.30.0
    # We therefore depend on the replacement SQLITE_ENABLE_STAT4
    ss.dependency 'sqlite3/stat4'
  end

  # Enhanced ANALYZE and query planner: Collects histogram data for all columns of each index
  s.subspec 'stat4' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_STAT4=1' }
  end

  # Build unicode61 FTS tokenizer (Deprecated! The tokenizer is built by default)
  s.subspec 'unicode61' do |ss|
    ss.dependency 'sqlite3/common'
    ss.dependency 'sqlite3/fts'
  end

  # API to register unlock-notification callbacks
  s.subspec 'unlock_notify' do |ss|
    ss.dependency 'sqlite3/common'
    ss.pod_target_xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_UNLOCK_NOTIFY=1' }
  end

  # The spellfix1 module not part of the default amalgation
  s.subspec 'spellfix1' do |ss|
    ss.dependency 'sqlite3/common'
    ss.source_files = "#{archive_name}/ext/misc/spellfix.c"
  end
end
