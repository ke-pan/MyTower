# == Schema Information
#
# Table name: team_memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_team_memberships_on_team_id  (team_id)
#  index_team_memberships_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_5aba9331a7  (user_id => users.id)
#  fk_rails_61c29b529e  (team_id => teams.id)
#

class TeamMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
end
