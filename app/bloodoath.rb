require 'Time'
class BloodOath
    attr_accessor :follower, :cult, :initiation_date

    @@all = []

    def self.all
        @@all 
    end

    def initialize (follower, cult, initiation_date)
        @follower = follower
        @cult = cult
        @initiation_date = initiation_date
        @@all<<self
    end 

    def self.first_oath
        sorted = @@all.sort_by do |oath|
            Time.parse(oath.initiation_date)
        end
        sorted[0].follower
    end
end