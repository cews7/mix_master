FactoryGirl.define do
 factory :artist do
   name       { Faker::Name.name }
   image_path { Faker::Avatar.image }
 end
 factory :song do
   title { Faker::Book.title }
   artist { FactoryGirl.create(:artist) }
 end
 factory :playlist do
   name { Faker::Book.genre }
 end
end
