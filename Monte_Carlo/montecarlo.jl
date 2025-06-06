using IntervalArithmetic

function interval_monte_carlo_option_price(S0, K, sigma, r, T, n)

    total = Interval(0.0)
    
    for _ in 1:n
        Z = randn()
        
        exponent = (r - sigma^2 / 2) * T + sigma * sqrt(T) * Z
        S_T = S0 * exp(exponent)
        
        payoff = max(S_T - K, 0.0)
        discounted_payoff = exp(-r * T) * payoff
        
        total += discounted_payoff
    end
    
    option_price_interval = total / n
    return option_price_interval
end

println(interval_monte_carlo_option_price(5950, 5900, interval(0.0441, 0.0446), interval(0.1836, 0.2045), 30/365, 1000))