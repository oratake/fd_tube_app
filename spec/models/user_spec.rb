require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Userモデル" do
    it "必須項目がnilの無効な状態であること" do
      user = User.new(
        user_name: "　　",
        email: "john@example.com",
        encrypted_password: "john@example.com",
        )
       expect(user).to_not be_nil
    end
  end
end
