# Transmission-Qnap
Compiling from sources

    $ git clone --recurse-submodules https://github.com/transmission/transmission Transmission
    $ cd Transmission
    $ sudo mkdir /opt/qnap
    $ cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/opt/sources
    $ cd build
    $ cmake --build .
    $ sudo cmake --install .

Then put files to directories then do
    
    qbuild --build-arch arm_64