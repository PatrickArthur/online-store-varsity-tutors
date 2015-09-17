FactoryGirl.define do
  factory :user do
    first_name "Sue"
    sequence(:last_name) {|i| "Patrick #{i.ordinalize}" }
    password "password1"
    city 'Bronx'
    state 'NY'
    zip_code '03306'
    country 'italy'
    password_confirmation "password1"
    sequence(:email) {|i| "{i}@example.com" }
  end

  after(:create) do |u|
    u.roles << :customer
    u.save!
  end

  trait :admin do
    after(:create) do |admin|
      admin.roles << :admin
      admin.save!
    end
  end
end
