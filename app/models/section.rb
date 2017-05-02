class Section < ApplicationRecord
  belongs_to :page
  CONTENT_TYPES=['text','HTML']
  validates_presence_of :name  #not blank
  validates_length_of :name, :minimum =>5, :maximum=>9
  validates_inclusion_of :content_type, :in=> CONTENT_TYPES, :message=>"must be one of: #{CONTENT_TYPES.join(',')}"
  validates_presence_of :content
end
