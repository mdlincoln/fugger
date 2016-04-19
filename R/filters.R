#' Grayscale filter
#'
#' Run a grayscale filter on a plot
#'
#' @param plot An object or expression that evaluates as a plot.
#' @export
fug_gs <- function(p) {
  raster_plot <- rasterize(p)
  gs_raster <- imager::grayscale(raster_plot)
  plot(gs_raster)
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
  plot(bw_raster)
  invisible(bw_raster)
}
