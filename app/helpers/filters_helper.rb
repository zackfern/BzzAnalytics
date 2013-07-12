module FiltersHelper
  def web_property_ids_for_user(user)
    profiles = user.ga_profiles
    options_from_collection_for_select(profiles, 'web_property_id', 'name')
  end
end
