# TODO: Implement your logic here!
# View docs at https://docs.battlesnake.com/snake-api for example payloads.
def move(board)
  puts "Hello, logs!"
  occupied_spaces = []
  pp board
  snakes = board[:board][:snakes]
  snakes.each do |snake|
  	snake[:body].each do |body_part|
  		occupied_spaces << body_part
  	end
  end
  #pp board
  #pp board[:board][:snakes]
  occupied_spaces = occupied_spaces.uniq
  pp occupied_spaces
  { move: :right }
end
