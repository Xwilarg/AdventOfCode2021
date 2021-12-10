import std.stdio, std.algorithm;

struct Incomplete
{
    string data;
    string target;
}

Incomplete[] process() {
    auto file = File("input.txt");
    auto range = file.byLine();

    int[] entrance = ['(', '[', '{', '<'];
    int[] exit = [')', ']', '}', '>'];
    int[] score = [3, 57, 1197, 25_137];
    auto finalScore = 0;

    Incomplete[] incompletes;

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
        if (!found) {
            Incomplete i;
            i.data = line.idup;
            i.target = target;
            incompletes ~= i;
        }
    }
    writeln(finalScore);
    return incompletes;
}

void main() {
    auto incompletes = process();
    long[] scores;
    foreach (inc; incompletes) {
        long score = 0;
        for (int i = inc.target.length - 1; i >= 0; i--) {
            score *= 5;
            final switch (inc.target[i])
            {
                case ')': score += 1; break;
                case ']': score += 2; break;
                case '}': score += 3; break;
                case '>': score += 4; break;
            }
        }
        scores ~= score;
    }
    scores.sort();
    writeln(scores[scores.length / 2]);
}