require 'mongoid'

class Site
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :xpath, :type => String
  field :active, :type => Boolean, :default => true

  references_many :albums

  scope :active, where(:active => true)
  scope :inactive, where(:active => false)
end
