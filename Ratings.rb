#Elizabeth Koshelev
#PA Movies Part 2
#COSI 166B
#Pito Salas


class Ratings

  def initialize(filename) #Reads in a file
    @filename=filename
    @alldata=[]
    fileObj = File.new(filename, "r")
    @moviepopularity={}
    @movieratings={}
    while (line = fileObj.gets)
      line_array=line.split()
      if !@movieratings.has_key?(line_array[1])
        @movieratings[line_array[1]]=[]
      end
        @movieratings[line_array[1]].push(line_array[2])
    end
    fileObj.close
    makeMovieHash
  end

  def makeMovieHash #this returns a hash with all movies and all their ratings
    @movieratings.each{|movie_id, array|
      if !@moviepopularity.has_key?(movie_id)
        @moviepopularity[movie_id]=popularity(array)
      end
    }
  end

  def popularity(array) #returns the average popularity of a specific movie
    total_popularity=0.0
    number_of_reviews=0.0
    popularity=0
    array.each {|x|
      total_popularity=total_popularity + x.to_f
      number_of_reviews=number_of_reviews+1.0
    }
    if number_of_reviews!=0
      popularity=total_popularity/number_of_reviews
      popularity=popularity.round
    end
  end

  def returnPopularity(movie_id) #returns the popularity of a specific movie
    if @moviepopularity.has_key?(movie_id)
      @moviepopularity[movie_id]
    else
      return 3
    end
  end
end
