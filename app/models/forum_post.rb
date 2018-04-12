# == Schema Information
#
# Table name: forum_posts
#
#  id              :integer          not null, primary key
#  forum_thread_id :integer
#  user_id         :integer
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  solved          :boolean          default(FALSE)
#

class ForumPost < ApplicationRecord
  validates :body, presence: true,
                   length: { minimum: 10 }
  belongs_to :user
  belongs_to :forum_thread
end
