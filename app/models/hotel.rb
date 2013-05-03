class Hotel < ActiveRecord::Base
  attr_accessible :name, :star_rating, :breakfast_included, :room_description, :price, :country, :state, :city, :street, :images_attributes
  has_many :comments, :dependent=>:destroy
  has_many :images, :dependent=>:destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates  :name, :star_rating, :breakfast_included, :room_description, :price, :country, :state, :city, :street, :presence=>true
  validates :star_rating, :inclusion=>{:in=>1..5}



def self.top_five
 top_rated_hotels= self.all.sort_by {|p| - p.average_rating}
 top_rated_hotels.first(5)
end


def total_rating
    hotel_total_rating=0
    if comments.presence
      comments.each do |comment|
        hotel_total_rating += comment.user_rating
      end
      hotel_total_rating
    else
      hotel_total_rating=0
    end
end

def average_rating
  if comments.presence
    hotel_average_rating=total_rating/comments.count.to_f
    hotel_average_rating.round(2)
  else
    hotel_average_rating=0
  end
end

def address
  country+", "+state+" state, "+city+", "+street+" str."
end

def average_user_rating_word(mark)
  case mark
    when 0 then "unrated"
    when 1..1.8 then "scary"
    when 1.8..2.5 then "bad"
    when 2.5..3.2 then "usual"
    when 3.2..4.2 then "good"
    when 4.2..5 then "awesome"
  end
end

def one_star
  image_tag("assets/rails.png")
end
end
