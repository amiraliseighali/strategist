require './app/models/track.rb'
#based on the track and tyre type calculates the stint total time and number of laps

class Stint
    def initialize (track:, tyre:, pit_time:, average_time_in_seconds:)
        @track = track
        @tyre = tyre
        @pit_time = pit_time
        @average_time_in_seconds = average_time_in_seconds
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
    def tyre
        return @tyre
    end 
    def laps
        case @tyre
        when "ss"
          return (25/@track.lap_distance) 
        when "s"
          return (50/@track.lap_distance) 
        when "m"
            return (100/@track.lap_distance) 
        end
    end

    def duration
        case @tyre
        when "ss"
          return @average_time_in_seconds + @pit_time + @track.pit_lane_duration
        when "s"
          return @average_time_in_seconds + @pit_time + @track.pit_lane_duration + 0.4
        when "m"
            return @average_time_in_seconds + @pit_time + @track.pit_lane_duration + 0.8 + 0.4
        end
    end 


end