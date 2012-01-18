ENV["WATCHR"] = "1"

def run(cmd)
  puts "--  " * 10
  puts(cmd)
  system cmd
end

def run_all_tests
  run "bundle exec rake test"
end

watch('.*.rb') { run_all_tests }
watch('test/.*.rb') { run_all_tests }

# Ctrl-\
Signal.trap 'QUIT' do
  puts " --- Running all tests ---\n\n"
  run_all_tests
end

@interrupted = false

# Ctrl-C
Signal.trap 'INT' do
  if @interrupted then
    abort("\n")
  else
    puts "Interrupt a second time to quit"
    @interrupted = true
    Kernel.sleep 1.5
    @interrupted = false
    # raise Interrupt, nil # let the run loop catch it
    run_suite
  end
end
