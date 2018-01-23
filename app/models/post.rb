class Post < ActiveRecord::Base
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image
  belongs_to :user

  scope :published, (-> { where('published_at IS NOT NULL') })
  scope :inverse, (-> { order('id DESC') })
  validates :title, :body, presence: true

  self.per_page = 10
end
# == Schema Information
#
# Table name: posts
#
#  id           :integer         not null, primary key
#  title        :string
#  body         :text
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#
