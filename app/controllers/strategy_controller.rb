class StrategyController < ApplicationController
  def index
  end

  def calculate 
    average_time_in_seconds = 85
    pit_time = 3
    #averge time in secs = params[:name]
    
    track = "Monaco"
    @track = Track.new(track_name: track)

    @stints = @track.tyres.map do |tyre|
        Stint.new(track: @track, tyre: tyre, pit_time: pit_time, average_time_in_seconds: average_time_in_seconds)
    end

    @strategy = Strategy.new(average_time_in_seconds: average_time_in_seconds,  track: @track, stints: @stints)
    
  end
end
