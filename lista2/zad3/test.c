#include "test/*asdf*/header.h"
#include <stdio.h>

//Single-line comment with backslash - 1
/\
/ comment

//Single-line comment with backslash - 2
//\
comment


//Single-line doc comment with backslash - 1
//\
/comment


//Single-line doc comment with backslash - 2
/\
/\
/comment


//Multiple-line comment with bacsklash - 1
/\
*comment 
*\
/

"\\"//"This is legit comment
"\\\"//Tis is inside string"
"\\\\"//"This is legit comment
"\\\\\"//Tis is inside string"
"\\\\\\"//"This is legit comment
"\\\\\\\"//Tis is inside string"



//Multiple-line doc comment with bacsklash - 2
/*\
*\
comment 
*/      
//Some simple examples:

/*///////////////*/

int main(int argc, char const *argv[])
{
    printf("/* foo bar");
    "\\"//"
    "\""
    //*/ bar();

    // \
    /*
    baz();
    /*/
    foo();
    //*/

    return 1;
}
