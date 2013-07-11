class User < ActiveRecord::Base
  def self.login_from_google(auth)
    user = find_by(uid: auth['uid'])
    if user.blank?
      create do |user|
        user.uid = auth['uid']
        user.email = auth['info']['email']
        user.token = auth['credentials']['token']
        user.token_expires_at = auth['credentials']['expires_at']
      end
    else
      user
    end
  end
end
