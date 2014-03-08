define(['jquery'], function($) {
  return {
    sports: function () {
      return $.ajax({
        url: "/api/sports"
      });
    },
    events: function (sport_id) {
      return $.ajax({
        url: "/api/sports/" + sport_id
      });
    },
    outcomes: function (sport_id, event_id) {
      return $.ajax({
        url: "/api/sports/" + sport_id + "/events/" + event_id
      });
    }
  };
});
