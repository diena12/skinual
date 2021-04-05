require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "POST#create" do
    subject { post(review_comments_path(review), params: params) }

    context "コメント対象の記事が存在する時" do
      let(:user) { create(:user) }
      let(:review) { create(:review, user: user) }
      let(:params) { { comment: attributes_for(:comment, review_id: review.id) } }

      before do
        sign_in user
      end

      it "コメントができる" do
        expect { subject }.to change { user.comments.count }.by(1)
        expect(response.status).to eq 302
      end
    end
  end
end
