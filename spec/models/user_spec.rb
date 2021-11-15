require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Userモデル" do
    it "バリデーションが発生していないこと" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end
