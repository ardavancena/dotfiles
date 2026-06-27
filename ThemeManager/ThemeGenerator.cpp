#include <cstdlib>
#include <ios>
#include <iostream>
#include <fstream>
#include <ostream>
// #include <unistd.h>

std::string getHomePath() {
    const char* home = std::getenv("HOME");
    return std::string(home ? home : "");
}

const std::string themesFolder = getHomePath() + "/.config/ThemeManager/themes/";

std::string waybarFolder = themesFolder + "waybar/";
std::string alacrittyFolder = themesFolder + "alacritty/";
std::string ghosttyFolder = themesFolder + "ghostty/";
std::string kittyFolder = themesFolder + "kitty/";

struct waybarColorConfig {
    // All of these values should be hex color values without "#" !!!
    std::string waybarBackground;
    std::string moduleBackground;
    std::string foreground;
    std::string active;
    std::string urgent;
    std::string error;

    waybarColorConfig(
            std::string waybarBackground, 
            std::string moduleBackground, 
            std::string foreground, 
            std::string active, 
            std::string urgent, 
            std::string error) {
        this->waybarBackground = waybarBackground;
        this->moduleBackground = moduleBackground;
        this->foreground = foreground;
        this->active = active;
        this->urgent = urgent;
        this->error = error;
    }
};

int waybarGenColors(std::string themeName,
//        std::string waybarBackground,
//        std::string moduleBackground, 
//        std::string foreground,
//        std::string active,
//        std::string urgent,
//        std::string error
    waybarColorConfig obj) {

    std::string makeThemeDir = "mkdir -p " + waybarFolder + themeName;
    system(makeThemeDir.c_str());

    std::fstream outputFile;
    outputFile.open(waybarFolder + "colors.css", std::ios::out);

    if (outputFile.is_open()) {
        outputFile << "@define-color waybar-background " << "#" << obj.waybarBackground << ";" << std::endl;
        outputFile << "@define-color moduleBackground " << "#" << obj.moduleBackground << ";" << std::endl;
        outputFile << "@define-color foreground " << "#" << obj.foreground << ";" << std::endl;
        outputFile << "@define-color active " << "#" << obj.active << ";" << std::endl;
        outputFile << "@define-color urgent " << "#" << obj.urgent << ";" << std::endl;
        outputFile << "@define-color error " << "#" << obj.error << ";" << std::endl;
        outputFile.close();
        std::cout << "File written successfully!" << std::endl;
    } else {
        std::cerr << "Error: Could not open file!" << std::endl;
    }
    return 0;
}

struct alacrittyColorConfig {
    std::string background;
    std::string foreground;

    std::string red;
    std::string blue;
    std::string black;
    std::string white;
    std::string green;
    std::string yellow;
    std::string cyan;
    std::string magenta;

    alacrittyColorConfig(
            std::string background, 
            std::string foreground,
            
            std::string red,
            std::string blue,
            std::string black,
            std::string white,
            std::string green,
            std::string yellow,
            std::string cyan,
            std::string magenta) {
        this->background = background;
        this->foreground = foreground;
        this->red = red;
        this->blue = blue;
        this->black = black;
        this->white = white;
        this->green = green;
        this->yellow = yellow;
        this->cyan = cyan;
        this->magenta = magenta;
    }
};

int alacrittyGenColors(std::string themeName, alacrittyColorConfig obj) {

    std::string makeThemeDir = "mkdir -p " + alacrittyFolder + themeName;
    system(makeThemeDir.c_str());

    std::fstream outputFile;
    outputFile.open(alacrittyFolder + "colors.toml", std::ios::out);

    if (outputFile.is_open()) {
        outputFile << 
        "[colors]" << std::endl <<
        "primary = { background = " << "\"#" << obj.background << "\"" << ", foreground = " << "\"#" << obj.foreground << "\" }" << std::endl <<
        "normal = {" << std::endl <<
        "    red = \"#" << obj.red << "\"," << std::endl << 
        "    blue = \"#" << obj.blue << "\"," << std::endl << 
        "    black = \"#" << obj.black << "\"," << std::endl << 
        "    white = \"#" << obj.white << "\"," << std::endl << 
        "    green = \"#" << obj.green << "\"," << std::endl << 
        "    yellow = \"#" << obj.yellow  << "\"," << std::endl << 
        "    cyan = \"#" << obj.cyan << "\"," << std::endl << 
        "    magenta = \"#" << obj.magenta << "\"," << std::endl << 
        "}" << std::endl;
        outputFile.close();
        std::cout << "File written successfully!" << std::endl;
    } else {
        std::cerr << "Error: Could not open file!" << std::endl;
    }
    return 0;
}

struct ghosttyColorConfig {
    std::string background;
    float background_opacity;
    bool background_blur;

