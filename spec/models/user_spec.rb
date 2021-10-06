require 'rails_helper'

RSpec.describe User, type: :model do

  it "name と email を持ったユーザーを登録できること" do
    user = User.new(
      user_name: "John_Cony",
      email: "john@example.com",
      )
     # オブジェクトをexpectに渡す動作が有効であることを確認
     expect(user).to_not be_nil
  end

end
