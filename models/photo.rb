require 'mongoid'

class Photo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :url, :type => String
  field :active, :type => Boolean, :default => true

  scope :active, where(:active => true)
  scope :inactive, where(:active => false)
end
