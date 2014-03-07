define(['app', 'underscore'], function(app, _) {
  describe('use underscore', function() {
    it('works', function() {
      expect(_.map([1, 2, 3], function(e) { return e * 2; })).toEqual([2, 4, 6]);
    });

    it('works with an app', function() {
      expect(app.initialize()).toEqual("initialize");
    });
  });
});
