require 'yamatanooroti'

class MyTest < Yamatanooroti::TestCase
  def setup
    start_terminal(5, 30, ['irb', '-f', '--multiline'])
  end

  def test_run(input: ":a\n")
    write(input)
    close
    pp result
  end
end
