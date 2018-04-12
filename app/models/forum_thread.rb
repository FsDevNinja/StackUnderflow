# == Schema Information
#
# Table name: forum_threads
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string           default("general")
#  slug       :string
#
# Indexes
#
#  index_forum_threads_on_slug  (slug) UNIQUE
#

class ForumThread < ApplicationRecord
  extend FriendlyId
  friendly_id :subject, use: :slugged

  validates :subject, presence: true, length: { minimum: 10 }
  validates_associated :forum_posts
  belongs_to :user
  has_many :users, through: :forum_posts
  has_many :forum_posts, :inverse_of => :forum_thread, dependent: :destroy
  accepts_nested_attributes_for :forum_posts

  def solved?
    solved = false
    self.forum_posts.each do |post|
      if post.solved == true
        solved = true
      end
    end
    solved
  end

  searchkick

end
