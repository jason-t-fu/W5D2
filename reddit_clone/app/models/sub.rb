# == Schema Information
#
# Table name: subs
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Sub < ApplicationRecord

  validates :title, :description, presence: true

  belongs_to :moderator,
    foreign_key: :user_id,
    class_name: :User

  has_many :post_subs, dependent: :destroy, inverse_of: :sub
  has_many :posts, through: :post_subs, source: :post

end
