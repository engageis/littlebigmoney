var CATARSE = {
  Adm: {},
  requireLogin: function(event, customUrl){
    event.preventDefault()
    var url = null
    if(typeof(customUrl) != 'undefined') {
      url = customUrl
    } else {
      if($(event.target).is('a')){
        url = $(event.target).attr('href')
      } else {
        url = $(event.target).parentsUntil('form').parent().attr('action')
      }
    }
    if(CATARSE.currentUser)
      location.href = url
    else
      location.href = "/login"
    //CATARSE.router.navigate("login/" + encodeURIComponent(url), true)
  },

  MixPanel: {

    namespace:  $('body'),
    user:       null,


    initialize: function(){
      this.user = (this.namespace.data('user') != null ) ? this.namespace.data('user') : null;


      this.identifyUser();
      this.trackUserClickOnProjectsImage();
      this.trackUserClickOnProjectsTitle();
      this.trackUserClickOnBackButton();
      this.trackUserClickOnRecommendedProject();
      this.trackUserClickOnReviewAndMakePayment();
      this.trackUserClickOnAcceptTerms();
      this.trackUserClickOnPaymentButton();


    },


    identifyUser: function(){
      if (this.user !== null){
        mixpanel.name_tag(this.user.id + '-' + this.user.name);
        mixpanel.identify(this.user.id);

      }
    },

    trackOnMixPanel: function(target, event, text, options){

      var self = this;

      $(target).on(event, function(){

        var obj     = $(this);
        var usr     = (self.user != null) ? self.user.id : null;
        var ref     = (obj.attr('href') != undefined) ? obj.attr('href') : null;
        var opt     = options || {};

        var default_options = {
          'page name':  document.title,
          'user_id':    usr,
          'project':    ref,
          'url':        window.location
        };


        var opt     = $.fn.extend(default_options, opt);

        self.identifyUser();
        mixpanel.track(text, opt);
      });

    },

    trackUserClickOnRecommendedProject: function(){
      this.trackOnMixPanel('#recommended_header h2', 'click', 'Clicked on a recommended banner');
    },

    trackUserClickOnReviewAndMakePayment: function(){
      this.trackOnMixPanel('input#backer_submit', 'click', 'Clicked on Review and Make Payment');
    },

    trackUserClickOnAcceptTerms: function(){
      this.trackOnMixPanel('label[for="accept"]', 'click', 'Accepted terms of use');
    },

    trackUserClickOnPaymentButton: function(){
      this.trackOnMixPanel('form.moip input[type="submit"]', 'click', 'Made a payment')
    },

    trackUserClickOnBackButton: function(){
      this.trackOnMixPanel('#back_project_form input', 'click', 'Clicked on Back this project');
    },

    trackUserClickOnProjectsImage: function(){
      this.trackOnMixPanel('.box .cover a', 'click', 'Clicked on a projects image @ homepage');
    },

    trackUserClickOnProjectsTitle: function(){
      this.trackOnMixPanel('.project_content h4','click', 'Clicked on a project\'s link box');
    },

  },

  Common: {
    init: function(){
      CATARSE.locale = $('#main_content').data("locale")
      CATARSE.currentUser = $('#main_content').data("user")
      // Common init for every action
      CATARSE.router = new CATARSE.Router()
      CATARSE.layout = new CATARSE.LayoutsApplicationView({el: $('html')})
      $(".best_in_place").best_in_place();
      $('.dropdown', '#personal_options').on('click', function(e){
        var $submenu = $(e.currentTarget).parent().find('.dropdown_profile');
        $submenu.toggleClass('active');
        return false;
      })

      CATARSE.MixPanel.initialize();
    },



    finish: function(){
      // Common finish for every action
      if (Backbone.history)
        Backbone.history.start()
    }
  },
  adm: {
    users:{
      index: function(){
        window.view = new CATARSE.Adm.Users.Index({el: $("body") });
      }
    },

    projects:{
      index: function(){
        window.view = new CATARSE.Adm.Projects.Index({el: $('body')});
      }
    },

    backers:{
      index: function(){
        window.view = new CATARSE.Adm.Backers.Index({el: $("body") });
      }
    }
  },
  home: {
    index: function(){
      window.view = new CATARSE.HomeIndexView({el: $("body") });
    }
  },
  projects: {
    index: function(){
      window.view = new CATARSE.ProjectsIndexView({el: $("body") });
    },
    show: function(){
      window.view = new CATARSE.ProjectsShowView({el: $("body") });
    },
    embed: function(){
      window.view = new CATARSE.ProjectsEmbedView({el: $("body") });
    },
    video_embed: function(){
      window.view = new CATARSE.ProjectsVideo_embedView({el: $("body") });
    },
    'new': function(){
      return new CATARSE.ProjectsNewView();
    },
    create: function(){
      return new CATARSE.ProjectsNewView();
    },
    pending: function(){
      window.view = new CATARSE.ProjectsPendingView({el: $("body") });
    },
    pending_backers: function(){
      window.view = new CATARSE.ProjectsPending_backersView({el: $("body") });
    },
    backers: {
      'new': function(){
        window.view = new CATARSE.BackersNewView({el: $("body") });
      },
      create: function(){
        window.view = new CATARSE.BackersCreateView({el: $("body") });
      }
    }
  },
  static: {
    guidelines: function(){
      window.view = new CATARSE.StaticGuidelinesView({el: $("body") });
    }
  },
  users: {
    show: function(){
      window.view = new CATARSE.UsersShowView({el: $("body") });
    }
  }
}
