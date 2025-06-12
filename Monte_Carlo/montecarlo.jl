using IntervalArithmetic

function MonteCarlo(S0, K, sigma, r, T, n)

    total = interval(0.0)
    
    for _ in 1:n
        Z = randn() #standard normal random sample
        
        exponent = (r - sigma^2 / 2) * T + sigma * sqrt(T) * Z
        S_T = S0 * exp(exponent) #geometric Brownian motion
        
        payoff = max(S_T - K, 0.0)
        discounted_payoff = exp(-r * T) * payoff 
        
        total += discounted_payoff
    end
    option_price_interval = total / n
    return option_price_interval
end
S = 6000.36
strike_prices = 5300:100:5900
maturities = [27, 42, 55, 70, 84, 105, 116]
σ_interval = interval(0.1676, 0.1678)
r_interval = interval(0.04267, 0.04309)
for x in strike_prices
    println(x)
    for t in maturities
        println(MonteCarlo(S, x, σ_interval, r_interval, t/365, 10^6), " ", t)
    end

end
