library(ggplot2)

iris_ggplot <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point()

iris_plot <- quote(plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Species))

test_that("rasterize returns a cimg object", {
  expect_s3_class(rasterize(iris_ggplot), "cimg")
  expect_s3_class(rasterize(iris_plot), "cimg")
  expect_s3_class(rasterize(plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Species)), "cimg")
  expect_error(rasterize(iris))
})

test_that("filters all succeed", {
  expect_s3_class(fug_gs(iris_ggplot), "cimg")
  expect_s3_class(fug_bw(iris_ggplot), "cimg")
})

test_that("fug_fun only accepts compatible imager commands", {
  expect_error(fug_fun(iris_ggplot, imager::average))
})
