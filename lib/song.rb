require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new #instantiates a song
    song.save #saves the song
    song #returns the new song that was created
  end 

  def self.new_by_name(name)
    song = self.new #instantiates a song
    song.name = name #name of the song 
    song #returns the name of the song 
  end 

  def self.create_by_name(name)
    song = self.new #instantiates 
    song.name = name #song with name 
    song.save #saves the song 
    song #returns song with name 
  end 

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name} #detect method to find a specific song, if not found will return a falsey when a song name is not present in @@all (array)
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 

  def self.alphabetical 
    @@all.sort_by{|song| song.name}
  end 

  def self.new_from_filename(filename)
    divide_filename = filename.chop.chop.chop.chop.split(" - ")
    song = Song.new
    song.name = divide_filename[1]
    song.artist_name = divide_filename[0]
    song.save
    song 
  end
  
  def self.create_from_filename(name)
    song = Song.new #instantiates a new song
    song.name = (name.split(" - ")[1].chomp(".mp3")) #generates song name based on filename format
    song.artist_name = (name.split(" - ")[0]) #generates artist name 
    @@all << song #saves song and artist name based on filename format
    song #returns name of song 
  end 

  def self.destroy_all 
    self.all.clear 
  end 
end
