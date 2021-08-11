class CodeError < RuntimeError

  attr_accessor :code, :msg, :data

  def initialize(code, msg, data = nil)
    @code = code
    @msg = msg
    @data = data
  end

  def CodeError.raise(code = 500, msg)
    Kernel.raise CodeError.new(code, msg)
  end

  def CodeError.with_raise_data(code = 500, msg, data)
    Kernel.raise CodeError.new(code, msg, data)
  end

end
