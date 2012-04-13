%{
#include <ik_SAudioStreamFormat.h>
%}

%nestedworkaround irrklang::ESampleFormat;
%nestedworkaround irrklang::SAudioStreamFormat;

%include "ik_SAudioStreamFormat.h"

%{
        typedef irrklang::ESampleFormat ESampleFormat;
        typedef irrklang::SAudioStreamFormat SAudioStreamFormat;
%}
