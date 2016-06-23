require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "index" do
    team = create :team
    create :event, team: team
    user = create :user
    create :team_membership, user: user, team: team, role: TeamMembership.roles[:member]
    access_as user, :get, :index, team_id: team
    assert_not_nil assigns(:events)
    assert_response :success
  end

  test "index without auth" do
    team = create :team
    create :event, team: team
    get :index, team_id: team
    assert_redirected_to root_path
  end
end
