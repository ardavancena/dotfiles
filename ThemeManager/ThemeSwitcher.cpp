// STYLE GUIDE
// Classes => PascalCase
// Variables => camelCase
// Preprocessor statements(functions, vars....) => CAPITAL_SNAKE_CASE

#include <iostream>
#include <vector>
#include <cstdlib>
#include <algorithm>
#include <string>

std::string getHomePath() {
    const char* home = std::getenv("HOME");
    return std::string(home ? home : "");
}

std::string waybarConfigFolder = getHomePath() + "/.config/waybar/";
std::string alacrittyConfigFolder = getHomePath() + "/.config/alacritty/";
std::string ghosttyConfigFolder = getHomePath() + "/.config/ghostty/";
std::string kittyConfigFolder = getHomePath() + "/.config/kitty/";
std::string themeFolder = getHomePath() + "/.config/ThemeManager/themes/";

int copyFile(std::string inputFilePath, std::string  outputPath) {
    std::string command = "cp " + inputFilePath + " " + outputPath;
    system(command.c_str());
    return 0;
}

int waybarCopyConfigFile(std::string chosenThemeFolder) {
    copyFile(chosenThemeFolder + "waybar/colors.css", waybarConfigFolder + "colors.css");
    std::cout << "Copied" + chosenThemeFolder + "waybar/colors.css" + " to " + waybarConfigFolder + "colors.css";
    return 0;
}

int alacrittyCopyConfigFile(std::string chosenThemeFolder) {
    copyFile(chosenThemeFolder + "alacritty/colors.toml", alacrittyConfigFolder + "colors.toml");
    std::cout << "Copied" + chosenThemeFolder + "alacritty/colors.toml" + " to " + alacrittyConfigFolder + "colors.toml";
    return 0;
}

int kittyCopyConfigFile(std::string chosenThemeFolder) {
    // TODO: FIX KITTY COPY CONFIG FUNCTION!!!
    // copyFile(chosenThemeFolder + "alacritty/colors.toml", alacrittyConfigFolder + "colors.toml");
    return 0;
}

std::vector<std::string> themes = {
    "Catpuccin-Mocha",
    "Catpuccin-Macchiato",
    "Catpuccin-Frappe",
    "Catpuccin-Latte",
    "Custom-Dark",
    "Custom-Dark-Cyan"
};

// argv[0] = executable
int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cout << "Needed at least one argument!(Theme)" << std::endl << 
        "Usage: [Program_Name] [Theme]" << std::endl <<
        "Available themes:" << std::endl;
        //"Catpuccin-Mocha => (Darkest Catpuccin, Original)" << std::endl <<
        //"Catpuccin-Macchiato => (Less Dark Catpuccin)" << std::endl <<
        //"Catpuccin-Frappe" << std::endl <<
        //"Catpuccin-Latte => (Lightest Catpuccin)" << std::endl <<
        //"Custom-Dark => (Recommended)" << std::endl;

        // Print all themes
        for (const std::string& theme : themes) {
            std::cout << "  " << theme << std::endl;
        }

        return 1;

    }

    std::string requestedTheme = argv[1];
    std::string requestedThemeFolder = themeFolder + requestedTheme + "/";
    std::cout << std::endl << "Chosen theme: " << requestedTheme << std::endl;

    // Check if input exists in themes
    bool themeExists = false;
    for (std::string theme : themes) {
        if (theme == requestedTheme) {
            themeExists = true;
            break;
        }
    }

    if (!themeExists) {
        std::cout << "Error: '" << requestedTheme << "' is not a valid theme" << std::endl;
        std::cout << "Available themes:" << std::endl;
        for (std::string theme : themes) {
            std::cout << "  " << theme << std::endl;
        }
        return 1;
    }
    
    //waybarCopyConfigFile(requestedThemeFolder);
    alacrittyCopyConfigFile(requestedThemeFolder);
    //kittyCopyConfigFile(requestedThemeFolder);

    return EXIT_SUCCESS;
}
