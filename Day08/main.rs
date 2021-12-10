use std::fs::File;
use std::io::{self, BufRead};
use std::iter::FromIterator;

fn part1() {
    let file = File::open("input.txt").unwrap();
    let lines = io::BufReader::new(file).lines();
    let mut count = 0;
    for line in lines {
        for data in line.unwrap().split('|').nth(1).unwrap().trim().split(' ') {
            if data.len() == 2 || data.len() == 3 || data.len() == 4 || data.len() == 7 {
                count += 1;
            }
        }
    }
    println!("{}", count);
}

fn part2() {
    fn sort(mut arr: Vec<char>) -> String {
        arr.sort_by(|a, b| a.cmp(b));
        return String::from_iter(arr);
    }

    let file = File::open("input.txt").unwrap();
    let lines = io::BufReader::new(file).lines();
    let mut res = 0;
    for line in lines {
        let test_values = line.as_ref().unwrap().split('|').nth(0).unwrap().trim().split(' ');
        let real_values = line.as_ref().unwrap().split('|').nth(1).unwrap().trim().split(' ');

        let one = test_values.clone().filter(|&x| x.len() == 2).nth(0).unwrap().chars().collect::<Vec<char>>();
        let u_six = test_values.clone().filter(|&x| x.len() == 6 && (!x.contains(one[0]) || !x.contains(one[1]))).nth(0).unwrap();
        let six = sort(u_six.chars().collect::<Vec<char>>());
        let top_left = if six.contains(one[0]) { one[1] } else { one[0] };
        let u_three = test_values.clone().filter(|&x| x.len() == 5 && x.contains(one[0]) && x.contains(one[1])).nth(0).unwrap();
        let three = sort(u_three.chars().collect::<Vec<char>>());
        let two = sort(test_values.clone().filter(|&x| x.len() == 5 && x != u_three && x.contains(top_left)).nth(0).unwrap().chars().collect::<Vec<char>>());
        let five = sort(test_values.clone().filter(|&x| x.len() == 5 && x != u_three && !x.contains(top_left)).nth(0).unwrap().chars().collect::<Vec<char>>());
        let mut nine = "".to_string();
        for rv in test_values.clone() {
            if rv == u_six || rv.len() != 6 {
                continue;
            }
            let mut ok = 0;
            for letter in rv.chars() {
                if five.contains(letter) {
                    ok += 1;
                }
            }
            if ok == 5 {
                nine = sort(rv.chars().collect::<Vec<char>>());
            }
        }

        let mut value = 0;
        let mut i = 1;
        for data in real_values.rev() {
            let sd = sort(data.chars().collect::<Vec<char>>());

            let digit;
            let len = data.len();
            if len == 2 {
                digit = 1;
            } else if len == 3 {
                digit = 7;
            } else if len == 4 {
                digit = 4;
            } else if len == 7 {
                digit = 8;
            } else if sd == six {
                digit = 6;
            } else if sd == nine {
                digit = 9;
            } else if sd == three {
                digit = 3;
            } else if sd == five {
                digit = 5;
            } else if sd == two {
                digit = 2;
            } else {
                digit = 0;
            }
            value += digit * i;
            i *= 10;
        }
        res += value;
    }
    println!("{}", res);
}

fn main() {
    part1();
    part2();
}