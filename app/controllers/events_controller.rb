class EventsController < ApplicationController
  def index
    team = Team.friendly.find(params[:team_id])
    @events = team.events.recent.page(params[:page]).decorate
  end
end
