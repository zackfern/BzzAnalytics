class User < ActiveRecord::Base
  has_many :filters, dependent: :destroy
  attr_reader :oauth_token

  # Public: Finds or creates a User by the UID returned from Google OAuth
  #
  # Returns a User
  def self.login_from_google(auth)
    user = find_by(uid: auth['uid'])
    if user.blank?
      create do |user|
        user.uid = auth['uid']
        user.email = auth['info']['email']
        user.token = auth['credentials']['token']
        user.token_expires_at = Time.strptime(auth['credentials']['expires_at'].to_s, '%s')
        user.refresh_token = auth['credentials']['refresh_token']
      end
    else
      user
    end
  end

  # Public: Generates an OAuth2 Token Object.
  # We'll use this within the Legato Gem to access Google Analytics.
  #
  def generate_oauth_token
    @client ||= OAuth2::Client.new(BUZZ_CONFIG[:GOOGLE_KEY], BUZZ_CONFIG[:GOOGLE_SECRET], {
      authorize_url: 'https://accounts.google.com/o/oauth2/auth',
      token_url: 'https://accounts.google.com/o/oauth2/token'
    })
    @oauth_token ||= OAuth2::AccessToken.from_hash(@client, {
      access_token: token,
      refresh_token: refresh_token
    })
    refresh_our_token if Time.now > token_expires_at

    return @oauth_token
  end

  # Public: Get a new OAuth Token from Google.
  #
  def refresh_our_token
    @oauth_token = @oauth_token.refresh!
    self.token = @oauth_token.token
    save
  end

  # Public: Generates a Legato::User using this user's Google token.
  #
  def legato
    @legato ||= Legato::User.new(generate_oauth_token)
  end

  # Public: Returns the User's Google Analytics profiles from Legato.
  #
  # Returns an Array.
  def ga_profiles
    legato.profiles
  end
end
