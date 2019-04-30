class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :id, :avatar, :description, :token
  has_many :photos
end
