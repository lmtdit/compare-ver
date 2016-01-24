if typeof require == 'function'
    should = require('should')
    compareVer = require('../index')
describe 'compare version', ->
    it 'compare 1', ->
        compareVer("1.7.2","1.7.1").should.equal(1)
        compareVer("1.7.10","1.7.1").should.equal(1)
        compareVer("1.8.0", "1.7.10").should.equal(1)
        compareVer("1.7.0", "1.7").should.equal(1)
        compareVer("1.8.0", "1.7").should.equal(1)

    it 'compare 2', ->
        compareVer("1.7.1", "1.7.10").should.equal(-1)
        compareVer("1.7.2", "1.7.10").should.equal(-1)
        compareVer("1.6.1", "1.7.10").should.equal(-1)

    it 'compare 3', ->
        compareVer("1.7", "1.7").should.equal(0)
        compareVer("1.7.0", "1.7.0").should.equal(0)
        compareVer("1.7.10", "1.7.10").should.equal(0)

    it 'compare 4', ->
        compareVer("1.6", "1.7.10").should.equal(-1)
        compareVer("1.6.10", "1.7.10.0").should.equal(-1)
        compareVer("1.6.20", "1.7.10").should.equal(-1)

    it 'fompare 5', ->
        compareVer("1.7.1", "1.7.10").should.lessThan(0)
        compareVer("1.7", "1.7.0").should.lessThan(0)
        compareVer("1.7", "1.8.0").should.lessThan(0)
        compareVer("1.7.0", "1.7.00").should.lessThan(0)

    it 'compare 6', ->
        compareVer("1.7.0.0", "1.7.0.0").should.equal(0)
        compareVer("1.7.00", "1.7.00").should.equal(0)
        compareVer("1.70.00", "1.70.00").should.equal(0)

    it 'compare 7', ->
        compareVer("1.7.0", "1.7").should.greaterThan(0)
        compareVer("1.8.0", "1.7").should.greaterThan(0)
        compareVer("1.7.20", "1.7.10").should.greaterThan(0)
        compareVer("1.7.10", "1.7.1").should.greaterThan(0)
        compareVer("1.7.10", "1.6.1").should.greaterThan(0)
        compareVer("1.7.10", "1.6.20").should.greaterThan(0)

    it 'compare 8', ->
        compareVer(1.00001, "1.7").should.equal(-2)

    it 'compare 9', ->
        compareVer("1.7", 1.00001).should.equal(-3)

    it 'compare 10', ->
        compareVer("1.7.a", "1.7").should.equal(-4)
        compareVer("1.b.0", "1.7").should.equal(-4)

    it 'compare 11', ->
        compareVer("1.7", "1.7.a").should.equal(-5)
        compareVer("1.7", "1.b").should.equal(-5)

    it 'compare 12', ->
        compareVer("1.7.1").should.equal(-100)
        compareVer("1.7").should.equal(-100)

    it 'compare 13', ->
        compareVer("1.07", "1.7").should.equal(-1)
        compareVer("1.007", "1.07").should.equal(-1)
        compareVer("1.0.07", "1.07").should.equal(-1)
        compareVer("1.0.07", "1.0.7").should.equal(-1)
        compareVer("1.0.107", "1.0.10").should.equal(1)
        compareVer("1.0.7", "1.0.10").should.equal(-1)
