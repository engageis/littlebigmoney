CATARSE.HomeIndexView = Backbone.View.extend({
  initialize: function() {
    _.bindAll(this, "startSlider")
    this.startSlider();

  },

  startSlider: function(event) {
    $('#homebanner').cycle({
      fx:     'scrollHorz',
      speed:  400,
      timeout: 0,
      next:   '#nextBannerSlide',
      prev:   '#prevBannerSlide'
    });
  }

})