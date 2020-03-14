class Artist
 @@all = []
 attr_accessor :name, :songs

 # creates new Artist, names, and saves
 def initialize(name)
   @name = name
   save
 end

 # returns all Artist instances
 def self.all
   @@all
 end

 # keeps track of an artist's songs
 def add_song(song)
   song.artist = self
 end

 # lists all songs that belongs to an artist
 def songs
   Song.all.select {|song| song.artist == self}
 end

 # always returns an Artist instance
 # finds or creates an artist by name maintianing uniqueness of objects by name property
 # creates new instance of Artist of none exists 
 def self.find_or_create_by_name(name)
   self.find(name) ? self.find(name) : self.new(name)
 end

 def self.find(name)
   self.all.find {|artist| artist.name == name }
 end

 # saves each artist into the class variable container
 def save
   @@all << self
 end

 def print_songs
   songs.each {|song| puts song.name}
 end
end
