FactoryBot.define do
  factory :project do
    name 'Portfolio'
    description 'Project for tracking my other projects lol'
    repo_url 'https://github.com/cruznunez/cruz_portfolio'
    live_site 'http://cruznunez.io/v1'

    trait 1 do
      name 'test1'
      order 1
    end

    trait 2 do
      name 'test2'
      order 2
    end
  end
end
