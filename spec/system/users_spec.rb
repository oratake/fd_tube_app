require 'rails_helper'

RSpec.describe User, type: :system do
  # let(:user) { create(:user) }
  # let(:other_user) { create(:user) }

  # before do
  #   @user = build(:user)
  # end

  describe "Userシステム" do
    describe "未ログインの場合" do
      it "フォームが正常な場合新規登録できること" do
        visit new_user_registration_path
        expect(page).to have_content "ログイン"

        # fill_in "メールアドレス", with: "hogehoge@example.com"
        # fill_in "パスワード", with: "password"
        # fill_in "パスワード（確認用）", with: "password"
        # click_button '登録'
        # expect(current_path).to eq video_path
        # expect(page).to have_content "アカウント登録が完了しました"
      end

      # it "emailが未入力の場合に登録できないこと" do
      # end
      # it "emailがダブっている時に登録できないこと" do
      # end
    end
    
    # describe "ログイン済みの場合" do
    #   context "ユーザー編集機能" do
    #     it "フォームが正常な場合に更新できること" do
    #     end
    #     it "emailがnilの場合に登録できないこと" do
    #     end
    #   end
    # end
  end
end
