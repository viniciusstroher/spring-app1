@echo off
echo Iniciando App

IF "%JAVA_HOME%" == "" (
    echo "Configure a variavel JAVA_HOME!"
) ELSE (
    echo JAVA_HOME PATH: %JAVA_HOME%
)

;existe pasta do spring?
if exist spring-2.3.1.RELEASE (
    echo Spring-cli já existe
) else (
    echo Spring-cli ja existe
    curl https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.3.1.RELEASE/spring-boot-cli-2.3.1.RELEASE-bin.zip -o spring-boot-cli-2.3.1.RELEASE-bin.zip
    jar -xvf spring-boot-cli-2.3.1.RELEASE-bin.zip
)

set PATH=%PATH%;%CD%\spring-2.3.1.RELEASE\bin
echo %PATH%"

spring init --build=gradle --java-version=1.8 --dependencies=websocket --packaging=war app.zip
jar -xvf app.zip