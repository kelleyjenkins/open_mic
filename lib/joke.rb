class Joke
  attr_reader :id,
              :question,
              :answer

  def initialize(info)
    @id      = info[:id]
    @question = info[:question]
    @answer   = info[:answer]
  end
end
