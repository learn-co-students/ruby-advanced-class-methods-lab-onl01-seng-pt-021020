require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save #instance method  
    self.class.all << self
  end

def self.create
   song_obj = self.new #this creates a new song and set it equal to a variable
   song_obj.save #any new song you create you want to save it 
   return song_obj
 end
 
 def self.new_by_name(song_name)
   song_obj = self.new 
   song_obj.name = song_name
   return song_obj
 end
 
 def self.create_by_name(song_name)
    song_obj= self.create
    song_obj.name = song_name
    return song_obj
 end
 
 def self.find_by_name(song_name) 
   self.all.find{|song_obj| song_obj.name == song_name}
 end
 
 def self.find_or_create_by_name(song_name)
   self.find_by_name(song_name) || self.create_by_name(song_name)
 end
 
 def self.alphabetical
    self.all.sort_by {|obj| obj.name}
  end
  
  def self.new_from_filename(str)
    song_info= str.split(' - ')
    song_obj= self.new_by_name(song_info[1].gsub('.mp3', ''))
    song_obj.artist_name = song_info[0]
    song_obj
end
  
def self.create_from_filename(str)
    song_info= str.split(' - ')
    song_obj= self.create_by_name(song_info[1].gsub('.mp3', ''))
    song_obj.artist_name = song_info[0]
    song_obj.save  
 end
 
 def self.destroy_all
   self.all.clear
 end
end
