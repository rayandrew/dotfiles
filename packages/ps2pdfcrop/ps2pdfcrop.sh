#!/usr/bin/env bash

readonly PS2PDF=@ps2pdf@

"$PS2PDF" -dEPSCrop -dALLOWPSTRANSPARENCY $@
