# TODO: Implement your logic here!
# View docs at https://docs.battlesnake.com/snake-api for example payloads.
def move(board)
  puts "Hello, logs!"
  occupied_spaces = []
  #pp board
  snakes = board[:board][:snakes]
  snakes.each do |snake|
  	snake[:body].each do |body_part|
  		pp body_part
  	end
  end
  #pp board
  #pp board[:board][:snakes]
  { move: :left }
end
