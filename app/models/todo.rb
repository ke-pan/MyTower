# == Schema Information
#
# Table name: todos
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text
#  slug        :string           not null
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#  user_id     :integer
#  status      :integer          default(0), not null
#
# Indexes
#
#  index_todos_on_deleted_at  (deleted_at)
#  index_todos_on_project_id  (project_id)
#  index_todos_on_slug        (slug) UNIQUE
#  index_todos_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_45054f9c45  (project_id => projects.id)
#  fk_rails_d94154aa95  (user_id => users.id)
#

class Todo < ActiveRecord::Base
  include HexedSlugable
  acts_as_paranoid

  belongs_to :project
  belongs_to :assignee, class_name: 'User', foreign_key: :user_id
  has_many :comments

  validates :title, presence: true

  enum status: [:paused, :run, :finished]
end
