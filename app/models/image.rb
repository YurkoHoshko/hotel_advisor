class Image < ActiveRecord::Base
  attr_accessible :photo
  has_attached_file :photo, :styles => { :landing=>"1000x565!", :big=>"370x300!", :medium => "300x300!", :thumb => "100x100!" }, :default_url => "/images/:style/missing.png"


  belongs_to :hotel

end
