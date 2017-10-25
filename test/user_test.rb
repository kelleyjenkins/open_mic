require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'

class UserTest < Minitest::Test

  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_it_has_jokes
    sal = User.new("Sal")

    assert_equal [], sal.jokes
  end

  def test_it_adds_joke
    sal = User.new("Sal")

    sal.learn({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    assert_equal 1, sal.jokes.count
  end

  def test_it_can_tell_another_a_joke
    sal = User.new("Sal")
    ali = User.new("Ali")

    sal.tell(ali, {id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})

    assert_equal 1, ali.jokes.count
  end

  def test_jokes_are_added_to_recipient_of_performance
    ilana = User.new("Ilana")
    josh = User.new("Josh")

    ilana.learn(id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam.")
    ilana.learn(id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards.")
    ilana.perform_routine_for(josh)

    assert_equal 2, josh.jokes.count
  end

  def test_it_can_learn_routine
    casey = User.new("Casey")

    casey.learn_routine('./jokes.csv')

    assert_equal 100, casey.jokes.count
  end

end
