#!/usr/bin/env bash

dir="$HOME/.config/rofi/themes"
theme='full'

## Run
rofi -show drun -theme "${dir}"/${theme}.rasi
