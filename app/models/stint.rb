require './app/models/track.rb'
#based on the track and tyre type calculates the stint total time and number of laps

class Stint
    def initialize (track:, tyre:, pit_time:, average_time_in_seconds:)
        @track = track
        @tyre = tyre
        @pit_time = pit_time
        @average_time_in_seconds = average_time_in_seconds
    end

    def laps
        case tyre
        when "ss"
          (25 / track.lap_distance).floor
        when "s"
          (50 / track.lap_distance).floor
        when "m"
          (100 / track.lap_distance).floor
        end
    end

    def duration
        on_track_duration + pit_duration
    end 

    def on_track_duration
        laps * (average_time_in_seconds + tire_pace_difference)
    end

    def tire_pace_difference
      case tyre
      when "ss"
        0
      when "s"
        0.4
      when "m"
        1.2
      end
    end

    def pit_duration
      pit_time + track.pit_lane_duration
    end

    attr_reader :tyre
    attr_reader :track
    attr_reader :pit_time
    attr_reader :average_time_in_seconds
end