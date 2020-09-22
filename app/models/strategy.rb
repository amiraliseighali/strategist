require './app/models/track.rb'
require './app/models/stint.rb'
require './app/models/race.rb'
class Strategy
    #get an array of stints based on the tyres available at the track
    #create every possible combination of the stints
    #choose the fastest one for view
    def initialize (average_time_in_seconds:, track:, stints:)
        @average_time_in_seconds = average_time_in_seconds
        @track = track
        @stints = stints
    end
    def pitlap
        pit_laps = Array.new
        for i in 0..9
            # no 9 was number of laps
            if i == 0
                tyre = 1
            end
            tyre = tyre - wear_per_lap
            if tyre < wear_per_lap
                pit_laps.push(i+1)
                tyre = 1
            end
        end
        return pit_laps 
    end
    def wear_per_lap
        0.3
    end
    def all_strategies
        result = Array.new
        for i in 0..2
            new_race = Race.new(track: @track)
            new_race.add(@stints[i])
            if new_race.laps_left > 0
                for j in 0..2
                    new_race.add(@stints[j])
                    if new_race.laps_left > 0
                        # for k in 0..(@track.tyres.length -1)
                        for k in 0..2
                            new_race.add(@stints[k])
                            if new_race.laps_left < 1
                                result.push(new_race)   
                            end
                
                        end
                    else    
                        result.push(new_race)    
                    end
        
                end
            else    
                result.push(new_race)
            end

        end
        return result
    end
    
    def best_strategy
        best_race = all_strategies[0]
        all_strategies.each do |n|
            if best_race.total_time > n.total_time
                best_race = n
            end
        end
        return best_race
    end

end 
#pitlap to use calculation
#form to send the data from view to calculate
#use avg time in secs in calculation
#class Strategy  def initialize(average_time_in_seconds:)    @average_time_in_seconds = average_time_in_seconds  end  def pitlap    pitlaps.first  end  def pitlaps    total_wear = number_of_laps * tire_wear_per_lap    (average_time_in_seconds * 2) / 120    [12, 30]  end  private  attr_reader :average_time_in_seconds  def number_of_laps    60  end  def tire_wear_per_lap    0.01  endend

=begin def initialize (average_time_in_seconds:, number_of_laps:)
    @average_time_in_seconds = average_time_in_seconds
    @number_of_laps = number_of_laps
end
def pitlap
    pit_laps = Array.new
    for i in 0..@number_of_laps
        if i == 0
            tyre = 1
        end
        tyre = tyre - wear_per_lap
        if tyre < wear_per_lap
            pit_laps.push(i+1)
            tyre = 1
        end
    end
    return pit_laps 
end
def wear_per_lap
    0.3
end
def all_strategies

end
end 
=end