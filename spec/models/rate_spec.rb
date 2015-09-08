require 'rails_helper'
include RandomData

RSpec.describe Rate, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:rate) { Rate.create!(name: 'Rate') }

  it { should belong_to :ratable }
  it { should have_many :ratings }
  it { should have_many :topics }
  it { should have_many :posts }

  describe "ratable" do
    it "allows the same rate to be associated with a different topic and post" do
      topic.rates << rate
      post.rates << rate

      topic_rate = topic.rates[0]
      post_rate = post.rates[0]

      expect(topic_rate).to eql(post_rate)
    end
  end


end
