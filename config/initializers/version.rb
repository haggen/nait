module Nait
  VERSION = "#{`git rev-parse HEAD`[0..5]} R#{`git rev-list HEAD --count`}"
  VERSION = ENV.fetch('VERSION', VERSION)
end