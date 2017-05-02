class Page < ApplicationRecord
  belongs_to :subject
  has_many   :section
   has_and_belongs_to_many :admin_users, :join_table=> "admin_users_pages"
  # has_and_belongs_to_many :admin_users, :class

  validates_presence_of :name  #not blank
  validates_length_of :name, :minimum =>5, :maximum=>9
  validates_presence_of :permalink
    validates_length_of :name, :within=>3..8
    validates_uniqueness_of :permalink
  scope :sorted, lambda{order("pages.position ASC")}

end
