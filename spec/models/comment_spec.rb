require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Commentモデル" do
    it "contextが空の場合登録できないこと" do
      comment = build(:comment)
      expect(comment).to be_valid
    end
  end
end
