require('pg')

class Album

  attr_accessor :id, :title, :genre, :artist_id

  def initialize ( options )
    @id = options['id'].to_i if options['id'] !=nil
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end


  def save()
    sql = "INSERT INTO Album (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{@artist_id}) returning *;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end


def update()
sql = "UPDATE Album SET (title, genre, artist_id) = ('#{@title}', '#{@genre}', #{@artist_id}) WHERE id = #{@id};"
end


def delete()
sql = "DELETE * FROM Album WHERE id = #{@id};"
end


def self.all()
sql = "SELECT * FROM Album"
albums = SqlRunner.run(sql)
return albums.map { |album| Album.new( album ) }
end


def self.delete_all
sql = "DELETE FROM Album;"
end

def artists()
sql = "SELECT * FROM Artist WHERE id = #{@artist_id}"
albums = SqlRunner.run( sql ).first
result = Artist.new( albums )
return result
end



end