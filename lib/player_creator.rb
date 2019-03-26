class PlayerCreator
  attr_reader :command_line_args

  def initialize(command_line_args)
    @command_line_args = command_line_args
  end

  def create
    if command_line_args.include?('player')
      puts "Enter yor FIRST name:"
      player_name = STDIN.gets.chomp

      puts "Enter yor LAST name:"
      player_lastname = STDIN.gets.chomp

      puts "Enter your NICKNAME:"
      player_nickname = STDIN.gets.chomp

      player_age = nil
      loop do
        puts "Enter your age:"
        age_input = STDIN.gets.chomp
        if /^\d*$/.match(age_input)
          player_age = age_input.to_i
          break
        else
          puts("Age must be a number")
        end
      end

      player_rank = nil
      loop do
        puts "Enter your rank:"
        rank_input = STDIN.gets.chomp
        if /^\d*$/.match(rank_input)
          player_rank = rank_input.to_i
          break
        else
          puts("Rank must be a number")
        end
      end

      player = EnemyBuilder.new.set_name(player_name).set_age(player_age).set_lastname(player_lastname).set_nickname(player_nickname).set_rank(player_rank).build
      return player
    else
      player = EnemyBuilder.new.set_name('Little').set_age(18).set_lastname('Mac').set_nickname('Punch-Out').set_rank(5).build
      return player
    end
  end


end