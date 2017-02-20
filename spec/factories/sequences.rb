FactoryGirl.define do
  sequence :unique do |n|
    name = 'aaaaaaaa'
    n.times { name.succ! }
    name
  end

  sequence(:days) { |n| n % 7 }

  sequence(:bool, &:odd?)
end
