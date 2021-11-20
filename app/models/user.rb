class User < ApplicationRecord
  class User < ApplicationRecord
    def active_for_authentication?
      super && !deleted_at
    end
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com', first_name: "ゲスト") do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy
end
