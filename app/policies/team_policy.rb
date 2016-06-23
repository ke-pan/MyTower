class TeamPolicy
  attr_reader :user, :team

  def initialize(user, team)
    @user = user
    @team = team
  end

  def show_events?
    membership = TeamMembership.find_by(team: team, user: user)
    membership && !membership.guest?
  end

end
