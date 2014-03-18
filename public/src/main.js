requirejs.config({
  paths: {
    'jquery': '/lib/jquery',
    'underscore': '/lib/underscore',
    'backbone': '/lib/backbone',
    'text': '/lib/text'
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
  }
});

require(['app'], function(App) {
  App.start();
});
