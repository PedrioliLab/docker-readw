# A dockerized version of ReAdW. The converter for Thermo Fisher Scientific RAW files.

For more information on ReAdW see [this](https://github.com/PedrioliLab/ReAdW) repository.


## Building the image

**IMPORTANT**
This converter relies on DLLs from Thermo Fisher Scientific!
Before you can build the image make sure to create a ReAdW_DLLs folder:

    mkdir ReAdW_DLLs

and to add the following DLLs to it (more information on how to obtain them can be found at the [main](https://github.com/PedrioliLab/ReAdW) ReAdW repository):
- XRawfile2.dll
- fileio.dll
- fregistry.dll


To build the container please use:

    chmod 755 build.sh
    ./build.sh

Once the building process starts you will be asked to confirm installation of a few Windows components required by wine. 
Accept all installation requests. 
When prompted for a sudo password enter: 123

At the end of the process you should have a new docker image called ppatrick/readw.

Please note that the build procedure will make use of X11 forwarding (i.e. Mac users might need XQuartz installed).


## Using the image for data conversion

A script is provided to simplify the conversion task. Before you can use it make sure it is executable and somewhere withing your PATH:

    chmod 755 run.sh
    cp run.sh /usr/local/bin
    

By default the current directory is mounted in the container at /data.
E.g. to convert a file in the working directory called test.RAW:

    run.sh /data/test.RAW
