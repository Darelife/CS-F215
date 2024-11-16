#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <algorithm>
#include <ctime> // For time-based sleep

using namespace std;

// Function to print the fancy header
void printHeader() {
    cout << "*" << endl;
    cout << "*                                           *" << endl;
    cout << "*       Welcome to ISRO Interplanetary      *" << endl;
    cout << "*                Mission                    *" << endl;
    cout << "*                                           *" << endl;
    cout << "*        Here is our Clock for Planet X1b   *" << endl;
    cout << "*                                           *" << endl;
    cout << "*" << endl;
    cout << endl;
}

// Function to map the 7-bit input to a 7-segment ASCII representation
void display7Segment(const string &bits, int position, bool isColon = false) {
    char a = (bits[6] == '1') ? '-' : ' ';
    char b = (bits[5] == '1') ? '|' : ' ';
    char c = (bits[4] == '1') ? '|' : ' ';
    char d = (bits[3] == '1') ? '-' : ' ';
    char e = (bits[2] == '1') ? '|' : ' ';
    char f = (bits[1] == '1') ? '|' : ' ';
    char g = (bits[0] == '1') ? '-' : ' ';

    if (position == 0) {
        cout << " " << a << "  ";
    } else if (position == 1) {
        cout << f << " " << b << " ";
    } else if (position == 2) {
        cout << " " << g << "  ";
    } else if (position == 3) {
        cout << e << " " << c << " ";
    } else if (position == 4) {
        cout << " " << d << "  ";
    }
}

// Function to read 7-bit patterns from the input file
vector<vector<string> > readPatterns(const string &filename) {
    ifstream infile(filename);
    vector<vector<string> > patterns;
    string line;

    if (!infile.is_open()) {
        cerr << "Error: Could not open file " << filename << endl;
        return patterns;
    }

    while (getline(infile, line)) {
        stringstream ss(line);
        vector<string> patternSet;
        string pattern;
        
        while (getline(ss, pattern, ',')) {
            // Trim any carriage return character in case of Windows line endings
            if (!pattern.empty() && pattern.back() == '\r') {
                pattern.pop_back();
            }
            if (pattern.size() == 7) {
                patternSet.push_back(pattern);
            }
        }
        if (patternSet.size() == 6) {
            patterns.push_back(patternSet);
        } else {
            cerr << "Error: Incorrect pattern size in line: " << line << endl;
        }
    }
    infile.close();
    return patterns;
}

// Function to clear screen for cross-platform support
void clearScreen() {
#ifdef _WIN32
    system("cls");
#else
    system("clear");
#endif
}

// Function to sleep for the given number of seconds using time()
void sleep(int seconds) {
    time_t start = time(nullptr); // Get the current time
    while (difftime(time(nullptr), start) < seconds) {
        // Busy-wait loop until the desired number of seconds has passed
    }
}

int main() {
    printHeader();

    vector<vector<string> > patterns = readPatterns("input.txt");

    if (patterns.empty()) {
        cerr << "Error: No valid patterns found in file." << endl;
        return 1;
    }

    for (const auto &patternSet : patterns) {
        vector<string> reversedPatternSet = patternSet;
        reverse(reversedPatternSet.begin(), reversedPatternSet.end());
        clearScreen();
        printHeader();

        int totalWidth = 45;
        int clockWidth = patternSet.size() * 4 + (patternSet.size() / 2 - 1) * 3;
        int padding = (totalWidth - clockWidth) / 2;

        for (int i = 0; i < 5; ++i) {
            cout << string(padding, ' ');
            for (size_t j = 0; j < reversedPatternSet.size(); ++j) {
                display7Segment(reversedPatternSet[j], i, false);
                if ((j + 1) % 2 == 0 && j != patternSet.size() - 1) {
                    if (i == 1 || i == 3) {
                        cout << " . ";
                    } else {
                        cout << "   ";
                    }
                }
            }
            cout << endl;
        }
        sleep(1); // Use the custom sleep function
    }
}
