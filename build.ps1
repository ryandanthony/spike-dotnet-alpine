#!/usr/bin/env pwsh
Push-Location ./src/test
    dotnet publish -c Release -f netcoreapp3.1 -r linux-musl-x64 -o out
    docker build -t "test:latest" .

Pop-Location
docker run -p 8080:80 test:latest
#curl -v http://localhost:8080/weatherforecast