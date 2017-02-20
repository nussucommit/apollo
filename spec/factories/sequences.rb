FactoryGirl.define do
  sequence :unique do |n|
    name = 'aaaaaaaa'
    n.times { name.succ! }
    name
  end
  sequence :unique_int do |n|
    int = n % 7
    int
  end
  sequence :unique_bool do |n|
    out = if n.even?
            false
          else
            true
          end
    out
  end
end
