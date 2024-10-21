require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  let(:blog_post) {FactoryBot.build(:blog_post) }
  it "is valid with valid attributes" do
    expect(blog_post).to be_valid
  end

  it "is is not valid without a title" do
    blog_post.title = nil
    expect(blog_post).to be_invalid
  end
  it "is not valid without a body" do
    blog_post.body = nil
    expect(blog_post).to be_invalid
  end
  it "defaults category to General if the category is blank" do
    new_post = FactoryBot.create(:blog_post, category: nil)
    expect(new_post.category).to eq("General")
  end
end
