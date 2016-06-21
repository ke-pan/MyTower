require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "index" do
    team = create :team
    create :event, team: team
    get :index, team_id: team
    assert_not_nil assigns(:events)
    assert_response :success
  end
end
