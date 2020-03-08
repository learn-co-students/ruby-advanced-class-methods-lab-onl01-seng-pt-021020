class Song
  
  attr_accessor :name, :artist_name
  
  @@all = []


  def self.all
    @@all
  end
  
  def self.create 
    song = Song.new
    @@all << song
    song
  end
  
  def self.new_by_name(str)
    song = Song.new
    song.name = str
    song
  end
  
  def self.create_by_name(name_of_song)
    song = self.create
    song.name = name_of_song
    song
  end
  
  def self.find_by_name(str)
    self.all.find {|string|string.name == str}
  end
  
def self.find_or_create_by_name(str)
    self.find_by_name(str) || self.create_by_name(str)
  end
  
  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3","")
    
    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end
  
  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3","")
    
    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song
  end
  
  def self.destroy_all
    @@all = []
    # self.all.clear
  end
    
    
end
