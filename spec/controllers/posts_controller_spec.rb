      require 'rails_helper'

      describe PostsController do
        describe 'POST #create' do
          context 'with valid attributes' do
            it 'creates the post' do
              post :create, : attributes_for(:content)
              expect(Post.count).to eq(1)
            end

            it 'redirects to the "show" action for the new vehicle' do
              post :create, post: attributes_for(:post)
              expect(response).to redirect_to Post.first
            end
          end

          context 'with invalid attributes' do
            it 'does not create the post' do
              post :create, post: attributes_for(content: nil)
              expect(Post.count).to eq(0)
            end

            it 're-renders the "new" view' do
              post :create, post: attributes_for(:Post)
              expect(response).to render_template :new
            end
          end
        end
      end