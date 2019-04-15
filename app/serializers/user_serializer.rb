class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :id, :avatar, :description
  has_many :photos
end
