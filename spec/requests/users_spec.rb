# require 'rails_helper'

# RSpec.describe 'Users', type: :request do
#   include ControllerMacros
#   before(:all) do
#     login_user
#   end

#   describe 'GET #index' do
#     before(:example) { get users_path }

#     it 'return correct response status' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'should return the rendered template' do
#       expect(response).to render_template('index')
#     end
#   end

#   describe 'GET #show' do
#     before(:example) { get user_path(1) }

#     it 'return correct response status' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'should return the rendered template' do
#       expect(response).to render_template('show')
#     end
#   end
# end
