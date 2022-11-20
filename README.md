You must install the dotnet 7 runtime first, on windows this is easiest using winget:
winget install Microsoft.DotNet.SDK.7

You must install the preview version of docker with support for WASI

Test it is working with:
docker run -dp 8080:8080   --name=wasm-example   --runtime=io.containerd.wasmedge.v1   --platform=wasi/wasm32   michaelirwin244/wasm-example

Follow the instructions here to modify a default ASPNET application:
https://github.com/SteveSandersonMS/dotnet-wasi-sdk

Once compiled, you can check it in wasmtime with:

wasmtime run wasmtest.wasm --tcplisten localhost:8080 --env ASPNETCORE_URLS=http://localhost:8080

To build the docker file:

docker buildx build --platform wasi/wasm32 -t wasitest .

To run:

docker run -dp 8080:8080 --name=wasitest --runtime=io.containerd.wasmedge.v1 --platform=wasi/wasm32 wasitest