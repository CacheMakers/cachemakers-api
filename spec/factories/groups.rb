FactoryGirl.define do
  factory :group do
    title "Example Group"
    description "The coolest group."
    location "makeshop"
    time "afternoon"
    weekday "monday"
    approved false
    age_cloverbud false
    age_intermediate false
    age_junior false
    age_senior false
  end
end
