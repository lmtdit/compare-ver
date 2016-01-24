
###*
* Compares two software version numbers (only number)
*
* This function was born in http://stackoverflow.com/a/6832721.
* @parse string newVer (e.g. "1.7.1" or "1.2.1").
* @parse string oldVer (e.g. "1.7.1" or "1.2.1").
* @return <,return -1
*         =,return 0
*         >,return 1
*         error, return < -1
* eg:
*   compareVer("0.0.2","0.0.1") //1
*   compareVer("0.0.10","0.0.1") //1
*   compareVer("0.0.10","0.0.2") //1
*   compareVer("0.9.0","0.9") //1
*   compareVer("0.10.0","0.9.0") //1
*   compareVer("1.7", "1.07") //1
*   compareVer("1.0.07", "1.0.007") //1
*
*   compareVer("0.3","0.3") //0
*   compareVer("0.0.3","0.0.3") //0
*   compareVer("0.0.3.0","0.0.3.0") //0
*
*   compareVer("0.2.0","1.0.0") //-1
*   compareVer('0.0.2.2.0',"0.0.2.3") //-1
*   compareVer('0.0.2.0',"0.0.2") //-1
*   compareVer('0.0.2',"0.0.2.0") //-1
*   compareVer("1.07", "1.7") //-1
*   compareVer("1.0.007", "1.0.07") //-1
*
*   compareVer("0.0.2") //-100
*   compareVer(1212,"0.0.2") //-2
*   compareVer("0.0.2",1212) //-3
*   compareVer('1.a.2',"1.0.2") //-4
*   compareVer('1.0.2',"1.a.2") //-5
###
((root, factory)->
    if typeof exports == 'object'
        module.exports = factory()

    else if typeof define == 'function' && define.amd
        define(factory)
    else
        root.compareVer = factory()
)(this, ->
    'use strict'
    _compareVer = (newVer,oldVer)->
        VER_RE = /(\d+\.){1,9}\d+/
        if arguments.length != 2
          return -100
        if typeof newVer != 'string'
            return -2
        if typeof oldVer != 'string'
            return -3
        newMatch = newVer.match(VER_RE)
        if not newMatch or newMatch[0] != newVer
            return -4
        oldMatch = oldVer.match(VER_RE)
        if not oldMatch or oldMatch[0] != oldVer
            return -5
        if newVer == oldVer
            return 0
        else
            newArr = newVer.split('.')
            oldArr = oldVer.split('.')
            newLen = newArr.length
            oldLen = oldArr.length
            maxLen = Math.max(newLen,oldLen)
            zerofill = ->
                if newArr.length < maxLen
                    newArr.push(0)
                else if oldArr.length < maxLen
                    oldArr.push(0)
                newArr.length != oldArr.length && zerofill()
            newLen != oldLen && zerofill()
            if newArr.toString() == oldArr.toString()
                return if newLen > oldLen then 1 else -1
            else
                isTrue = -1
                compareNum = ->
                    _new = ~~newArr.shift()
                    _old = ~~oldArr.shift()
                    _new > _old && isTrue = 1
                    _new == _old && newArr.length > 0 && compareNum()
                compareNum()
                return isTrue
    return _compareVer
)
