FactoryGirl.define do

  factory :manufacturer do
    name "Joeshmo"
    country "My country tiss of thee"
  end

  factory :car do
    manufacturer "makin cool stuff all day err day"
    color "some color"
    year "1921"
    mileage "123432"
  end
end
