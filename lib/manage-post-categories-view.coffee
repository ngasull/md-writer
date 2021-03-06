ManageFrontMatterView = require "./manage-front-matter-view"
config = require "./config"
utils = require "./utils"

module.exports =
class ManagePostCategoriesView extends ManageFrontMatterView
  @labelName: "Manage Post Categories"
  @fieldName: "categories"

  fetchSiteFieldCandidates: ->
    uri = config.get("urlForCategories")
    succeed = (body) =>
      @displaySiteFieldItems(body.categories || [])
    error = (err) =>
      @error.text(err?.message || "Error fetching categories from '#{uri}'")
    utils.getJSON(uri, succeed, error)
