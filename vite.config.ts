import { defineConfig } from 'vite'
import {viteStaticCopy} from 'vite-plugin-static-copy';

export default defineConfig({
	root: 'ts-src', // your source folder
	build: {
		outDir: '../dist', // output folder (relative to root)
		emptyOutDir: true, // clean dist before building
	},
	server: {
		open: true, // auto open browser
	}
})
