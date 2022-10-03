class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username

  has_many :tickets
  has_many :assets
end
