class User < ActiveRecord::Base
  has_secure_password

  enum role: %w(default admin)
end
