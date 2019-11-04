class Cult
    attr_accessor :name, :location, :founding_year, :slogan

    @@all = []

    def self.all
        @all
    end

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all << self
    end

    def recruit_follower(follower, date)
        BloodOath.new(follower, self, date)
    end

    def cult_population
        BloodOath.all.select {|bo| bo.cult == self}.length
    end

    def self.find_by_name(name)
        @@all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
       @@all.select {|cult|cult.location == location}
    end 

    def self.find_by_founding_year(year)
        @@all.select {|cult| cult.founding_year == year}
    end

    def average_age
        ages = []
        BloodOath.all.each do |bo| 
            if bo.cult == self
                ages << bo.follower.age
            end
        end
        sum = ages.reduce(:+).to_f 
        total = ages.length.to_f
        avg = sum/total
    end

    def my_followers_mottos
        mottos = []
        BloodOath.all.each do |bo| 
            if bo.cult == self
                mottos << bo.follower.life_motto
            end
        end
        puts mottos
        mottos
    end

    def self.least_popular
        min = 1000000000
        loser = []
        @@all.each do |cult|
            if cult.cult_population < min
                loser.replace([cult])
                min = cult.cult_population
            elsif cult.cult_population == min
                loser << cult
            end
        end
        loser
    end

    def self.most_common_location
        max = 0
        most_common = nil
        @@all.each do |cult|
            if Cult.find_by_location(cult.location).length > max
                most_common = cult.location
                max = Cult.find_by_location(cult.location).length
            end
        end
        most_common
    end
end