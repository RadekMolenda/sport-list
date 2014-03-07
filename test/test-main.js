var tests = [];
for (var file in window.__karma__.files) {
    if (/Spec\.js$/.test(file)) {
        tests.push(file);
    }
}

requirejs.config({
    // Karma serves files from '/base'
    baseUrl: '/base/public/src',

    paths: {
        'jquery': '../lib/jquery',
        'underscore': '../lib/underscore',
        'backbone': '../lib/backbone',
        'text': '../lib/text'
    },

    shim: {
        'underscore': {
            exports: '_'
        },
      jquery : {
        exports : 'jQuery'
      },
      underscore : {
        exports : '_'
      },
      backbone : {
        deps : ['jquery', 'underscore'],
        exports : 'Backbone'
      }
    },

    // ask Require.js to load these files (all our tests)
    deps: tests,

    // start test run, once Require.js is done
    callback: window.__karma__.start
});
