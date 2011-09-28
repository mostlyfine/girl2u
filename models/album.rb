require 'mongoid'

class Album
  include Mongoid::Document

  field :name, :type => String
  field :url, :type => String
  field :active, :type => Boolean, :default => true

  embeds_many :photos
  referenced_in :site

  scope :active, where(:active => true)
  scope :inactive, where(:active => false)
end
