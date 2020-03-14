class Song
  attr_accessor :name, :artist
  @@all = []

  # creates new Song, names, and saves
  def initialize(name)
    @name = name
    save
  end

  # saves all instances into the class variable container
  def save
    @@all << self
  end

  # returns all songs 
  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end
