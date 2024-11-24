# Hotel Profit Optimization Simulation

## Overview
This R-based simulation implements a Monte Carlo method to optimize hotel room pricing by modeling guest arrivals and departures based on price-dependent distributions. The program aims to find the optimal room price that maximizes daily profit while considering the dynamic nature of hotel occupancy.

## Technical Details

### Key Components
- **Price-Dependent Functions**:
  - `g(c)`: Models the length-of-stay distribution using a logistic function dependent on room price
  - `f(c)`: Models the arrival rate (lambda) as an inverse relationship with room price

### Simulation Parameters
- Room capacity: 100 rooms
- Initial price: 200 (currency units)
- Simulation duration: 100 days
- Number of simulations: 100 iterations
- Random seed: 33 (for reproducibility)

### Implementation Features
- Uses Poisson distribution to model daily guest arrivals
- Implements geometric distribution for length-of-stay modeling
- Includes capacity constraints and overflow handling
- Tracks daily occupancy and calculates cumulative profit
- Performs price optimization through iterative simulations

## Methodology
The simulation employs Monte Carlo methods to:
1. Generate random guest arrivals based on price-dependent Poisson distribution
2. Model length of stay using price-sensitive geometric distribution
3. Calculate daily profits based on occupancy and room price
4. Iterate through different price points to find optimal pricing

## Key Components Explained
- Guest Arrivals: Modeled using Poisson distribution with λ = 10000/price
- Length of Stay: Modeled using geometric distribution with parameter dependent on logistic function of price
- Profit Calculation: Daily profit = number of occupied rooms × room price
- Optimization: Iterative process testing different price points to maximize average daily profit

## Output
- Optimal room price for maximum profit
- Average daily profit at optimal price
- Line plot showing relationship between room price and total profit

## Usage
The code requires R programming environment with basic statistical packages. To run:
1. Execute the entire script
2. View the optimal price output
3. Examine the generated plot for profit-price relationship

## Technical Requirements
- R programming environment
- Base R statistical functions
- Basic plotting capabilities

## Notes
- The simulation accounts for price sensitivity in both arrival rates and length of stay
- Implements realistic constraints such as maximum occupancy
- Uses seed for reproducible results
- Provides visual representation of price-profit relationship

This implementation is particularly useful for:
- Hotel revenue management
- Pricing strategy optimization
- Understanding price elasticity effects on occupancy and profit
- Analyzing the trade-off between room rates and occupancy