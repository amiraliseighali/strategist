class StrategyController < ApplicationController
  def index
  end

  def calculate 
    average_time_in_seconds = 85
    pit_time = 3
    #averge time in secs = params[:name]
    
    track = "Monaco"
    @track = Track.new(track_name: track)
    @stints = [Stint.new(track: @track, tyre:@track.tyres[0], pit_time: pit_time, average_time_in_seconds: average_time_in_seconds), 
               Stint.new(track: @track, tyre:@track.tyres[1], pit_time: pit_time, average_time_in_seconds: average_time_in_seconds), 
               Stint.new(track: @track, tyre:@track.tyres[2], pit_time: pit_time, average_time_in_seconds: average_time_in_seconds)]
    @strategy = Strategy.new(average_time_in_seconds: average_time_in_seconds,  track: @track, stints:@stints)
  end
end
