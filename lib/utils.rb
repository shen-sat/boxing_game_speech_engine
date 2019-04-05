class Utils

  def validate_args(command_line_args)
    accepted_command_line_args = ['default-player', 'no-player']

    #Validate command-line args
    command_line_args.each do |arg|
      if !(accepted_command_line_args.include?(arg))
        puts "Exiting because argument #{arg} not recognised"
        abort
      end
    end
  end

end