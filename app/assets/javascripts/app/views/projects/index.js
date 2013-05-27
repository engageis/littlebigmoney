CATARSE.ProjectsIndexView = Backbone.View.extend({

  events: {
    'click section.highlights a': 'highlights',
    'click section.by_category_id a, section.by_country a, section.by_area a, section.by_impact a, section.by_entrepreneur_type a': 'setParams',
  },

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
    search = _this.getObjectFromUrl(search)
    this.initializeView(search)

    // Update text on search field
    var input = this.$('#search')
    if(search.pg_search && input.val() != search.pg_search)
      input.val(search.pg_search)
    _this.updateAtives()
  },

  updateAtives: function(){
    var params = _this.getParams()
    $('.highlights a').removeClass('active')
    if(params.recommended)
      $(".highlights a[data-search=recommended]").addClass('active')
    else if(params.expiring)
      $(".highlights a[data-search=expiring]").addClass('active')
    else if(params.recent)
      $(".highlights a[data-search=recent]").addClass('active')
    else if(params.successful)
      $(".highlights a[data-search=successful]").addClass('active')

    keys = ['category_id', 'country', 'area', 'impact', 'entrepreneur_type']

    _.each(keys, function(key){
      $('.by_' + key + ' a').removeClass('active')
      if(params['by_' + key])
        $(".by_" + key + " a[data-search=" + params['by_' + key] + "]").addClass('active')
    })
  },

  highlights: function(event){
    var params = _this.getParams()
    delete params.recommended
    delete params.expiring
    delete params.recent
    delete params.successful
    if(params.pg_search){
      params['q'] = params.pg_search
      delete params.pg_search
    }
    params[$(event.target).data('search')] = true
    CATARSE.router.navigate("search/" + $.param(params), true)
    _this.updateAtives()
    return false
  },

  setParams: function(event){
    var params = _this.getParams()
    if(this.$(event.target).hasClass('active')){
      // FIXME
      delete params[$(event.target).parents('section').attr('class')]
    } else {
      params[$(event.target).parents('section').attr('class')] = $(event.target).data('search')
    }
    CATARSE.router.navigate("search/" + $.param(params), true)
    _this.updateAtives()
    return false
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
    this.$('.search input').timedKeyup(this.updateSearch, 1000)
  },

  getParams: function(){
    var hash = window.location.hash
    if(hash == '#' || hash == '' || hash == '#search/' || hash == '#search'){
      return {}
    }

    hash = hash.replace(/#search?\//, '')
    var params = _this.getObjectFromUrl(hash)
    if(params.pg_search == '')
      delete params.pg_search
    return params
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
