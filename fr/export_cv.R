export_cv <- function(){
  #rmarkdown::render("Thesis.rmd", output_file = I("Thesis.html"))
  rmarkdown::render("resume.rmd", output_file = I("resume.html"))
  rmarkdown::render("cv.rmd", output_file = I("index.html"))
  pagedown::chrome_print("resume.html")
  #pagedown::chrome_print("Thesis.html")
   pagedown::chrome_print("index.html")
  }


export_cv()

