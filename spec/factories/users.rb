FactoryGirl.define do
  factory :user do
    email "john@smith.com"
    password "tararira"
    password_confirmation "tararira"
    first_name "John"
    last_name "Smith"
    date_of_birth { 30.years.ago }
    gender "male"
    employment_status "independent"
    civil_status "single"
  end
end
