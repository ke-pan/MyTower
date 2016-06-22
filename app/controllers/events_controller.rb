class EventsController < ApplicationController
  def index
    team = Team.friendly.find(params[:team_id])
    @events = PaginatingDecorator.new(team.events.recent.page params[:page])
  end
end
