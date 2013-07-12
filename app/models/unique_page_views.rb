class UniquePageViews
  extend Legato::Model

  metrics :uniquePageviews
  dimensions :pagePath

  filter(:managed_lists) do
    contains(:pagePath, 'manage_lists/*')
  end
end
