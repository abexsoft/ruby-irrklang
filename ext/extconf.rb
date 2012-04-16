require 'mkmf'
require './LocalConfig.rb'

topDir = File.dirname(File.dirname(File.expand_path(__FILE__)))
execPlatform = LocalConfig::getExecPlatform().to_s
siteLib = topDir + "/build/lib/"
siteLibArch = siteLib + execPlatform
extlib = "../extlib"

### irrKlang
IRRKLANG="#{extlib}/irrKlang"
IRRKLANG_INC="-I" + IRRKLANG + "/include"

if (/mingw/ =~ RUBY_PLATFORM)
  IRRKLANG_LIB_PATH = IRRKLANG + "/bin/win32-gcc"
  system("mkdir -p #{siteLibArch}/IrrKlang")
  system("cp #{IRRKLANG_LIB_PATH}/*.dll #{siteLibArch}/IrrKlang")
else
  IRRKLANG_LIB_PATH = IRRKLANG + "/bin/linux-gcc"
  system("mkdir -p #{siteLibArch}/IrrKlang")
  system("cp #{IRRKLANG_LIB_PATH}/*.so #{siteLibArch}/IrrKlang")
end

system("cp -r #{IRRKLANG}/include  #{topDir}/build/")


IRRKLANG_LIB = "-L" + IRRKLANG_LIB_PATH + " -lIrrKlang"

# set flags
$CFLAGS += " -g " + IRRKLANG_INC

if (/mingw/ =~ RUBY_PLATFORM)
  $LDFLAGS += " -static-libgcc -static-libstdc++ " + IRRKLANG_LIB + " -lws2_32 -lwinmm"
else
  $LDFLAGS += " -static-libgcc -static-libstdc++ " + IRRKLANG_LIB
end

Config::MAKEFILE_CONFIG["sitelibdir"] = siteLib
Config::MAKEFILE_CONFIG["sitearch"] = execPlatform


$srcs = ["interface/irrklang_wrap.cpp"]


$objs = $srcs.collect {|o| o.sub(/\.cpp|\.cc|\.cxx/, ".o")}
$cleanfiles = $objs

create_makefile('IrrKlang')
