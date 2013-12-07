module Nait
  REVISION = `git rev-list HEAD --count`.strip
  VERSION  = `git rev-parse HEAD`.strip
end