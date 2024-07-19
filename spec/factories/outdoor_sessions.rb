FactoryBot.define do
  factory :outdoor_session do
    association :user
    start_time { 1.hour.ago }
    end_time { Time.current }
    duration { ((end_time - start_time) / 1.hour).round(2) }
    description { Faker::Lorem.sentence }
  end
end
