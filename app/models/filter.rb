class Filter < ActiveRecord::Base
  belongs_to :user
  has_many :visits, dependent: :destroy
  validates :name, :path, :user_id, :web_property_id, presence: true

  # Public: Find the Legato Profile object for the Web Property ID.
  #
  # Unfortunately Legato doesn't currently offer a way to find a
  # profile based off a Web Property ID, so we've got to loop 
  # through 'em all to find the correct one.
  #
  # Returns Legato::Management::Profile
  def profile_for_web_property
    user.ga_profiles.detect { |profile| profile.web_property_id == web_property_id }
  end

  # Public: Import Google Analytics Unique Views based off this Filter.
  #
  def import_analytics
    profile = profile_for_web_property

    # Generate our Legato Filter
    create_dynamic_filter

    results = unique_page_view_results(profile)

    results.each do |result|
      visit = visits.find_or_initialize_by(path: result.pagePath)
      # Check if the record is in the database, and if we need to save or not.
      if visit.persisted?
        # The record is already in the database.
        # We only want to re-save it if there's been a change to the pageviews.
        visit.update_attribute(:pageviews, result.uniquePageviews) unless visit.pageviews == result.uniquePageviews
      else
        # The record is brand new, so we'll save it regardless.
        visit.pageviews = result.uniquePageviews
        visit.save
      end
    end

    update_attribute :last_imported, Time.now
  end

  # Create a Legato filter dynamically using this template's information.
  #
  def create_dynamic_filter
    UniquePageViews.new_dynamic_filter(name, path)
  end

  # Search for Unique Page Views using our dynamically created Legato filter.
  #
  def unique_page_view_results(profile)
    UniquePageViews.send(name.to_sym).results(profile)
  end
end
