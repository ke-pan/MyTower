class EventsController < ApplicationController
  def index
    team = Team.friendly.find(params[:team_id])
    @events = team.events.recent.limit(50).decorate
  end
end
