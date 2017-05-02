class Subject < ApplicationRecord
#  scope :visible, lambda { where ( :visible => true ) }
   has_many :page
validates_presence_of :name  #not blank
validates_length_of :name, :minimum =>5, :maximum=>7


  scope :visible, lambda{where(:visible => true)}
  scope :invisible, lambda{where(:visible => false)}
  scope :sorted, lambda{order("subjects.position ASC")}
  scope :search, lambda {|query|
  where(["name LIKE?", "%#{query}%"])
}
end
