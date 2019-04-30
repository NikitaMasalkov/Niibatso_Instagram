class User < ApplicationRecord
  has_many :photos
  has_secure_password
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  validates :first_name, presence: true, uniqueness: true

  after_create :generate_token

  private

  def generate_token
    self.token = JsonWebToken.encode(user_id: self.id)
  end
end
