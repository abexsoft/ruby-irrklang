### How to compile all libraries.

\<topDir> means an absolute path to the top directory(here).

1. download external libraries.
   
    > $ cd \<topDir>  
    > $ mkdir extlib (if not at top directory)  
    > $ cd extlib  

       download a lastest source package from http://www.ambiera.com/irrklang/downloads.html  
       extract the source package and make a symbolic link, called "irrKlang".

    > $ unzip -x irrKlang-1.3.0b.zip   
    > $ ln -s irrKlang-1.3.0b/ ./irrKlang   
    > $ cd irrKlang

2. make ruby extension libraries.

    Just make at top directory.  

    > $ cd \<topDir>  
    > $ make  

    This make compiles a ruby extension library on ext/ with extlibs which are prepared above steps.   
    And then it copies libraries from ext/ and ois/build/ to build/x86-\<arch>/.  
