FactoryBot.define do
  factory :review do
    id { 1 }
    user_id { 2 }
    name { '化粧品' }
    description { 'おすすめです。' }
    texture { 'しっとり' }
    price { '2000円' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }

    after(:build) do |review|
      # 親、子、孫を作成して、孫をitemのcategory_idに紐付ける
      parent_category = create(:category)
      child_category = parent_category.children.create(name: "hello")

      review.category_id = child_category.id
    end
  end
end
