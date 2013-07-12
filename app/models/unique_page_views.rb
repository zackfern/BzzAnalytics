class UniquePageViews
  extend Legato::Model

  metrics :uniquePageviews
  dimensions :pagePath

  # Public: Generate a Legato Filter dynamically.
  #
  def self.new_dynamic_filter(name, path)
    filter(name.to_sym) do
      contains(:pagePath, path)
    end
  end
end
