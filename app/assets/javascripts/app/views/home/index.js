CATARSE.HomeIndexView = Backbone.View.extend({
  events: {
    'click .banner_project a': 'changeBannerProject',
  },

  initialize: function() {
    _.bindAll(this, "startSlider")
    this.startSlider();
  },

  changeBannerProject: function(event) {
    var $parentSlide = $(event.target).closest('.slide');
    $featuredBanner = $('.featured_banner_project', $parentSlide);
    var $project = $(event.target).closest('.banner_project');
    var projectImage = $('img', $project).attr('src');
    $('.banner_project', $parentSlide).removeClass('active');
    $project.addClass('active');
    $('.proj_img img', $featuredBanner).attr('src', projectImage);
    $('.proj_title', $featuredBanner).html('<a href="'+$project.data('link')+'">'+$project.data('name')+'</a>');
    $('.proj_desc', $featuredBanner).html($project.data('description'));
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