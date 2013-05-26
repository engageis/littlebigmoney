CATARSE.ProjectsIndexView = Backbone.View.extend({

  initialize: function() {
    _.bindAll(this, "render", "ProjectView", "ProjectsView", "initializeView", "search", "updateSearch")
    CATARSE.router.route(":name", "category", this.category)
    CATARSE.router.route("search/*search", "search", this.search)
    CATARSE.router.route("", "index", this.index)
    this.render()
    _this = this;
  },

  ProjectView: CATARSE.ModelView.extend({
    template: function(){
      return $('#project_template').html()
    }
  }),

  ProjectsView: CATARSE.PaginatedView.extend({
    template: function(){
      return $('#projects_template').html()
    },
    emptyTemplate: function(){
      return $('#empty_projects_template').html()
    }
  }),

  search: function(search){
    //search = decodeURIComponent(search);
    console.log(search)
    //if(this.$('.section_header .replaced_header')) {
      //this.$('.section_header .replaced_header').remove();
    //}
    //this.$('.section_header .original_title').fadeOut(300, function() {
      //$('.section_header').append('<div class="replaced_header"></div>');
      //$('.section_header .replaced_header').html('<h1><span>Explore</span> / '+ search +'</h1>');
    //})
    //this.selectItem("")
    this.initializeView({
      pg_search: "&" + search
    })
    //var input = this.$('#search')
    //if(input.val() != search)
      //input.val(search)
  },

  //updateSearch: function(){
    //var search = encodeURIComponent(this.$('#search').val())
    //CATARSE.router.navigate("search/" + encodeURIComponent(search), true)
  //},

  index: function(){
    _this.selectItem("recommended")
    $("#loading").hide()
    //if($('.projects .project').length == 0) {
      //$("#loading").show()
      //_this.recent()
    //}
  },


  initializeView: function(search){
    if(this.projectsView)
      this.projectsView.destroy()
    this.projectsView = new this.ProjectsView({
      modelView: this.ProjectView,
      collection: new CATARSE.Projects({search: search}),
      loading: this.$("#loading"),
      el: this.$("#explore_results .results")
    })
  },

  selectItem: function(name) {
    this.selectedItem = $('.sidebar a[href=#' + name + ']')
    $('.sidebar .selected').removeClass('selected')
    this.selectedItem.addClass('selected')
  },

  render: function(){
    this.$('#header .search input').timedKeyup(this.updateSearch, 1000)
  }

})
