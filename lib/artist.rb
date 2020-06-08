class Artist
  attr_accessor :name, :songs
  attr_reader 
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    (index = self.all.find_index {|artist| artist.name == name}) ? 
      self.all[index] : self.new(name)
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
