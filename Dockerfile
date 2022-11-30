FROM mcr.microsoft.com/dotnet/sdk:5.0

# install deps
RUN \
	apt update \
	&& apt install -y jq curl wget unzip nano

WORKDIR /LMP-server

# download the latest release to the server folder
RUN curl --silent "https://api.github.com/repos/LunaMultiplayer/LunaMultiplayer/releases/latest" | jq -r '.assets[] | select(.name | contains("LunaMultiplayer-Server-Release.zip")) | .browser_download_url' | wget -i -
RUN unzip LunaMultiplayer-Server-Release.zip && rm ./LunaMultiplayer-Server-Release.zip

# expose the server folder as a volume
VOLUME /LMP-server/LMPServer

# expose ports
EXPOSE 8800/udp
EXPOSE 8801/udp
EXPOSE 8900/tcp

# create directory for logs
WORKDIR /LMP-server/LMPServer
RUN mkdir logs

# start the server
CMD dotnet Server.dll
