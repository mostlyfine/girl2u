require 'mongoid'

class Photo
  include Mongoid::Document

  field :url, :type => String
  field :active, :type => Boolean, :default => true

  scope :active, where(:active => true)
  scope :inactive, where(:active => false)
end
