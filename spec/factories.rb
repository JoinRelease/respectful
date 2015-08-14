FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'test1234'
    password_confirmation 'test1234'
  end

  factory :passing do
    first_name { Faker::Name.first_name }
    user
  end

  factory :burial_plan do
    passing
  end

  factory :cremation_plan do
    passing
  end

  factory :burial_cemetery_plan do
    burial_plan
  end

  factory :burial_mausoleum_plan do
    burial_plan
  end

  factory :plan_date do
    date { Date.today }
    trait :burial_plan_date do
      association :dateable, factory: :burial_plan
    end

    trait :cremation_plan_date do
      association :dateable, factory: :cremation_plan
    end
  end

  factory :culture do
    name 'Chinese'
  end

  factory :religion do
    name 'Christianity'
  end

  factory :worship_space do
    name { Faker::Company.name }
  end

  factory :address do
    line1 { Faker::Address.street_address }
    line2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip }
    trait :worship_space_address do
      association :addressable, factory: :worship_space
    end
    trait :burial_plan_address do
      association :addressable, factory: :burial_plan
    end
    trait :cremation_plan_address do
      association :addressable, factory: :cremation_plan
    end

    trait :passing_address do
      association :addressable, factory: :passing
    end
  end
end
