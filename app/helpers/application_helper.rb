module ApplicationHelper
  # Public: Sets the yield(:title) block, for use in application.html.erb
  #   page_title - String for the page title
  #
  # Returns an HTML-safe string.
  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
    content_tag :h1, page_title
  end
end
