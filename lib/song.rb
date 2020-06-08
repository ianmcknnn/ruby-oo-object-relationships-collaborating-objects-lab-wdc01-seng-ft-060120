require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist

  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    artist, title, genre = filename.delete_suffix('.mp3').split(' - ')  
    song = self.new(title)
    song.artist_name = artist
    song
  end


  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
  end
  
end
