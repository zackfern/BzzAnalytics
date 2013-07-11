Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '394359447134.apps.googleusercontent.com', 'u4a45s_bZ5VG_yqufbG5NXpZ', scope: 'userinfo.email, userinfo.profile, analytics.readonly'
end

