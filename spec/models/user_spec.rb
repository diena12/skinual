require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'ユーザー登録が可能な場合' do
    it '新規登録できること' do
      expect(user).to be_valid
    end
  end

  describe 'ユーザー名のバリデーションを検証する場合' do
    it 'ユーザー名が入力されていないと登録できないこと' do
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end
  end

  describe 'メールアドレスのバリデーションを検証する場合' do
    it 'メールアドレスが入力されていないと登録できないこと' do
      user.email = nil
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end
  end

  describe 'パスワードのバリデーションを検証する場合' do
    it 'パスワードと確認用パスワードが一致していないと無効な状態であること' do
      user.password = 'password'
      user.password_confirmation = 'invalid_password'
      user.valid?
      expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
    end

    it 'パスワードが6文字未満なら無効な状態であること' do
      user.password = user.password_confirmation = 'a' * 5
      user.valid?
      expect(user.errors[:password]).to include('は6文字以上で入力してください')
    end
  end
end
