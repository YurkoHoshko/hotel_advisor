require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "User" do


    it "looks on list of hotels" do
      @hotels=[]
      10.times do
      @hotels<<FactoryGirl.create(:hotel)
      end

      visit hotels_path
      @hotels.each do |hotel|
      page.should have_content(hotel.name)
      save_and_open_page
      end

    end



describe "Registration" do
    it "signs up new user" do
      visit new_user_registration_path
      fill_in "user_email", :with=>'example@example.com'
      fill_in "user_password", :with=>'examplepassword'
      fill_in "user_password_confirmation", :with=>'examplepassword'
      click_button "Sign up"
      current_path.should == hotels_path

      page.should have_content("Welcome! You have signed up successfully.")
    end
end

describe "Sessions" do

    it "signs user in" do
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in "user_email", :with=>@user.email
      fill_in "user_password", :with=>@user.password
      click_button "Sign in"
      page.should have_content("Hello, #{@user.email}")
    end

    it "signs user out" do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
      visit hotels_path

      click_link "Sign Out"

      page.should have_content("Sign In")
    end
end

  it "adding the hotel" do
    @hotel=FactoryGirl.create(:hotel)

    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit new_hotel_path
    fill_in "hotel_name", :with=>@hotel.name
    select "Three stars", :from=>"hotel_star_rating"
    fill_in "hotel_price", :with=>@hotel.price
    check "hotel_breakfast_included"
    fill_in "hotel_room_description", :with=>@hotel.room_description
    fill_in "hotel_country", :with=>@hotel.country
    fill_in "hotel_state", :with=>@hotel.state
    fill_in "hotel_city", :with=>@hotel.city
    fill_in "hotel_street", :with=>@hotel.street
    attach_file "hotel_images_attributes_0_photo",File.join(Rails.root, 'spec', 'files', 'test2.jpg')

    click_button "Create"
    page.should have_content("Hotel was successfully created.")
  end

  it "leaves comment" do

    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    @hotel=FactoryGirl.create(:hotel)
    @comment=FactoryGirl.create(:comment, :user_id=>user.id)

    visit hotel_path(@hotel)
    select "Good", :from=>"comment_user_rating"
    fill_in "comment_comment_content", :with=>@comment.comment_content
    click_button "submit_comment"
    visit hotel_path(@hotel)
    page.should have_content(@comment.comment_content)
  end


end

