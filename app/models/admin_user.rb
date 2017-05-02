class AdminUser < ApplicationRecord
   has_and_belongs_to_many :pages
   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
   has_secure_password
   validates_presence_of :first_name, :presence =>true,
                                      :length=>{:within=>1..25}
  validates_presence_of :last_name, :presence =>true,
                                    :length=>{:within=>1..25}
  validates_presence_of :username, :presence =>true,
                          :uniqueness=>true,
                        :length=>{:within=>1..25}
  validates_presence_of :email, :presence =>true,
                        :length => {:maximum=>100},
                        :format => EMAIL_REGEX,
                        :uniqueness=>true
scope :sorted, lambda {order ("last_name ASC, first_name ASC")}
def name
  "#{first_name} #{last_name}"
end

end
