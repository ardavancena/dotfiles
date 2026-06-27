#include <iostream>
#include <fstream>
#include <cstdlib>
#include <sstream>
#include <string>

std::string expandHome(const std::string& path) {
    if (path.empty() || path[0] != '~') return path;
    const char* home = std::getenv("HOME");
    return home ? std::string(home) + path.substr(1) : path;
}

std::string getHomePath() {
    const char* home = std::getenv("HOME");
    return std::string(home ? home : "");
}

int main(int argc, char* argv[]) {
    // Expand ~ to full home path
    std::string filepath = expandHome("~/.config/waybar/background-transparency.css");

    // Open file for reading
    std::fstream file(filepath, std::ios::in | std::ios::out);

    if (!file.is_open()) {
        // File doesn't exist - create it
        file.open(filepath, std::ios::out);
        if (file.is_open()) {
            file.close();
            // Now reopen for read/write
            file.open(filepath, std::ios::in | std::ios::out);
        }
    }

    if (file.is_open()) {
        std::stringstream fileStream;
        fileStream << file.rdbuf();

        std::string fileContents = fileStream.str();

        file.clear();

        if (fileContents != "") {
            // if "waybar_background #" is found:

            // return

            file.close();
            std::ofstream file(filepath, std::ios::out | std::ios::in | std::ios::trunc);
            file.close();

        } else  {
            // if not:

            file.close();
            std::ofstream outFile(filepath, std::ios::out | std::ios::trunc);
            if (outFile.is_open()) {
                outFile << "@define-color waybar-background transparent;";
                outFile.close();
            }
        }

        file.close();
    }

    system("pkill -SIGUSR2 waybar");

    return EXIT_SUCCESS;
}
