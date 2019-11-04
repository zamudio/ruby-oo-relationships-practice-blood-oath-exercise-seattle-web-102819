require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new("FI", "florida", 1919, "boo")
cult2 = Cult.new("microsoft", "seattle", 1990, "blah")
cult3 = Cult.new("apple", "florida", 1920, "po")
follower1 = Follower.new("bob", 45, "poop")
follower2 = Follower.new("pat", 40, "floo")
follower3 = Follower.new("pat", 35, "floo")
follower4 = Follower.new("pat", 25, "floo")

bo1 = BloodOath.new(follower1, cult1, "2019-10-31")
bo2 = BloodOath.new(follower2, cult2, "2019-10-30")
bo3 = BloodOath.new(follower2, cult1, "2019-9-29")
bo4 = BloodOath.new(follower3, cult1, "2019-1-29")
bo5 = BloodOath.new(follower2, cult3, "2019-11-29")
bo6 = BloodOath.new(follower4, cult1, "2019-8-29")
bo7 = BloodOath.new(follower4, cult3, "2019-4-29")
bo8 = BloodOath.new(follower3, cult2, "2019-2-29")


binding.pry
0