require 'mongoid'

class Site
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :xpath, :type => String
  field :deleted_at, :type => DateTime
end
