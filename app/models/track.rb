class Track
    #gets the track name from view and populates a track object using real life info
    def initialize (track_name:)
        @track_name = track_name
    end
    def total_laps
        78
    end
    def lap_distance
        3.337
    end
    def tyres
        ['ss','s','m']
    end
    def pit_lane_duration
        18.5
    end

end