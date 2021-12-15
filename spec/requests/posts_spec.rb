# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   include ControllerMacros
#   before(:all) do
#   login_user
#   end

#   describe 'test GET #index' do
#     before(:example) { get user_posts_path(1) }

#     it 'return correct response status' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'should return the rendered template' do
#       expect(response).to render_template('index')
#     end
#   end

#   describe 'test GET #show' do
#     before(:example) do
#       post = FactoryBot.create :post, user: @user
#       get user_post_path(@user.id, post.id)
#     end

#     it 'return correct response status' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'should return the rendered template' do
#       expect(response).to render_template('show')
#     end
#   end
# end
