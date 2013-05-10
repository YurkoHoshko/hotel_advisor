include ActionDispatch::TestProcess
FactoryGirl.define do

  factory :hotel do

    star_rating  Random.rand(1..5)
    breakfast_included  [true, false].sample
    room_description  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore  magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Du is   aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat   non   proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    price  1000
    country  "USA"
    state  "Califoria"
    city "Cougar town"
    street "Main avenue"
    sequence(:name) { |i| "Hotel ##{ i }" }

  end

  factory :comment do
    user_rating Random.rand(1..5)
    comment_content "Lorem ipsum dolor sit amet, consectetur adipisicing elit"
    user_id Random.rand(1..5)
    hotel
  end

  factory :user do
    sequence(:email) { |i| "sample##{ i }@example.com" }
    password "password"
  end


end
