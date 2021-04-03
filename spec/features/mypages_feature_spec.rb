require 'rails_helper'

RSpec.feature "Show page test", type: :feature do
  let(:user) { create(:user) }

  background do
    sign_in user
    visit mypage_path(user)
  end

  scenario "Showページにアクセスすること" do
    within('.user-profile') do
      expect(page).to have_content user.name
      expect(page).to have_content user.skin_type
      expect(page).to have_content user.profile
    end
  end
end
