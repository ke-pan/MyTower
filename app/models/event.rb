# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  project_name     :string           not null
#  project_path     :string           not null
#  resource_name    :string           not null
#  resource_path    :string           not null
#  description      :string           not null
#  user_name        :string           not null
#  user_path        :string           not null
#  user_id          :integer
#  team_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  subresource      :string
#  subresource_path :string
#
# Indexes
#
#  index_events_on_created_at  (created_at)
#  index_events_on_team_id     (team_id)
#  index_events_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_0cb5590091  (user_id => users.id)
#  fk_rails_f62361cf64  (team_id => teams.id)
#

class Event < ActiveRecord::Base
  paginates_per 50

  belongs_to :user
  belongs_to :team

  scope :recent, -> { order(created_at: :desc) }
end
