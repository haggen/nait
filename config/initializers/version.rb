module Nait
  VERSION = "#{`git rev-parse HEAD`[0..5]} R#{`git rev-parse HEAD --count`}"
  VERSION = ENV.fetch('VERSION', VERSION)
end