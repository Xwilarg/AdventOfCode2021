import std.stdio;

void main() {
    auto file = File("input.txt");
    auto range = file.byLine();

    int[] entrance = ['(', '[', '{', '<'];
    int[] exit = [')', ']', '}', '>'];
    int[] score = [3, 57, 1197, 25_137];
    auto finalScore = 0;

    foreach (line; range) {
        auto found = false;
        auto target = "";

        foreach (chr; line) {
            for (int i = 0; i < 4; i++) {
                if (entrance[i] == chr) {
                    target ~= exit[i];
                    break;
                }
                if (exit[i] == chr) {
                    if (target[target.length - 1] == exit[i]) {
                        target = target[0..$-1];
                        break;
                    } else {
                        finalScore += score[i];
                        found = true;
                        break;
                    }
                }
            }
            if (found) {
                break;
            }
        }
    }
    writeln(finalScore);
}