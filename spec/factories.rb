FactoryGirl.define do

  factory :manufacturer do
    id 4
    name "Joeshmo"
    country "My country tiss of thee"
  end

  factory :car do
    manufacturer
    color "That blue thoughhhhh"
    year "1921"
    mileage "123432"
  end
end
