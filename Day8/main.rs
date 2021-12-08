use std::fs::File;
use std::io::{self, BufRead};


fn main() {
    let file = File::open("input.txt").unwrap();
    let mut count = 0;
    for line in io::BufReader::new(file).lines() {
        for data in line.unwrap().split('|').nth(1).unwrap().trim().split(' ') {
            if data.len() == 2 || data.len() == 3 || data.len() == 4 || data.len() == 7 {
                count += 1;
            }
        }
    }
    println!("{}", count);
}