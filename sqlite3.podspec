Pod::Spec.new do |s|
  s.name     = 'sqlite3'
  s.version  = '3.8.9.0'
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

  archive_name = "sqlite-amalgamation-#{s.version.to_s.gsub('.', '0')}"
  s.source   = { :http => "https://www.sqlite.org/#{Time.now.year}/#{archive_name}.zip" }
  s.requires_arc = false

  s.default_subspecs = 'common'

  s.subspec 'common' do |ss|
    ss.source_files = "#{archive_name}/sqlite*.{h,c}"
    ss.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DHAVE_USLEEP=1' }
  end

  s.subspec 'api_armor' do |ss|
    ss.dependency 'sqlite3/common'
    ss.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_API_ARMOR=1' }
  end

  s.subspec 'coldata' do |ss|
    ss.dependency 'sqlite3/common'
    ss.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_COLUMN_METADATA=1' }
  end

  s.subspec 'fts' do |ss|
    ss.dependency 'sqlite3/common'
    ss.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_FTS4=1 -DSQLITE_ENABLE_FTS3_PARENTHESIS=1' }
  end

  s.subspec 'rtree' do |ss|
    ss.dependency 'sqlite3/common'
    ss.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_RTREE=1' }
  end

  s.subspec 'soundex' do |ss|
    ss.dependency 'sqlite3/common'
    ss.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_SOUNDEX=1' }
  end

  s.subspec 'stat3' do |ss|
    ss.dependency 'sqlite3/common'
    ss.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_STAT3=1' }
  end

  s.subspec 'stat4' do |ss|
    ss.dependency 'sqlite3/common'
    ss.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_STAT4=1' }
  end

  s.subspec 'unicode61' do |ss|
    ss.dependency 'sqlite3/common'
    ss.dependency 'sqlite3/fts'
    ss.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_FTS4_UNICODE61=1' }
  end

  s.subspec 'unlock_notify' do |ss|
    ss.dependency 'sqlite3/common'
    ss.xcconfig = { 'OTHER_CFLAGS' => '$(inherited) -DSQLITE_ENABLE_UNLOCK_NOTIFY=1' }
  end
end
