# == Schema Information
#
# Table name: comments
#
#  id                :bigint(8)        not null, primary key
#  content           :text             not null
#  user_id           :integer          not null
#  post_id           :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  parent_comment_id :integer
#

class Comment < ApplicationRecord

  validates :content, presence: true

  belongs_to :user
  belongs_to :post
  belongs_to :parent_comment,
    optional: true,
    foreign_key: :parent_comment_id,
    class_name: :Comment

  has_many :child_comments,
    foreign_key: :parent_comment_id,
    class_name: :Comment
end
