# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_projects_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_ecc227a0c2  (team_id => teams.id)
#

class Project < ActiveRecord::Base
  belongs_to :team
end
