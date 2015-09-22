require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:my_topic) { create(:topic) }
  let(:my_user) { create(:user) }
  let(:my_post) { create(:post, topic: my_topic, user: my_user) }

   context "unauthenticated users" do
     it "PUT update returns http unauthenticated" do
        new_user = build(:user)
        put :update, id: my_user.id, user: { name: new_user.name, email: new_user.email, password: new_user.password }
        expect(response).to have_http_status(401)
      end

      it "POST create returns http unauthenticated" do
        new_user = build(:user)
        post :create, user: { name: new_user.name, email: new_user.email, password: new_user.password }
        expect(response).to have_http_status(401)
      end

      it "DELETE destroy returns http unauthenticated" do
        delete :destroy, id: my_topic.id
        expect(response).to have_http_status(401)
      end
   end

   context "unauthorized user" do
     before do
       controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
     end
     it "PUT update returns http forbidden" do
       put :update, id: my_topic.id, topic: {name: "Topic Name", description: "Topic Description"}
       expect(response).to have_http_status(403)
     end

     it "POST create returns http forbidden" do
       post :create, topic: {name: "Topic Name", description: "Topic Description"}
       expect(response).to have_http_status(403)
     end

     it "DELETE destroy returns http forbidden" do
       delete :destroy, id: my_topic.id
       expect(response).to have_http_status(403)
     end
   end

   context "authenticated and authorized users" do
     before do
       my_user.admin!
       controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
     end

     describe "PUT update" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph

       before { put :update, topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body} }

       it "returns http success" do
         expect(response).to have_http_status(:success)
       end

       it "returns json content type" do
         expect(response.content_type).to eq 'application/json'
       end

       it "updates a post with the correct attributes" do
         updated_post = Post.find(my_post.id)
         expect(updated_post.to_json).to eq response.body
       end
     end

     describe "DELETE destroy" do
       before { delete :destroy, topic_id: my_topic.id, id: my_post.id }

 # #18
       it "returns http success" do
         expect(response).to have_http_status(:success)
       end

       it "returns json content type" do
         expect(response.content_type).to eq 'application/json'
       end

       it "returns the correct json success message" do
         expect(response.body).to eq({"message" => "Post destroyed","status" => 200}.to_json)
       end

       it "deletes my_post" do
 # #19
         expect{ Post.find(my_post.id) }.to raise_exception(ActiveRecord::RecordNotFound)
       end
     end


   end


 end
