#!/bin/bash
set -e

em++ \
	-std=c++11 \
	-fno-exceptions \
	-fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Oz \
	-I. \
	-DHB_TINY \
	-DHB_USE_INTERNAL_QSORT \
	-DHB_CONFIG_OVERRIDE_H=\"config-override-subset.h\" \
	-DHB_EXPERIMENTAL_API \
	--no-entry \
	-s MODULARIZE \
	-s EXPORT_ES6=1 \
	-s EXPORTED_FUNCTIONS=@hb-subset.symbols \
	-s EXPORTED_RUNTIME_METHODS='["addFunction", "wasmMemory", "wasmExports"]' \
	-s INITIAL_MEMORY=65MB \
	-s ALLOW_TABLE_GROWTH \
	-lexports.js \
	-o hb-subset.js \
	hbjs-subset.cc
