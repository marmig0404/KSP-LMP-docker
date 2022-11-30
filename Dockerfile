FROM mcr.microsoft.com/dotnet/sdk:5.0

RUN \
	apt update \
	&& apt install -y jq curl wget unzip nano

# get latest LMP release

WORKDIR /LMP-server
RUN curl --silent "https://api.github.com/repos/LunaMultiplayer/LunaMultiplayer/releases/latest" | jq -r '.assets[] | select(.name | contains("LunaMultiplayer-Server-Release.zip")) | .browser_download_url' | wget -i -
RUN unzip LunaMultiplayer-Server-Release.zip && rm ./LunaMultiplayer-Server-Release.zip

WORKDIR /LMP-server/LMPServer
RUN mkdir logs

EXPOSE 8800/udp
EXPOSE 8801/udp
EXPOSE 8900/tcp

VOLUME /LMP-server/LMPServer

CMD dotnet Server.dll
