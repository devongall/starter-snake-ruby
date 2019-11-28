# TODO: Implement your logic here!
# View docs at https://docs.battlesnake.com/snake-api for example payloads.
def move(board)
  puts "Hello, logs!"
  pp board
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
  moves = [:left, :right, :up, :down]
  head_position = board[:you][:body][0]
  puts "Head Position"
  pp head_position

  #Reply with my move
  { move: moves[0] }
end
