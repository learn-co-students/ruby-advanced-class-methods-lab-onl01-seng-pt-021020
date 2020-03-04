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
  
  def self.new_by_name(song_string)
    song = Song.new
    song.name = song_string
    song
  end
  
  def self.create_by_name(song_string)
    song = self.create
    song.name = song_string
    song
  end
  
  def self.find_by_name(song_string)
    self.all.find {|string| string.name == song_string}
  end 
  
  def self.find_or_create_by_name(song_string)
    self.find_by_name(song_string) || self.create_by_name(song_string)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}  
  end
  
  def self.new_from_filename(mp3_file)
    parts = mp3_file.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3","")
    
    song = self.new 
    song.artist_name = artist_name
    song.name = song_name
    song
  end 
  
  def self.create_from_filename(mp3_file)
    parts = mp3_file.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3","")
    
    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song
  end
  
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end

end
