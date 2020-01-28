require_relative 'config/environment'

class App < Sinatra::Base
  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end

  get '/square/:number' do
    @square = (params[:number].to_i)**2
    return @square.to_s
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    @array = []
    @number.times do
      @array << @phrase
    end
    @array.join
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @string = params.map do |key, value|
      "#{value}"
    end
    @string.join(" ") + "."
  end

  get '/:operation/:number1/:number2' do
    case params[:operation]
    when "add"
      @operation = "+"
    when "subtract"
      @operation = "-"
    when "multiply"
      @operation = "*"
    when "divide"
      @operation = "/"
    end
    @number1 = params[:number1]
    @number2 = params[:number2]
    @string = "#{@number1}#{@operation}#{@number2}"
    (eval@string).to_s
  end

end