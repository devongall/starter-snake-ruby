# TODO: Implement your logic here!
# View docs at https://docs.battlesnake.com/snake-api for example payloads.
def move(board)
  puts "Hello, logs!"
  occupied_spaces = []
  pp board{:turn}
  board[:snakes].each do |snake|
  	snake[:body].each do |body_part|
  		pp body_part
  	end
  end
  #pp board
  { move: :left }
end
