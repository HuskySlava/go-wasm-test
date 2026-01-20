importScripts("wasm_exec.js")

function updateUnix(ts) {
    postMessage({ type: "unix-update", value: ts });
}

const go = new Go()

// Load WASM
let wasmLoaded = false;
WebAssembly.instantiateStreaming(fetch("main.wasm"), go.importObject)
    .then(result => {
        go.run(result.instance); // runs your Go main()
        wasmLoaded = true;
        postMessage({ type: "ready" }); // notify main thread
    })
    .catch(err => postMessage({ type: "error", error: err }));