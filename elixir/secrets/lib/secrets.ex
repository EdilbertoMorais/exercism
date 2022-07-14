defmodule Secrets do
  def secret_add(secret) do
    fn param ->
      param + secret
    end
  end

  def secret_subtract(secret) do
    fn param ->
      param - secret
    end
  end

  def secret_multiply(secret) do
    fn param ->
      param * secret
    end
  end

  def secret_divide(secret) do
    fn param ->
      div(param, secret)
    end
  end

  # perguntar pq eu precisei colocar o Bitwise.&&& se ele é do Kernel
  def secret_and(secret) do
    fn param ->
      Bitwise.band(param, secret)
    end
  end

  def secret_xor(secret) do
    fn param ->
      Bitwise.bxor(param, secret)
    end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn param ->
      param
      |> secret_function1.()
      |> secret_function2.()
    end
  end
end
