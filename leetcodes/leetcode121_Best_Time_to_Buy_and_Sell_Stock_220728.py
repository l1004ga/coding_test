import sys

def maxProfit(prices):
    profit = 0
    min_price = sys.maxsize

    for price in prices:
        min_price = min(min_price, price)
        profit = max(profit, price - min_price)

    return profit

prices = [7,1,5,3,6,4] # 5

prices = [7,6,4,3,1] #0

prices = [4,7,2,6,1,3] #4
maxProfit(prices)
