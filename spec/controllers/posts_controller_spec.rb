require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  xit 'show a list of all posts' do
    get :index
    expect(response).to be(200)
  end
end
