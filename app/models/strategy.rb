require './app/models/track.rb'
require './app/models/stint.rb'
require './app/models/race.rb'

class Strategy
    #get an array of stints based on the tyres available at the track
    #create every possible combination of the stints
    #choose the fastest one for view
    def initialize (average_time_in_seconds:, track:, stints:)
        # Do we need this?
        @average_time_in_seconds = average_time_in_seconds

        @track = track
        @stints = stints
    end

    attr_reader :track
    attr_reader :stints

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



    # def all_strategies
    #     result = Array.new

    #     for i in 0..2
    #         new_race = Race.new(track: @track)
    #         new_race.add(@stints[i])
    #         if new_race.laps_left > 0
    #             for j in 0..2
    #                 new_race.add(@stints[j])
    #                 if new_race.laps_left > 0
    #                     # for k in 0..(@track.tyres.length -1)
    #                     for k in 0..2
    #                         new_race.add(@stints[k])
    #                         if new_race.laps_left > 0
    #                             result.push(new_race)   
    #                         end
                
    #                     end
    #                 else    
    #                     result.push(new_race)    
    #                 end
        
    #             end
    #         else    
    #             result.push(new_race)
    #         end

    #     end
    #     return result
    # end

    def all_strategies
        races = stints.map do |stint|
            race = Race.new(track: track)
            race.add(stint)
            race

        end
        # why do we return race? and cloned_race. without them it doesnt recognise finished?
        loop do
            if races.all?(&:unfinished?)
                races = races.flat_map do |race|
                    stints.map do |stint|
                        cloned_race = race.dup
                        cloned_race.add(stint)
                        cloned_race
                        
                    end
                end   
            else
                break races
            end
        end

    end

# [
    # [ss, ss, ss, m],
    # [ss, ss, m],
    # [ss, m, m],
# ]

# []
# [[ss], [s], [m]]
# [[ss, ss], [ss, s], [ss, m], [s, s], [s, m], [m, m]]
# [[ss, ss], [ss, s], [ss, m], [s, s], [s, m], [m, m]]

# if races.all? { |race| race.finished? }
#   races
# else
#   races.flat_map do |race|
#     if race.finished?
#         race
#     else
#         stints.map do |stint|
#             cloned_race = race.dup
#             cloned_race.add(stint)
#         end
#     end
# end


    # pick a stint
    # if we're past the finish line, done
    # if not, find all combinations for the remaining distance

    # def all_strategies_again(distance_left = track.total_laps + track.lap_distance, stints_acc = [])
    #     stints.map do |stint|
    #         if # this stint crosses the finish line
    #             stints_acc + stint
    #         else
    #             all_strategies_again(distance_left - covered_distance, stints_acc + stint)
    #         end
    #     end
    # end
    
    def best_strategy
        # best_race = all_strategies[0]
        # all_strategies.each do |n|
        #     if best_race.total_time > n.total_time
        #         best_race = n
        #     end
        # end
        # return best_race
        
        

        all_strategies.sort_by(&:total_time).first
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