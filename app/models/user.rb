class User < ActiveRecord::Base
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
      end
    else
      user
    end
  end

  # Public: Generates an OAuth2 Token Object.
  # We'll use this within the Legato Gem to access Google Analytics.
  #
  def oauth2_token
    @client = OAuth2::Client.new(BUZZ_CONFIG[:GOOGLE_KEY], BUZZ_CONFIG[:GOOGLE_SECRET], {
      authorize_url: 'https://accounts.google.com/o/oauth2/auth',
      token_url: 'https://accounts.google.com/o/oauth2/token'
    })
    OAuth2::AccessToken.from_hash(@client, { access_token: token })
  end

  # Public: Generates a Legato::User using this user's Google token.
  #
  def build_legato_user
    Legato::User.new(oauth2_token)
  end
end
