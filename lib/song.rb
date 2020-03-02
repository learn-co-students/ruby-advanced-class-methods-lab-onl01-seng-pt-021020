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
    creation = self.new
    self.all << creation
    creation
  end

  def self.new_by_name(songname)
    creation = self.new
    creation.name = songname
    creation
  end

  def self.create_by_name(songname)
    creation = self.new
    creation.name = songname
    self.all << creation
    creation
  end

  def self.find_by_name(songname)
    self.all.find {|i| i.name == songname}
  end

  def self.find_or_create_by_name(songname)
    if self.find_by_name(songname)
      self.find_by_name(songname)
    else
      self.create_by_name(songname)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    splitname = filename.split(" - ")
    artist = splitname[0]
    song = splitname[1].split(".")
    justsong = song[0]
    creation = self.new
    creation.artist_name = artist
    creation.name = justsong
    creation
  end

  def self.create_from_filename(filename)
    splitname = filename.split(" - ")
    artist = splitname[0]
    song = splitname[1].split(".")
    justsong = song[0]
    creation = self.new
    creation.artist_name = artist
    creation.name = justsong
    self.all << creation
    creation
  end

  def self.destroy_all
    self.all.clear
  end

end
