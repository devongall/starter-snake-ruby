# TODO: Implement your logic here!
# View docs at https://docs.battlesnake.com/snake-api for example payloads.
def move(board)
  puts "Hello, logs!"
  # Find occupied spaces
  occupied_spaces = []
  snakes = board[:board][:snakes]
  snakes.each do |snake|
  	snake[:body].each do |body_part|
  		occupied_spaces << body_part
  	end
  end
  #pp board[:board][:snakes]
  occupied_spaces = occupied_spaces.uniq
  puts "Occupied Spaces"
  pp occupied_spaces

  #Dont automatically die
  moves = []
  head_position = board[:you][:body][0]
  puts "Head Position"
  pp head_position
  #Stay on the BOARD!
  #Check Left
  if head_position[:x] != 0 && !(occupied_spaces.any? {|position| (position[:y] == head_position[:y]) && position[:x] == (head_position[:x]-1)})
  	moves << :left
  end
  #Check right
  if head_position[:x] != 10 && !(occupied_spaces.any? {|position| (position[:y] == head_position[:y]) && position[:x] == (head_position[:x]+1)})
  	moves << :right
  end
  #Check up
  if head_position[:y] != 0 && !(occupied_spaces.any? {|position| (position[:x] == head_position[:x]) && position[:y] == (head_position[:y]+1)})
  	moves << :up
  end  
  #Check down
  if head_position[:y] != 10 && !(occupied_spaces.any? {|position| (position[:x] == head_position[:x]) && position[:y] == (head_position[:y]-1)})
  	moves << :down
  end

  #We now know the immediately safe moves.  Lets look for food.
  puts "Finding Food"
  food = board[:board][:food]
  best_food = {}
  min_food_distance = 1000
  food.each do |food_position|
  	food_distance = (food_position[:y] - head_position[:y]).abs + (food_position[:x] - head_position[:x]).abs
  	if food_distance < min_food_distance
  		min_food_distance = food_distance
  		best_food = food_position
  	end
  		
  end
  #Go This direction
  pp "Best Food: " +  best_food.to_s
  best_move = moves[0]
  if best_food[:x] > head_position[:x] and moves.include?(:right)
  	best_move = :right
  elsif best_food[:x] < head_position[:x] and moves.include?(:left)
  	best_move = :left
  elsif best_food[:y] < head_position[:y] and moves.include?(:up)
  	best_move = :up
  elsif best_food[:y] > head_position[:y] and moves.include?(:down)
  	best_move = :down
  end

  #Reply with my move

  { move: best_move }
end
