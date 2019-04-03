class PlayerCreator
  attr_reader :command_line_args

  def initialize(command_line_args)
    @command_line_args = command_line_args
  end

  def create
    if command_line_args.include?("player")
      create_input_player
    else
      create_default_player
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
#
#
#
#
#
#
#
# class PlayerCreator
#   attr_reader :command_line_args
#
#   def initialize(command_line_args)
#     @command_line_args = command_line_args
#   end
#
#   def create
#     if command_line_args.include?('player')
#       puts "Enter yor FIRST name:"
#       player_name = STDIN.gets.chomp
#
#       puts "Enter yor LAST name:"
#       player_lastname = STDIN.gets.chomp
#
#       puts "Enter your NICKNAME:"
#       player_nickname = STDIN.gets.chomp
#
#       player_age = nil
#       loop do
#         puts "Enter your age:"
#         age_input = STDIN.gets.chomp
#         if /^\d*$/.match(age_input)
#           player_age = age_input.to_i
#           break
#         else
#           puts("Age must be a number")
#         end
#       end
#
#       player_rank = nil
#       loop do
#         puts "Enter your rank:"
#         rank_input = STDIN.gets.chomp
#         if /^\d*$/.match(rank_input)
#           player_rank = rank_input.to_i
#           break
#         else
#           puts("Rank must be a number")
#         end
#       end
#
#       player = EnemyBuilder.new.set_name(player_name).set_age(player_age).set_lastname(player_lastname).set_nickname(player_nickname).set_rank(player_rank).build
#       return player
#     else
#       player = EnemyBuilder.new.set_name('Little').set_age(18).set_lastname('Mac').set_nickname('Punch-Out').set_rank(5).build
#       return player
#     end
#   end
#
#
# end
#
#
#
#
#
#
#
# class PlayerCreator
#   attr_reader :command_line_args
#
#   def initialize(command_line_args)
#     @command_line_args = command_line_args
#   end
#
#   def create
#     if command_line_args.include?('player')
#       puts "Enter yor FIRST name:"
#       player_name = STDIN.gets.chomp
#
#       puts "Enter yor LAST name:"
#       player_lastname = STDIN.gets.chomp
#
#       puts "Enter your NICKNAME:"
#       player_nickname = STDIN.gets.chomp
#
#       player_age = nil
#       loop do
#         puts "Enter your age:"
#         age_input = STDIN.gets.chomp
#         if /^\d*$/.match(age_input)
#           player_age = age_input.to_i
#           break
#         else
#           puts("Age must be a number")
#         end
#       end
#
#       player_rank = nil
#       loop do
#         puts "Enter your rank:"
#         rank_input = STDIN.gets.chomp
#         if /^\d*$/.match(rank_input)
#           player_rank = rank_input.to_i
#           break
#         else
#           puts("Rank must be a number")
#         end
#       end
#
#       player = EnemyBuilder.new.set_name(player_name).set_age(player_age).set_lastname(player_lastname).set_nickname(player_nickname).set_rank(player_rank).build
#       return player
#     else
#       player = EnemyBuilder.new.set_name('Little').set_age(18).set_lastname('Mac').set_nickname('Punch-Out').set_rank(5).build
#       return player
#     end
#   end
#
#
# end