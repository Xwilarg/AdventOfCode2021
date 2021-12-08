use std::fs::File;
use std::io::{self, BufRead};
use io::BufReader;

fn part1(lines: std::io::Lines<BufReader<File>>) {
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

fn part2(lines: std::io::Lines<BufReader<File>>) {
    for line in lines {
        let testValues = line.unwrap().split('|').nth(0).unwrap().trim().split(' ');
        let realValues = line.unwrap().split('|').nth(1).unwrap().trim().split(' ');
        let value = 0;
        println!("{}", testValues.filter(|&x| x.len() == 2).nth(0).unwrap());
    }
}

fn main() {
    let file = File::open("input.txt").unwrap();
    let lines = io::BufReader::new(file).lines();
    part1(lines);
    part2(lines);
}