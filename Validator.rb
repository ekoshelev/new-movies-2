#Elizabeth Koshelev
#PA Movies Part 2
#COSI 166B
#Pito Salas

require_relative "movie_data.rb"
class Validator

  def initialize(base, test2)
    #compares base ratings to test set
    @ratings = Ratings.new(base)
    @alldata=[]
    fileObj = File.new(test2, "r")
    while (line = fileObj.gets)
      line_array=line.split()
      @alldata.push(line_array)
    end
    fileObj.close
  end

  def validate() #calculates the accuracy of predictions against the test set
    accurate=0
    offbyone=0
    offbytwo=0
    offbythree=0
    offbyfour=0
    allpredictions=0
    numberofpredictions=0
    prediction=0
    stdev=0
    @alldata.each {|user|
      numberofpredictions=numberofpredictions+1
      prediction=@ratings.returnPopularity(user[1])
      accuracy=prediction-user[2].to_i
      accuracy=accuracy.abs
      if accuracy==0
        accurate=accurate+1
      elsif accuracy==1
        offbyone=offbyone+1
      elsif accuracy===2
        offbytwo=offbytwo+1
      elsif accuracy==3
        offbythree=offbythree+1
      else
        offbyfour=offbyfour+1
      end
    }
    number=offbyone+offbytwo+offbythree+offbyfour
    mean=number.to_f/numberofpredictions
    $i = 0
    until $i > offbyone  do
       stdev=(1-mean) ** 2+stdev
       $i +=1
    end

    until $i > offbytwo  do
       stdev=(2-mean)**2+stdev
    $i +=1
    end

    until $i > offbythree  do
       stdev=(3-mean) ** 2+stdev
    $i +=1
    end

    until $i > offbyfour  do
       stdev=(4-mean) ** 2+stdev
    $i +=1
    end

     stdev=stdev/(numberofpredictions-1)
     stdev=Math.sqrt(stdev)

    puts "Mean is #{mean}."
    puts "Stdev is #{stdev}."
    puts "#{accurate} predictions were correct out of #{numberofpredictions}."
    puts "#{offbyone} predictions were off by one."
    puts "#{accurate.to_f/numberofpredictions.to_f}% were correct."
  end

end
