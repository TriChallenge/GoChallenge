FactoryBot.define do
  factory :outdoor_session do
    association :user
    start_time { Faker::Time.backward(days: 14, period: :morning) }
    end_time { Faker::Time.backward(days: 14, period: :afternoon) }
    duration { ((end_time - start_time) / 3600).round(2) }
    description { Faker::Lorem.sentence }
  end
end
