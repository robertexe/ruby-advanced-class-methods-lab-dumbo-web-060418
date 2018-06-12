require 'pry'

class Song
  #attr_reader
  attr_accessor :name, :artist_name, :song

  @@all = []

  def initialize
    # @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.detect do |song|
      song.name == song_name
      end
  end

  def self.find_or_create_by_name(song_name)
    output = self.find_by_name(song_name)
    if output
      output
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(string)
    string_arr = string.split('-')
    artist_name = string_arr[0].strip!
    song_name = string_arr[1].strip!
    song_name = song_name.split('.')
    song_name = song_name[0]

    new_song = self.new
    new_song.artist_name = artist_name
    new_song.name = song_name
    new_song
  end

  def self.create_from_filename(string)
    @@all << self.new_from_filename(string)
  end

  def self.destroy_all
    @@all.clear
  end

end

####
