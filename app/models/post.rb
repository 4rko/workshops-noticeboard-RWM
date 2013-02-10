class Post < ActiveRecord::Base
  attr_accessible :title, :content, :address, :tag_list # moga byc masowo przypisane; tzn. tylko te, ktore moga byc uzupelniane z formularza
  acts_as_taggable
  geocoded_by :address # mozna uzyc geocode
  after_validation :geocode, if: :address_changed? # wtedy uzywam
  # geocode -- metoda dostarczana przez gem geocode
  # address_changed? -- metoda dynamiczna od ActiveRecord
  belongs_to :user
  has_many :comments
end
