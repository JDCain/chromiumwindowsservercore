FROM microsoft/dotnet-framework:4.7.2-sdk-windowsservercore-1709  AS builder
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'Continue'; $verbosePreference='Continue';"]

WORKDIR /src
RUN Set-DisplayResolution -Width 1920 -Height 1080

ENV chocolateyUseWindowsCompression false
 RUN iex (wget 'https://chocolatey.org/install.ps1' -UseBasicParsing) 
 RUN choco feature disable --name showDownloadProgress
 RUN choco install chromium --version 72.0.3593.0-snapshots --pre -y

ENTRYPOINT ["powershell.exe"]
