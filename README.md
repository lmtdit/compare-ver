# compare-version

> Compares two software version numbers (only number)

-------

This code just uses Array.shift and recursive, which means that it can run in IE 6+.

## Install

```bash
$ npm install --save compare-ver
```

## Usage

```js
var compareVer = require('compare-ver');

console.log(compareVer.gt("0.0.2","0.0.1"));//1
console.log(compareVer.gt("0.0.10","0.0.1")); //1
console.log(compareVer.gt("0.0.10","0.0.2")); //1
console.log(compareVer.gt("0.9.0","0.9")); //1
console.log(compareVer.gt("0.10.0","0.9.0")); //1
console.log(compareVer.gt("1.7", "1.07")); //1
console.log(compareVer.gt("1.0.07", "1.0.007")); //1

console.log(compareVer.gt("0.3","0.3")); //0
console.log(compareVer.gt("0.0.3","0.0.3")); //0
console.log(compareVer.gt("0.0.3.0","0.0.3.0")); //0
console.log(compareVer.gt("00.3","0.3")); //0
console.log(compareVer.gt("00.3","00.3")); //0
console.log(compareVer.gt("01.0.3","1.0.3")); //0
console.log(compareVer.gt("1.0.3","01.0.3")); //0

console.log(compareVer.gt("0.2.0","1.0.0")); //-1
console.log(compareVer.gt('0.0.2.2.0',"0.0.2.3")); //-1
console.log(compareVer.gt('0.0.2.0',"0.0.2")); //-1
console.log(compareVer.gt('0.0.2',"0.0.2.0")); //-1
console.log(compareVer.gt("1.07", "1.7")); //-1
console.log(compareVer.gt("1.0.007", "1.0.07")); //-1

console.log(compareVer.gt()); //-100
console.log(compareVer.gt("0.0.2")); //-100
console.log(compareVer.gt("0.0.2","0.0.2","0.0.2")); //-100
console.log(compareVer.gt(1212,"0.0.2")); //-2
console.log(compareVer.gt("0.0.2",1212)); //-3
console.log(compareVer.gt('1.abc.2',"1.0.2")); //-4
console.log(compareVer.gt('1.0.2',"1.abc.2")); //-5
```

## License

[MIT License](http://en.wikipedia.org/wiki/MIT_License) © [lmtdit](https://github.com/lmtdit)

## End.
