def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between 3 and 5
  # (inclusive). Show the id, title, year, and score.
  Movie
    .select('id, title, yr, score')
    .where('yr BETWEEN 1980 AND 1989 AND score BETWEEN 3 AND 5')
end

def bad_years
  # List the years in which no movie with a rating above 8 was released.

  Movie
    .where.not(yr: 
    Movie
      .where('score > 8')
      .select('yr')).pluck('DISTINCT yr')
      # .select('yr, COUNT(score > 8)')
      # .group('yr')
      # .having('COUNT(score > 8) = 0'))
  
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.

  Movie
    .joins(:actors)
    .where('movies.title = (?)', title)
    .order('castings.ord ASC')
    .select('actors.id, actors.name')
end

def vanity_projects
  # List the title of all movies in which the director also appeared as the
  # starring actor. Show the movie id, title, and director's name.

  # Note: Directors appear in the 'actors' table.

  Movie
    .joins(:actors)
    .select('movies.id, movies.title, actors.name')
    .where('movies.director_id = actors.id AND castings.ord = 1')

  
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name, and number of supporting roles.
  Actor
    .joins(:castings)
    .select('actors.id, actors.name, ')

end