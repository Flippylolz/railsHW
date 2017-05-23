class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  mount_uploader :url, PostImagesUploader
end
# == Schema Information
#
# Table name: images
#
#  id             :integer         not null, primary key
#  url            :string(255)
#  imageable_id   :integer
#  imageable_type :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#
