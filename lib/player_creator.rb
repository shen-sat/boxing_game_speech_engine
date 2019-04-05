class PlayerCreator
  attr_reader :command_line_args

  def initialize(command_line_args)
    @command_line_args = command_line_args
  end

  def create
    if command_line_args.include?("default-player")
      create_default_player
    else
      create_input_player
    end
  end

  def create_default_player
    default_player = Player.new
    default_player.name = 'Sugar'
    default_player.lastname = 'Shamps'
    default_player.nickname = 'Shambles'
    default_player.age = 18
    default_player.rank = 20
    default_player.no_of_fights = 1
    return default_player
  end

  def create_input_player
    player = Player.new
    puts "Enter name:"
    player.name = STDIN.gets.chomp
    puts "Enter lastname:"
    player.lastname = STDIN.gets.chomp
    puts "Enter nickname:"
    player.nickname = STDIN.gets.chomp
    puts "Enter age:"
    player.age = STDIN.gets.chomp.to_i
    puts "Enter rank:"
    player.rank = STDIN.gets.chomp.to_i
    puts "Enter number of fights:"
    player.no_of_fights = STDIN.gets.chomp.to_i
    return player
  end
end