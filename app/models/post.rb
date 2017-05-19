class Post < ActiveRecord::Base
  attr_accessible :body, :published_at, :title, :user_id, :image_attributes
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
#  title        :string(255)
#  body         :text
#  published_at :datetime
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  user_id      :integer
#
