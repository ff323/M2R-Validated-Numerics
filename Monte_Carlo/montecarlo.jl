using IntervalArithmetic

function MonteCarlo(S0, K, sigma, r, T, n)

    total = interval(0.0)
    
    for _ in 1:n
        Z = randn() #standard normal random sample
        
        exponent = (r - sigma^2 / 2) * T + sigma * sqrt(T) * Z
        S_T = S0 * exp(exponent) #geometric Brownian motion
        
        payoff = max(S_T - K, 0.0)
        discounted_payoff = exp(-r * T) * payoff #
        
        total += discounted_payoff
    end
    option_price_interval = total / n
    return option_price_interval
end

println(MonteCarlo(5950, 5000, interval(0.0441, 0.0446), interval(0.1836, 0.2045), 30/365, 10000))