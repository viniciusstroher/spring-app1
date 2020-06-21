@echo off
echo Iniciando App
IF "%JAVA_HOME%" == "" (
    echo Define JAVA_HOME
    pause
    exit
) ELSE (
    echo "%JAVA_HOME%"
)

if exist spring-2.3.1.RELEASE (
    echo Spring-cli already exists...
) else (
    echo Downloading Spring-cli...
    curl https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.3.1.RELEASE/spring-boot-cli-2.3.1.RELEASE-bin.zip -o spring-boot-cli-2.3.1.RELEASE-bin.zip
    jar -xvf spring-boot-cli-2.3.1.RELEASE-bin.zip
)

set PATH=%PATH%;%CD%\spring-2.3.1.RELEASE\bin

if exist app (
    echo Spring project ok...
) else (
    echo Downloading Spring project...
    mkdir app
    cmd /c spring init --build=maven --java-version=1.8 --dependencies=websocket --packaging=jar app/app.zip
    echo Extracting...
    cd %CD%\app && dir && jar -xvf app.zip
)

start cmd /k cd app && echo %JAVA_HOME% && mvnm spring-boot:run
