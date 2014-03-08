define(['jquery'], function($) {
  return {
    sports: function () {
      return $.ajax({
        url: "/api/sports",
        dataType: "json"
      });
    },
    events: function (sport_id) {
      return $.ajax({
        url: "/api/sports/" + sport_id,
        dataType: "json"
      });
    },
    outcomes: function (sport_id, event_id) {
      return $.ajax({
        url: "/api/sports/" + sport_id + "/events/" + event_id,
        dataType: "json"
      });
    }
  };
});
