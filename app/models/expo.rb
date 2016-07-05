class Expo < ActiveRecord::Base


  validates_length_of :phone_number, :minimum => 10, :maximum => 10, :allow_blank => false
end
