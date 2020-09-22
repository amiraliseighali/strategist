require './app/models/track.rb'
require './app/models/stint.rb'
class Race
    #get an array of stints based on the tyres available at the track
    #create every possible combination of the stints
    #choose the fastest one for view
    def initialize (track:)
        @track = track
        @stints = []
    end

    def laps_left
        total_laps = @track.total_laps
        if @stints.length > 0
            # for i in 0..(@stints.length -1)
            @stints.each do |n|
                total_laps = total_laps - n.laps
            end
        else
            total_laps
        end 
        return total_laps
    end


    def add(stint)
        @stints.push(stint)
    end
    def total_time
        result = 0
        @stints.each do |n|
            result = result + n.duration
        end
        return result
    end

end