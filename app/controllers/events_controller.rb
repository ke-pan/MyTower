class EventsController < ApplicationController
  def index
    team = Team.friendly.find(params[:team_id])
    @events = PaginatingDecorator.new(team.events.recent.page params[:page])
    @last_midnight = params[:date] || ''
    @last_project_path = params[:project_path] || ''
  end
end
