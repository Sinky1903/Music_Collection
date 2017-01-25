require_relative('../db/SqlRunner')
require('pg')

class Artist

  attr_accessor :name, :id

  def initialize ( options )
    @id = options['id'].to_i if options['id'] !=nil
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO Artist (name) VALUES ('#{name}') returning *;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end


def update()
sql = "UPDATE Artist SET (name) = ('#{@name}') WHERE id = #{@id};"
end


def delete()
  sql = "DELETE * FROM Artist WHERE id = #{@id};"
end


def self.all()
  sql = "SELECT * FROM Artist"
  artists = SqlRunner.run(sql)
  return artists.map { |artist| Artist.new( artist ) }
end


def self.delete_all()
sql = "DELETE FROM Artist;"
end

end