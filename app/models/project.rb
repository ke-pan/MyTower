# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  slug       :string           not null
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_projects_on_slug     (slug) UNIQUE
#  index_projects_on_team_id  (team_id)
#
# Foreign Keys
#
#  fk_rails_ecc227a0c2  (team_id => teams.id)
#

class Project < ActiveRecord::Base
  include HexedSlugable
  belongs_to :team
end
