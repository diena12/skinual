require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { create(:review, name: "香水",description: "いい匂い", texture: "しっとり", price: "2000")}

  describe 'reviewのバリデーションを検証する場合' do
    it '製品名が入力されていないと登録できないこと' do
      review.name = nil
      review.valid?
      expect(review.errors[:name]).to include('を入力してください')
    end

    it '紹介文が入力されていないと登録できないこと' do
      review.description = nil
      review.valid?
      expect(review.errors[:description]).to include('を入力してください')
    end

    it '質感が入力されていないと登録できないこと' do
      review.texture = nil
      review.valid?
      expect(review.errors[:texture]).to include('を入力してください')
    end

    it '価格が入力されていないと登録できないこと' do
      review.price = nil
      review.valid?
      expect(review.errors[:price]).to include('を入力してください')
    end
  end
end
