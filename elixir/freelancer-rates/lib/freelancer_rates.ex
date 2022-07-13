defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8.0

  def apply_discount(before_discount, discount) do
    discount_value = before_discount * (discount / 100)
    before_discount - discount_value
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_value = daily_rate(hourly_rate) * 22

    apply_discount(monthly_value, discount)
    |> Float.ceil()
    |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    (budget / apply_discount(daily_rate(hourly_rate), discount))
    |> Float.floor(1)
  end
end
