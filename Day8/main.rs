use std::fs::File;
use std::io::{self, BufRead};

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
    let file = File::open("input.txt").unwrap();
    let lines = io::BufReader::new(file).lines();
    for line in lines {
        let test_values = line.as_ref().unwrap().split('|').nth(0).unwrap().trim().split(' ');
        let real_values = line.as_ref().unwrap().split('|').nth(1).unwrap().trim().split(' ');
        let value = 0;

        let one = test_values.clone().filter(|&x| x.len() == 2).nth(0).unwrap().chars().collect::<Vec<char>>();
        let bottom_left = test_values.filter(|&x| x.len() == 6 && x.contains(one[0]) && x.contains(one[1])).nth(0).unwrap();
        println!("{}", bottom_left);
    }
}

fn main() {
    part1();
    part2();
}