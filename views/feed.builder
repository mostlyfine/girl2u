xml.instruct! :xml, :version => '1.0'
xml.rss :version => '2.0' do
  xml.channel do
    xml.title '2u'
    xml.description 'xxxx'
    xml.link 'http://girl2u.heroku.com'

    @albums.each do |album|
      xml.item do
        xml.title album.name
        xml.link album.url
        xml.description image_tag(album.photos.first.url)
        xml.pubDate Time.parse(album.created_at.to_s).rfc822
        xml.guid 'xx'
      end
    end
  end
end
