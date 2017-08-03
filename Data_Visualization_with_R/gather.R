library("rvest")
r_viz <- read_html("http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html")
r_images <- vector()
image_links <- vector()

# harvest image links 
r_images <- r_viz %>%
  html_nodes("img") %>%
  html_attr("src")

# prepend rest of URL to image name
for(i in seq_along(r_images)){
  image_links <- paste('http://r-statistics.co/', r_images, sep="")
}

# save image files to charts folder in working directory
for (i in seq_along(image_links)) {
  filename <- paste(i, 'png', sep=".")
  download.file(image_links[i], charts/filename, mode = 'wb')
  }

