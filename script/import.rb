require 'sequel'
require '../models/site'
require '../models/album'
require '../models/photo'

DB = Sequel.sqlite('../tmp/development.sqlite3')

Mongoid.configure do |config|
  host = 'localhost'
  config.master = Mongo::Connection.new.db('development')
end

class DBPhoto < Sequel::Model(:photos)
  #many_to_one :album, :class => DBAlbum
end

class DBAlbum < Sequel::Model(:albums)
  one_to_many :photos, :class => DBPhoto, :key => :album_id
  #many_to_one :site, :class => DBSite
end

class DBSite < Sequel::Model(:sites)
  one_to_many :albums, :class => DBAlbum, :key => :site_id
end

Site.delete_all
Album.delete_all
Photo.delete_all

DBSite.all.each do |dbsite|
  puts "#{dbsite.id} --------------------------------------"
  site = Site.create(:name => dbsite.name, :xpath => dbsite.xpath, :url => dbsite.url)
  dbsite.albums.each do |dbalbum|
    puts dbalbum.id
    album = Album.new(:name => dbalbum.title, :url => dbalbum.url)
    dbalbum.photos.each do |dbphoto|
      album.photos << Photo.create(:url => dbphoto.url)
    end
    album.site = site
    album.save
  end
end
