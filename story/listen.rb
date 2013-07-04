if RUBY_PLATFORM =~ /darwin/
  require './wonky-donkey'
  WonkyDonkey.listen
else
  puts "
    # ======================================
    # = Sorry - listen only works on a mac =
    # ======================================
  "
end
