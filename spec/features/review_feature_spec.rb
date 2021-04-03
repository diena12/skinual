require 'rails_helper'

RSpec.feature "Show page test", type: :feature do
  let(:user) { create(:user) }
  let(:review) { create(:review, user: user) }

  background do
    sign_in user
    visit review_path(review)
  end

  scenario "Showページにアクセスすること" do
    within('.product-detail') do
      expect(page).to have_content review.name
      expect(page).to have_content review.price
      expect(page).to have_content review.description
    end
  end

  scenario "リンクの確認" do
    expect(page).to have_link '編集', href: edit_review_path(review)
  end
end
