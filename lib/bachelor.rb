require "pry"
def get_first_name_of_season_winner(data, season)
  # data is the contestant hash, season is a key in that hash
  #return the first name of the season's winner
  #drill down in the data to the season to get to the contestest data hash
  #I'll have the full name and will need just the first name >> string manipulation
  winner_name = ""
  winner_first_name = ""
  data[season].each do |contestant_data|
    if contestant_data["status"]  == "Winner"
      winner_name = contestant_data["name"].split
      winner_first_name = winner_name.first
    end
  end
    winner_first_name
end

def get_contestant_name(data, occupation)
  #returns the name of the woman with the occupation
  data.each do |season, contestant| #the next two keys under data are the season and then
    #the contestant
    #drill down on the data for each contestant
    contestant.each do |contestant_data|
      #condition if there is a occupation match then return the name in the contestant_data
      if contestant_data["occupation"] == occupation
         return contestant_data["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  # return a counter of the number of contestsants who are from that hometown
  #set a counter variable at zero
  hometown_counter = 0
  data.each do |season, contestant|
    contestant.each do |contestant_data|
      if contestant_data["hometown"] == hometown
        hometown_counter += 1
      end
    end
  end
  #return counter
  hometown_counter
end

def get_occupation(data, hometown)
  #returns the occupation of the first contestant that hails from that hometown
  hometown_jobs = []
  data.each do |season, contestant|
    contestant.each do |contestant_data|
      if contestant_data["hometown"] == hometown
        hometown_jobs << contestant_data["occupation"]
      end
    end
  end
  return hometown_jobs.first
end

def get_average_age_for_season(data, season)
  #return the average age of all the contestants for that season
  #iterate down into the level that has the age
  sum_ages = 0
  contestant_count = 0
  data[season].each do |contestant_data|
  #convert age from string to number using .to_i method and add it to the ages tally
    sum_ages += contestant_data["age"].to_i
  #increase the count of contestants by 1
    contestant_count += 1
  end
    average_age = (sum_ages/contestant_count)
    average_age = average_age.round(0)
    #round the number .round method
end
