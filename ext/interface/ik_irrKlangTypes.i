%{
#include <ik_irrKlangTypes.h>
%}


%nestedworkaround irrklang::ik_f32;
%nestedworkaround irrklang::ik_c8;

%include "ik_irrKlangTypes.h"

%{
	typedef irrklang::ik_f32 ik_f32; 
	typedef irrklang::ik_c8 ik_c8; 
%}

