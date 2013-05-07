require 'spec_helper'


describe Hotel do

  before(:each) do
    @hotel = Hotel.new
  end

#=============================validation tests ====================================
it "should require name" do
  @hotel.should_not be_valid
  @hotel.errors.get(:name).should_not be_nil
end

it "should require star_rating" do
  @hotel.should_not be_valid
  @hotel.errors.get(:star_rating).should_not be_nil
end

it "should require price" do
  @hotel.should_not be_valid
  @hotel.errors.get(:price).should_not be_nil
end

it "should require room_description" do
  @hotel.should_not be_valid
  @hotel.errors.get(:room_description).should_not be_nil
end

it "should require country" do
  @hotel.should_not be_valid
  @hotel.errors.get(:country).should_not be_nil
end

it "should require state" do
  @hotel.should_not be_valid
  @hotel.errors.get(:state).should_not be_nil
end

it "should require city" do
  @hotel.should_not be_valid
  @hotel.errors.get(:city).should_not be_nil
end

it "should require street" do
  @hotel.should_not be_valid
  @hotel.errors.get(:street).should_not be_nil
end

it "should validate price format" do
  @hotel.price=123456.111111111
  @hotel.should_not be_valid
  @hotel.errors.get(:price).should_not be_nil
end


it "should validate star_rating value" do
  @hotel.star_rating=6
  @hotel.should_not be_valid
  @hotel.errors.get(:star_rating).should_not be_nil
end

it {should ensure_length_of(:name).is_at_least(3).is_at_most(30)}
it {should ensure_length_of(:country).is_at_least(3).is_at_most(30)}
it {should ensure_length_of(:state).is_at_least(3).is_at_most(30)}
it {should ensure_length_of(:city).is_at_least(3).is_at_most(30)}
it {should ensure_length_of(:street).is_at_least(3).is_at_most(30)}

#===========================assossiations tests===================================
it {should have_many(:comments).dependent(:destroy)}

it {should have_many(:images).dependent(:destroy)}

#================================model methods tests =================================

it "should return total hotel rating" do
  @hotel=FactoryGirl.create(:hotel)
    20.times do
      FactoryGirl.create(:comment, :user_rating=>3, :hotel_id=>@hotel.id)
    end


    @test_rating=60 # 20 times do user_rating 3 = 20*3 = 60

    @hotel.total_rating.should == @test_rating
end


it "should return average hotel rating" do
  @hotel=FactoryGirl.create(:hotel)
    20.times do
      FactoryGirl.create(:comment, :hotel_id=>@hotel.id, :user_rating=>1)
    end

    @test_average_rating = 1
    @hotel.average_rating.should == @test_average_rating.round(2)
end

it "should create address" do
  @hotel=FactoryGirl.create(:hotel, :country=>"USA", :state=>"CAL", :city=>"Lviv", :street=>"big")
  @test_address = "USA, CAL state, Lviv, big str."
  @hotel.address.should == @test_address
end

it "should return array of five hotels with best average rating" do
  @hotels=[]
  10.times do
    @hotels<<FactoryGirl.create(:hotel)
  end



  @hotels.each do |hotel|
    10.times do
      FactoryGirl.create(:comment, :hotel_id=>hotel.id)
    end
  end

  @control_hotel=FactoryGirl.create(:hotel, :name=>"Control hotel")
    20.times do
      FactoryGirl.create(:comment, :hotel_id=>@control_hotel.id, :user_rating=>5)
    end


  Hotel.top_five.first.should == @control_hotel
end


end



