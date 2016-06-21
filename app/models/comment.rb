# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  todo_id    :integer
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#
# Indexes
#
#  index_comments_on_slug     (slug) UNIQUE
#  index_comments_on_todo_id  (todo_id)
#
# Foreign Keys
#
#  fk_rails_9fcf49941a  (todo_id => todos.id)
#

class Comment < ActiveRecord::Base
  include HexedSlugable
  belongs_to :todo
  belongs_to :author, class_name: 'User'
end
