# compare-version

> Compares two software version numbers (only number)

## Install

```bash
$ npm install --save compare-ver
```

## Usage

```js
var compareVer = require('compare-ver');

compareVer("0.0.2","0.0.1") //1
compareVer("0.0.10","0.0.1") //1
compareVer("0.0.10","0.0.2") //1
compareVer("0.9.0","0.9") //1
compareVer("0.10.0","0.9.0") //1
compareVer("1.7", "1.07") //1
compareVer("1.0.07", "1.0.007") //1

compareVer("0.3","0.3") //0
compareVer("0.0.3","0.0.3") //0
compareVer("0.0.3.0","0.0.3.0") //0

compareVer("0.2.0","1.0.0") //-1
compareVer('0.0.2.2.0',"0.0.2.3") //-1
compareVer('0.0.2.0',"0.0.2") //-1
compareVer('0.0.2',"0.0.2.0") //-1
compareVer("1.07", "1.7") //-1
compareVer("1.0.007", "1.0.07") //-1

compareVer("0.0.2") //-100
compareVer(1212,"0.0.2") //-2
compareVer("0.0.2",1212) //-3
compareVer('1.a.2',"1.0.2") //-4
compareVer('1.0.2',"1.a.2") //-5
```

## License

[MIT License](http://en.wikipedia.org/wiki/MIT_License) © [lmtdit](https://github.com/lmtdit)

## End.
