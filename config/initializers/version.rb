module Nait
  VERSION = ENV.fetch('VERSION', "#{`git rev-parse HEAD`[0..5]} R#{git rev-parse HEAD --count}")
end