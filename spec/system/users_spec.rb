require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'Userシステム' do
    describe 'ユーザー未登録の場合' do
      it 'フォームが正常な場合新規登録できること' do
        visit new_user_registration_path
        fill_in 'メールアドレス', with: 'hogehoge@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認用）', with: 'password'
        click_button '登録'
        expect(page).to have_content 'アカウント登録が完了しました'
      end

      it 'メールアドレスが未入力の場合登録できないこと' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'Eメールまたはパスワードが違います'
      end

      it 'メールアドレスが重複している場合登録できないこと' do
        visit new_user_registration_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認用）', with: 'password'
        click_button '登録'
        expect(page).to have_content 'Eメールはすでに存在します'
      end
    end

    describe 'ユーザー登録済みの場合' do
      context 'ログイン機能' do
        it '正しくログインできること' do
          visit new_user_session_path
          fill_in 'メールアドレス', with: user.email
          fill_in 'パスワード', with: 'password'
          click_button 'ログイン'
          expect(page).to have_content 'ログインしました'
        end

        it 'メールアドレスが不適切な場合ログインできないこと' do
          visit new_user_session_path
          fill_in 'メールアドレス', with: ''
          fill_in 'パスワード', with: 'password'
          click_button 'ログイン'
          expect(page).to have_content 'Eメールまたはパスワードが違います'
        end
      end
    end
  end
end
