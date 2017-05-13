require 'rails_helper'

RSpec.describe Post, type: :model do
end
# == Schema Information
#
# Table name: posts
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)
#  body         :text
#  published_at :datetime
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  user_id      :integer(4)
#

