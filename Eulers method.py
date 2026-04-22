# Step 1: Initialize variables
h = 0.05
x0, y0 = 0, 0

# Step 2: Define iteration range
xf = 0.2

# Step 3: Perform iteration
x = x0
y = y0


def main():
    global x
    global y
    while x < xf:
        # Calculate the derivative at the current step
        derivative = x + y ** 2

        # Update y using Euler's method
        y += h * derivative

        # Increment x
        x += h

        # Print the approximate values
        print(f"x = {x}, y = {y}")


if __name__ == "__main__":
    main()
