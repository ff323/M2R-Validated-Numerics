using IntervalArithmetic
using Distributions

function MonteCarloSimualation(
    S0::Float64,
    strike_price::Float64,
    rate_interval::Interval,
    sigma_interval::Interval,
    T::Float64,
    N::Int
)::Interval
    #standard normal
    Z = Normal(0, 1)
    z = rand(Z)

    ST = S0 * exp((rate_interval - 0.5 * sigma_interval^2)*T + sigma_interval * sqrt(T) * z)

    println(ST)

end

MonteCarloSimualation(5950.0, 7000.0, interval(0.0441, 0.0446), interval(0.1836, 0.2045), 30/365, 1000)
