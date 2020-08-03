# author: Boukary Ouedraogo
# date: Juin à7, 2020
# intent: update the resume html and pdf file in one script

rmarkdown::render(input = "resume.rmd",
                  output_file = "index.html",
                  output_options = list(
                    css = c('css/resume.css', 'css/styles_html.css', 'resume'),
                    self_contained = FALSE
                  ),
                  params = list(
                    doctype = "HTML"
                  )
)

rmarkdown::render(input = "resume.rmd",
                  output_file = "boukary_resume.html",
                  output_options = list(
                    css = c('css/resume.css', 'css/styles_pdf.css', 'resume')
                  ),
                  params = list(
                    doctype = "PDF"
                  )
)


rmarkdown::render("resume.rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "resume.html")

# Knit the PDF version to temporary html location
tmp_html_resume_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("resume.rmd",
                  params = list(pdf_mode = TRUE, doctype = "PDF"),
                  output_file = tmp_html_resume_loc,
                  output_options = list(
                    css = c('css/resume.css', 'css/styles_pdf.css', 'resume')
                  )
                    
                  )
                  

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_resume_loc,
                       output = "boukary_resume.pdf")
