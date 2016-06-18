# == Schema Information
#
# Table name: todos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  slug        :string           not null
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_todos_on_project_id  (project_id)
#  index_todos_on_slug        (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_45054f9c45  (project_id => projects.id)
#

class Todo < ActiveRecord::Base
end
