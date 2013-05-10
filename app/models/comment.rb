class Comment < ActiveRecord::Base
  attr_accessible :comment_content, :user_rating, :user_id, :hotel_id, :created_at
  belongs_to :user
  belongs_to :hotel

  validates  :comment_content, :user_rating, :user_id, :hotel_id, :presence=>true
  validates :user_rating, :inclusion=>{:in=>1..5}
  validates :comment_content, :length=>{:minimum=>15, :maximum=>150}




def user_rating_word(mark)
  case mark
    when 1 then "scary"
    when 2 then "bad"
    when 3 then "usual"
    when 4 then "good"
    when 5 then "awesome"
  end
end

end
