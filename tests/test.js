var compareVer, should;

if (typeof require === 'function') {
  should = require('should');
  compareVer = require('../index');
}

describe('compare version', function() {
  return it('compare 0', function() {
    compareVer("1.7.2", "1.7.1").should.equal(1);
    compareVer("1.7.10", "1.7.1").should.equal(1);
    return compareVer("1.8.0", "1.7.10").should.equal(1);
  });
});
