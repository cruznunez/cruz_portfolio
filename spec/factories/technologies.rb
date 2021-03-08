FactoryBot.define do
  factory :technology do
    name 'Rails'
    link 'https://github.com/rails/rails'

    trait 1 do
      name 'tech1'
      link 'http://github.com/cnunez/tech1'
    end

    trait 2 do
      name 'tech2'
      link 'http://github.com/cnunez/tech2'
    end
  end
end
