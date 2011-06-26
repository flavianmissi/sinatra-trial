desc 'Run irb loading a sinatra app'
task :console, :app_path do |cmd, args|
  system "irb -r #{File.expand_path(args.app_path, File.dirname(__FILE__))}"
end
