# Solutions to the exercises

# Exercise 4: Create a scatterplot plotting the number of cylinders (cyl) as x and highway mileage (hwy) on the y-axis. 
ggplot(data= mpg) + 
  geom_point(mapping = aes(x=cyl, y=hwy))


# Exercise 6: Make the same scatterplot as the previous example, but map drv to color.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))


# Exercise 14: Shorthand version
ggplot(data = diamonds, mapping = aes(x=carat, y=price)) + 
  geom_point(aes(color=clarity)) +
  geom_smooth()

# or
ggplot(diamonds, aes(carat, price)) + 
  geom_point(aes(color=clarity)) + 
  geom_smooth()


# Exercise 17: Create a bar chart with x = clarity. 
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = clarity))

# Exercise 19: Add x = "Engine displacement (L)", y = "Highway fuel economy (mpg)", and colour = "Car type" in the lab
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(
    title = "Fuel efficiency generally decreases with engine size",
    subtitle = "Two seaters (sports cars) are an exception because of their light weight",
    caption = "Data from fueleconomy.gov",
    x = "Engine displacement (L)",
    y = "Highway fuel economy (mpg)",
    color = "Car Type"
  )
