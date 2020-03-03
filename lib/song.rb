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
  new_song = self.new
  new_song.save
  new_song
  end
  def self.new_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song
  end

  def self.create_by_name(song)
    new_song = self.new
    new_song.name = song
    new_song.save
    new_song
end
def self.find_by_name(name)
self.all.find {|song| song.name == name}
end
def self.find_or_create_by_name(name)
self.find_by_name(name) == nil ? self.create_by_name(name): self.find_by_name(name)
end
def self.alphabetical
  self.all.sort {|a, b| a.name <=> b.name }
end
def self.destroy_all
  self.all.clear
end
def self.new_from_filename(name)
new_song = name.gsub('.mp3', '').split(' - ')
new_arr = name.gsub('.mp3', '').split(' - ')
   new_song = self.new
   new_song.name = new_arr[1]
   new_song.artist_name = new_arr[0]
   new_song

end
def self.create_from_filename(name)
   new_arr = name.gsub('.mp3', '').split(' - ')
   new_song = self.new
   new_song.name = new_arr[1]
   new_song.artist_name = new_arr[0]
   new_song.save
   new_song
end
end
