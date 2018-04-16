require 'ffaker'

namespace :stack do
  desc 'Create db entries for users, forum threads, and forum posts'
  task seed_db: :environment do
    categories = ["All", "CSS", "Databases", "Feedback", "Gems", "General", "Javascript", "Rails","Ruby","Servers", "Showcase", "Testing", "Tips"]


    5.times do
      User.create(
        first_name: FFaker::Name.first_name,
        last_name: FFaker::Name.last_name,
        email: FFaker::Internet.email,
        password: 'asdfasdf',
        password_confirmation: 'asdfasdf'
      )
    end

    User.all.each do |user|
      5.times do
        ForumThread.create(
          user_id: user.id,
          subject: FFaker::DizzleIpsum.sentence,
          category: categories.sample
        )
      end
    end

    ForumThread.all.each do |forumthread|
      5.times do
        forumthread.forum_posts.create(
          user_id: User.all.pluck(:id).sample,
          forum_thread_id: forumthread.id,
          body: FFaker::DizzleIpsum.paragraph
        )
      end
    end
  end
end
