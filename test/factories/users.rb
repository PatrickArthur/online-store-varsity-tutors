FactoryGirl.define do
  factory :user do
    first_name "Sue"
    sequence(:last_name) {|i| "Sella the #{i.ordinalize}" }
    password "password1"
    city 'Bronx'
    state 'NY'
    zip_code '03306'
    phone_number_primary '555 555 5551'
    phone_number_secondary '123 456 7891'
    address '104 Who Cares Lane'
    country 'italy'
    password_confirmation "password1"
    sequence :email do |i|
      "sue#{i}@example.com"
    end
    terms_of_service false
    age_verification false
  end

  after(:create) do |u|
    u.roles << :customer
    u.save!
  end
end
