FROM scratch as FINAL
COPY wasmtest.wasm .
ENTRYPOINT [ "wasmtest.wasm" ]