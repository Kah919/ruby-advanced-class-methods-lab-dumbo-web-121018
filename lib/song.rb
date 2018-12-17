require 'pry'
class Song #need help with this
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end


  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end
  # song = Song.create
  # Song.all.include?(song) #=> true

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find { |name| song_name == name.name }
  end

  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) ? find_by_name(song_name) : create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    remove_mp3 = file[0..-5]
    formatted = remove_mp3.split(" - ")
    song_name = formatted[1]
    artist_name = formatted[0]
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    @@all = []
  end
end
