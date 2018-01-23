class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  mount_uploader :url, PostImagesUploader
end
# == Schema Information
#
# Table name: images
#
#  id             :integer         not null, primary key
#  url            :string
#  imageable_type :string
#  imageable_id   :integer
#  created_at     :datetime
#  updated_at     :datetime
#
