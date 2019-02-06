# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string           not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Post < ApplicationRecord

  validates :title, :url, presence: true

  has_many :post_subs, dependent: :destroy, inverse_of: :post
  has_many :subs, through: :post_subs
  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User
  has_many :comments
end
