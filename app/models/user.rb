class User  < ActiveRecord::Base
  has_secure_password

  enum({role: [:default, :admin]})
end
