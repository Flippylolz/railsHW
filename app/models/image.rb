class Image < ActiveRecord::Base
  attr_accessible :url

  belongs_to :imageable, polymorphic: true
end
# == Schema Information
#
# Table name: images
#
#  id             :integer(4)      not null, primary key
#  url            :string(255)
#  imageable_id   :integer(4)
#  imageable_type :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

