#' Creates a static image of each plot to pass to imager
#'
#' @param p Expression that evaluates to a plot
#' @export
rasterize <- function(p) {
  temp_path <- "tempfile.png"
  png(filename = temp_path)
  # If the object is a ggplot list, then let it be evaluated by ggplot
  if(ggplot2::is.ggplot(p)) {
    ggplot2::ggsave(filename = temp_path, plot = p)
  } else {
    eval(p)
  }
  dev.off()
  int_img <- imager::load.image(file = temp_path)
  unlink(temp_path)
  return(int_img)
}
