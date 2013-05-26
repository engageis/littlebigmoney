module ApplicationHelper
  def link_to_global(name, url)
    link_to name, send("#{url}_url", {subdomain: false})
  end
end