Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, BUZZ_CONFIG[:GOOGLE_KEY], BUZZ_CONFIG[:GOOGLE_SECRET],
    scope: 'userinfo.email, userinfo.profile, analytics.readonly'
end

