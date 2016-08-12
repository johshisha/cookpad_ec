FactoryGirl.define do
  factory :category do
    name "雑貨"
    image_url { "http://test#{id}.jpg" }
  end
end
