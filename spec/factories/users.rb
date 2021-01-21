FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"000aaa"}
    password_confirmation {password}
    last_name             {"あア阿あ"}
    first_name            {"あア阿あ"}
    furi_last             {"アアアア"}
    furi_first            {"アアアア"}
    date_of_birth         {"1999-01-01"}
  end
end