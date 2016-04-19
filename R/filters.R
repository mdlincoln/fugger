#' Grayscale filter
#'
#' Run a grayscale filter on a plot
#'
#' @param plot An object or expression that evaluates as a plot.
#' @export
fug_gs <- function(p) {
  raster_plot <- rasterize(p)
  gs_raster <- imager::grayscale(raster_plot)
  try(dev.off(), silent = TRUE)
  plot(gs_raster, xaxt = "n", yaxt = "n", ann = FALSE)
  invisible(gs_raster)
}

#' Black and white filter
#'
#' Run a grayscale filter on a plot
#'
#' @param plot An object or expression that evaluates as a plot.
#' @param threshold Set a threshold for black vs. white. Defaults to "auto". See \link{threshold}.
#' @export
fug_bw <- function(p, threshold = "auto") {
  raster_plot <- rasterize(p)
  bw_raster <- imager::threshold(imager::grayscale(raster_plot), thr = threshold)
  try(dev.off(), silent = TRUE)
  plot(bw_raster, xaxt = "n", yaxt = "n", ann = FALSE)
  invisible(bw_raster)
}

#' Run an arbitrary function from imager
#'
#' @param p Expression that evaluates to a plot
#' @param imager_fun imager function
#' @param ... Arguments to pass to \code{imager_fun}
#'
#' @export
fug_fun <- function(p, imager_fun, ...) {
  # Stop if imager_fun does not take "im" as an argument
  stopifnot("im" %in% names(formals(imager_fun)))

  raster_plot <- rasterize(p)
  fugged_raster <- imager_fun(im = raster_plot, ...)
  try(dev.off(), silent = TRUE)
  plot(fugged_raster, xaxt = "n", yaxt = "n", ann = FALSE)
  invisible(fugged_raster)
}
