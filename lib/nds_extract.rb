# Provided, don't edit
require 'directors_database'
require 'pry'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end



def movies_with_director_key(name, movies_collection)
new_collection = []
index = 0
  while index < movies_collection.length do 
    film_artist = movie_with_director_name(name, movies_collection[index])
    new_collection << film_artist
    index += 1
  end  
  new_collection
end


def gross_per_studio(collection)
 index = 0
 updated_collection = {} 
 
   while index < collection.length do 
   # binding.pry 
     if !updated_collection.has_key?(collection[index][:studio]) 
        updated_collection[collection[index][:studio]] = 0 
        
        updated_collection[collection[index][:studio]] =
        collection[index][:worldwide_gross]
      else 
        updated_collection[collection[index][:studio]] +=
        collection[index][:worldwide_gross]
    end 
     index += 1
    end
 
 updated_collection
end


def movies_with_directors_set(source) #(source)an array of hashes containing director info :name :movies
index = 0
set_source = [] # AoA containing source and all :movies and :director_name key
 while index < source.length do
  # binding.pry             #source[index][movies]=movies array w/{} of titles
    dir_name_key = source[index][:name] 
    dir_movie_key = source[index][:movies]
    set_source.push(movies_with_director_key(dir_name_key, dir_movie_key))
   index += 1 
   end
   set_source
 end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

 def studios_totals(nds)
   a_o_a_movies_with_director_names = movies_with_directors_set(nds)
   movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
   return gross_per_studio(movies_with_director_names)
 end
