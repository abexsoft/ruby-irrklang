require 'mkmf'
require '../tool/LocalConfig.rb'

topDir = File.dirname(File.dirname(File.expand_path(__FILE__)))
execPlatform = LocalConfig::getExecPlatform().to_s

buildDir =    "#{topDir}/build/"
siteLib =     "#{buildDir}/lib/"
siteLibArch = "#{siteLib}/#{execPlatform}"

### irrKlang
IRRKLANG_INC=  "-I#{buildDir}/include"
IRRKLANG_LIB = "-L#{siteLibArch} -lIrrKlang"

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
