FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}"}
    sequence(:email) { |n| "person_#{n}@example.com"}
    password              "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end

  end

  factory :link do
    sequence(:content) { |n| "Google_#{n}"     }
    sequence(:uri)     { |n| "google_#{n}.com" }
  end


end