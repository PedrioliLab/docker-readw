FROM ppatrick/wine

MAINTAINER Patrick Pedrioli
LABEL Description="A dockerized version of ReAdW. The converter for ThermoFinnigan RAW files." Version="2016.1.0"


###############
# ReAdW setup #
###############
RUN apt-get update
RUN apt-get -y install wget sudo

RUN wget -O /usr/local/bin/winetricks 'https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks' \
    && chmod 755 /usr/local/bin/winetricks

WORKDIR /usr/local/bin
RUN wget -O ReAdW.exe "https://github.com/PedrioliLab/ReAdW/blob/master/bin/ReAdW.2016010.xcalibur.exe?raw=true"
