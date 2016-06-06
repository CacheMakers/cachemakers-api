FactoryGirl.define do
  factory :group do
    title "Example Group"
    description "The coolest group."
    location "makeshop"
    time "afternoon"
    weekday "monday"
    leader_email "test@test.com"
    leader_name "Test Leader"
    age_cloverbud false
    age_intermediate false
    age_junior false
    age_senior false
  end
end
