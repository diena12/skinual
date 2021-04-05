require 'rails_helper'

RSpec.describe "Mypages", type: :request do
  describe 'GET#show' do
    let(:user) { create(:user) }

    before do
      sign_in user
      get mypage_path(user)
    end

    it '正しく接続できること' do
      expect(response).to have_http_status "200"
    end

    it "showページにuser.nameが含まれていること" do
      expect(response.body).to include user.name
    end

    it "showページにuser.skin_typeが含まれていること" do
      expect(response.body).to include user.skin_type
    end

    it "showページにuser.profileが含まれていること" do
      expect(response.body).to include user.profile
    end
  end

  describe 'GET#edit' do
    let(:user) { create(:user) }

    before do
      sign_in user
      get edit_mypage_path(user)
    end

    it '正しく接続できること' do
      expect(response).to have_http_status "200"
    end

    it "showページにuser.nameが含まれていること" do
      expect(response.body).to include user.name
    end

    it "showページにuser.skin_typeが含まれていること" do
      expect(response.body).to include user.skin_type
    end

    it "showページにuser.profileが含まれていること" do
      expect(response.body).to include user.profile
    end
  end
end
