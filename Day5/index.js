const fs = require('fs')

fs.readFile('input.txt', 'utf8' , (_, data) => {
    let values = [];
    let counted = [];
    let dups = 0;

    function checkDup(value) {
        if (counted.includes(value)) {
            return;
        } else if (values.includes(value)) {
            counted.push(value);
            dups++;
        } else {
            values.push(value);
        }
    }

    for (let line of data.replace(/\r/g, '').split('\n')) {
        if (line === "") { // File ends by a newline
            continue;
        }
        let m = line.match(/([0-9]+),([0-9]+) -> ([0-9]+),([0-9]+)/);
        let x1 = parseInt(m[1]);
        let y1 = parseInt(m[2]);
        let x2 = parseInt(m[3]);
        let y2 = parseInt(m[4]);

        if (x1 === x2) {
            for (let i = min = Math.min(y1, y2); i <= Math.max(y1, y2); i++) {
                let value = x1 * 1000 + i;
                checkDup(value);
            }
        } else if (y1 === y2) {
            for (let i = min = Math.min(x1, x2); i <= Math.max(x1, x2); i++) {
                let value = i * 1000 + y1;
                checkDup(value);
            }
        }
    }
    console.log(dups);
});