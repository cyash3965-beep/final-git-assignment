#!/bin/bash

# Simple Interest Calculator

echo "--- Simple Interest Calculator ---"

# Prompt for and read inputs
read -p "Enter Principal Amount (P): " P
read -p "Enter Annual Interest Rate (R): " R
read -p "Enter Time in Years (T): " T

# Input validation (basic check)
if ! [[ "$P" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$R" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$T" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  echo "Error: All inputs must be valid numbers."
  exit 1
fi

# Calculate Simple Interest: SI = (P * R * T) / 100
# Using 'bc' for floating-point arithmetic if necessary
SI=$(echo "scale=2; ($P * $R * $T) / 100" | bc)

# Output the result
echo ""
echo "Principal: $P"
echo "Rate: $R%"
echo "Time: $T years"
echo "-----------------------------------"
echo "Simple Interest (SI): $SI"
echo "Total Amount Due: $(echo "scale=2; $P + $SI" | bc)"
