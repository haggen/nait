module Nait
  version = "#{`git rev-parse HEAD`[0..5]} R#{`git rev-list HEAD --count`}"
  VERSION = ENV.fetch('VERSION', version)
end