importScripts("/wasm/wasm_exec.js");

(self as any).updateHexValue = (colorHex: string) => {
	postMessage({ type: "color-update", value: colorHex });
}

// @ts-ignore
const go = new Go()

// Load WASM
let wasmLoaded = false;
WebAssembly.instantiateStreaming(fetch("/wasm/main.wasm"), go.importObject)
	.then(result => {
		go.run(result.instance); // runs your Go main()
		wasmLoaded = true;
		postMessage({ type: "ready" }); // notify main thread
	})
	.catch(err => postMessage({ type: "error", error: err }));
