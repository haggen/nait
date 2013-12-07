require 'test_helper'

class LogTest < ActiveSupport::TestCase
  setup do
    @log = Log.new(:date => Date.yesterday)
  end

  test "default date is today" do
    assert Log.new.date == Date.today
  end

  test "default date does not overwrite" do
    assert @log.date != Date.today
  end
end
