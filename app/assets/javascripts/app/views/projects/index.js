CATARSE.ProjectsIndexView = Backbone.View.extend({

  initialize: function() {
    _.bindAll(this, "render", "ProjectView", "ProjectsView", "initializeView", "search", 'updateSearch')
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
    this.initializeView(_this.getObjectFromUrl(search))

    // Update text on search field
    var input = this.$('#search')
    if(search.q && input.val() != search.q)
      input.val(search)
  },

  updateSearch: function(){
    var search = encodeURIComponent(this.$('#search').val())
    CATARSE.router.navigate("search/q=" + search, true)
  },

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
  },

  getObjectFromUrl: function(query) {
    var data = query.split("&")
    var result = {}
    for(var i=0; i<data.length; i++) {
      var item = data[i].split("=")
      if(item[0] == 'q')
        item[0] = 'pg_search';
      result[item[0]] = item[1]
    }
    return result
  }

})
