equire 'spec_helper'


describe Comment do

  before(:each) do
    @comment = Comment.new
  end

 #=============================validation tests ====================================
  it "should require comment_content" do
    @comment.should_not be_valid
    @comment.errors.get(:comment_content).should_not be_nil
  end

  it "should require user_rating" do
    @comment.should_not be_valid
    @comment.errors.get(:user_rating).should_not be_nil
  end

  it "should require user_id" do
    @comment.should_not be_valid
    @comment.errors.get(:user_id).should_not be_nil
  end

  it "should require hotel_id" do
    @comment.should_not be_valid
    @comment.errors.get(:hotel_id).should_not be_nil
  end

  it {should ensure_length_of(:comment_content).is_at_least(15).is_at_most(150)}

#===========================assossiations tests===================================
  it {should belongs_to(:user)}
  it {should belongs_to(:hotel)}

#================================model methods tests =================================

  it "should match user_rating to word" do
  @test_comment=FactoryGirl.create(:comment, :user_rating=>3)
  @test_comment.user_rating_word.should == "usual"
end

end