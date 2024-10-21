FactoryBot.define do
  factory :user do
    email { "user@example.com" }
    password { "password" }
    password_confirmation { password }  # Ensure the password confirmation matches
  end
end
