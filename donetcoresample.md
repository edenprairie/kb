# Setup .NET Core application on both Windows and Linux environment
- https://github.com/sixeyed/dotnet-album-viewer
- You should just be able to clone this repo as is on either Windows or Mac (and probably Linux) and do:
- git clone https://github.com/sixeyed/dotnet-album-viewer.git

``` 
cd dotnet-album-viewer
dotnet restore
cd .\src\AlbumViewerNetCore
dotnet run
```

## Install .net core on ubuntu Linux 16.04

- https://www.microsoft.com/net/download/linux-package-manager/ubuntu16-04/sdk-current

Register Microsoft key and feed
Before installing .NET, you'll need to register the Microsoft key, register the product repository, and install required dependencies. This only needs to be done once per machine.

Open a command prompt and run the following commands:
```
wget -q packages-microsoft-prod.deb https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
```

Install .NET SDK
Update the products available for installation, then install the .NET SDK.

In your command prompt, run the following commands:

```
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.1.200
```
If you need to install on 18.04 Ubuntu, please refer to this. 
https://www.microsoft.com/net/download/linux-package-manager/ubuntu18-04/sdk-current 
