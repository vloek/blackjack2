require "bundler/gem_tasks"


desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r blackjack2.rb"
end

desc "Start test"
task :spec do
  sh "rspec spec/*"
end