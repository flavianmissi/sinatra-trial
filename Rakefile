desc 'Run irb loading a sinatra app'
task :console, :app_path do |cmd, args|
  system "irb -r #{File.expand_path(args.app_path, File.dirname(__FILE__))}"
end

desc 'Run all tests terminate by _spec'
task :spec do
  system "rspec -c -f d spec/*_spec.rb"
end
