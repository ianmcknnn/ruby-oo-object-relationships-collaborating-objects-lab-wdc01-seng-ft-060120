class MP3Importer
  attr_accessor :path
  def initialize(filepath)
    @path = filepath
  end

  def files
    filename_array = []
    Dir.foreach(@path) {|filename| filename_array << filename unless ['.','..'].include?(filename)}
    filename_array
  end

  def import
    file_list = self.files
    song_list = []
    file_list.each {|filename|song_list << Song.new_by_filename(filename)}
    song_list
  end
end