    // Constructor
    ghosttyColorConfig(std::string background, float background_opacity, bool background_blur) :
        background(background), 
        background_opacity(background_opacity),
        background_blur(background_blur)
    {}
};

int ghosttyGenColors(ghosttyColorConfig obj) {

    std::fstream outputFile;
    outputFile.open(ghosttyFolder = "colors", std::ios::out | std::ios::trunc);

    if (!outputFile.is_open()) { std::cout << "Failed to open outputFile in function ghosttyGenColors"; return EXIT_FAILURE; }

    if (outputFile.is_open()) {
        outputFile << "background=" << obj.background << std::endl
                   << "background_opacity=" << static_cast<float>(obj.background_opacity) << std::endl 
                   << "background_blur=" << obj.background_blur;
    }

    return 0;
}

enum Program {
    waybar = 1,
    alacritty = 2,
    kitty = 3,
    ghostty = 4,
};

int main(int argc, char* argv[]) {
    if(argc != 3) {
        std::cout << "You should use this app with [executable] [app to generate config for] [themeName]";
        std::cout << "Apps that are supported:\n"
                  <<  "Waybar\n"
                  <<  "Alacritty\n"
                  <<  "Kitty\n"
                  <<  "Ghostty\n";
        return 1;
    }

    std::string appName = argv[1];
    std::string themeName = argv[2];

    unsigned int chosenApp = 0;
    if (appName == "Waybar") chosenApp = Program::waybar;
    else if (appName == "Alacritty") chosenApp = Program::alacritty;
    else if (appName == "Kitty") chosenApp = Program::kitty;
    else if (appName == "Ghostty") chosenApp = Program::ghostty;
    else {
        std::cout << "Could not resolve app name! maybe type the app name properly?" << std::endl;
        exit(1);
    }

    switch (chosenApp) {
        case (Program::waybar):
            {
                std::string waybarBackground;
                std::string moduleBackground;
                std::string foreground;
                std::string active;
                std::string urgent;
                std::string error;
                std::cout << "waybarBackground(hex color value with no #):"; std::cin >> waybarBackground;
                std::cout << "moduleBackground(hex color value with no #):"; std::cin >> moduleBackground;
                std::cout << "foreground(hex color value with no #):"; std::cin >> foreground;
                std::cout << "active(hex color value with no #):"; std::cin >> active;
                std::cout << "urgent(hex color value with no #):"; std::cin >> urgent;
                std::cout << "error(hex color value with no #):"; std::cin >> error;
                waybarColorConfig obj(waybarBackground, moduleBackground, foreground, active, urgent, error);
                waybarGenColors(themeName, obj);
            }
            break;
        case (Program::alacritty):
            {
                std::string background;
                std::string foreground;

                std::string red;
                std::string blue;
                std::string black;
                std::string white;
                std::string green;
                std::string yellow;
                std::string cyan;
                std::string magenta;
                
                std::cout << "background(hex color value with no #): "; std:: cin >> background;
                std::cout << "foreground(hex color value with no #): "; std:: cin >> foreground;

                std::cout << "red(hex color value with no #): "; std:: cin >> red;
                std::cout << "blue(hex color value with no #): "; std:: cin >> blue;
                std::cout << "black(hex color value with no #): "; std:: cin >> black;
                std::cout << "white(hex color value with no #): "; std:: cin >> white;
                std::cout << "green(hex color value with no #): "; std:: cin >> green;
                std::cout << "yellow(hex color value with no #): "; std:: cin >> yellow;
                std::cout << "cyan(hex color value with no #): "; std:: cin >> cyan;
                std::cout << "magenta(hex color value with no #): "; std:: cin >> magenta;

                alacrittyColorConfig obj(background, fo// marks is greater than 40reground, red, blue, black, white, green, yellow, cyan, magenta);
                alacrittyGenColors(themeName, obj);
            }
            break;

        case(Program::ghostty):
            {
                std::string background; // supposed to be a hex color value in a string type
                float background_opacity;
                bool background_blur;

                std::string* temp;

                std::cout << "background(hex color value with no #): "; std::cin >> background;
                std::cout << "background_opacity(float value)"; std::cin >> background_opacity;
                std::cout << "background_blur(bool, y for YES and n for NO)"; std::cin >> *temp;

                // *temp == "y" : background_blur = true ? background_blur = false;
                background_blur = (*temp == "y") ? true : false;

                delete temp;

                ghosttyColorConfig obj(background, background_opacity, background_blur);
                ghosttyGenColors(obj);

            }
            break;

        default:
            std::cout << "Didnt match any app! make sure you entered the name properly." << std::endl;
            exit(1);
    }

    return EXIT_SUCCESS;
}
