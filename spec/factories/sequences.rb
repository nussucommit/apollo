FactoryGirl.define do
  sequence :unique do |n|
    name = 'aaaaaaaa'
    n.times { name.succ! }
    name
  end
end
