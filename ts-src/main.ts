const worker = new Worker("wasm_worker.js");
const testElm = document.getElementById("t")


let color = "#000000"

worker.onmessage = (e) => {
	if(e.data.type === "color-update"){
		if(testElm){
			testElm.textContent = e.data.value
			color = e.data.value
		}
	}
}

// @ts-ignore
globalThis.setColor = function setColor(){
	testElm!.style.color = color
}
