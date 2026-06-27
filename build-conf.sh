#!/bin/sh

echo "Building ThemeSwitcher..."
g++ ./ThemeManager/ThemeSwitcher.cpp -o ./ThemeManager/ThemeSwitcher

echo "Building ThemeGenerator..."
g++ ./ThemeManager/ThemeGenerator.cpp -o ./ThemeManager/ThemeGenerator

echo "Building waybar background transparency program..."
g++ ./ThemeManager/WBTP.cpp -o ./ThemeManager/WBTP


