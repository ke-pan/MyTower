# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_teams_on_slug  (slug) UNIQUE
#

class Team < ActiveRecord::Base
  include HexedSlugable

  has_many :projects
  has_many :team_memberships
  has_many :members, through: :team_memberships, source: :user

  validates :name, presence: true
end
