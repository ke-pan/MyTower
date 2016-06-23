# == Schema Information
#
# Table name: accesses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  owned      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_accesses_on_project_id  (project_id)
#  index_accesses_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_3b2e2d0e55  (project_id => projects.id)
#  fk_rails_e47574ce84  (user_id => users.id)
#

class Access < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
end
