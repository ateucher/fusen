# WARNING - Generated by {fusen} from dev/flat_read_inflate_params.Rmd: do not edit by hand

test_that("read_inflate_params works", {
  config_fusen_not_existing <-
    system.file("inflate_all/fake.yaml", package = "fusen")
  expect_error(read_inflate_params(config_yml = config_fusen_not_existing))

  config_fusen_existing <-
    yaml::read_yaml(system.file("inflate_all/config_fusen_with_inflate_parameters.yaml",
      package = "fusen"
    ))

  inflate_params <-
    read_inflate_params(config_yml = config_fusen_existing)

  expect_equal(
    length(inflate_params),
    3
  )

  expect_equal(
    names(inflate_params),
    c(
      "flat_full.Rmd",
      "flat_new_one.Rmd",
      "flat_no_inflate_params.Rmd"
    )
  )

  expect_equal(
    inflate_params[["flat_full.Rmd"]],
    list(
      pkg = "fusentest",
      flat_file = "dev/flat_full.Rmd",
      vignette_name = "Get started",
      open_vignette = FALSE,
      check = FALSE,
      document = TRUE,
      overwrite = "ask"
    )
  )

  expect_equal(
    inflate_params[["flat_new_one.Rmd"]],
    list(
      pkg = "fusentest",
      flat_file = "dev/flat_new_one.Rmd",
      vignette_name = "new_one",
      open_vignette = FALSE,
      check = FALSE,
      document = TRUE,
      overwrite = "ask"
    )
  )
  expect_null(inflate_params[["flat_no_inflate_params.Rmd"]])

  # test whether flat files with state = "deprecated" are removed
  config_fusen_with_deprecated <-
    yaml::read_yaml(system.file(
      "inflate_all/config_fusen_with_inflate_parameters_and_some_deprecated_files.yaml",
      package = "fusen"
    ))

  inflate_params <-
    read_inflate_params(config_yml = config_fusen_with_deprecated)

  expect_equal(
    length(inflate_params),
    2
  )

  expect_equal(
    names(inflate_params),
    c("flat_new_one.Rmd", "flat_no_inflate_params.Rmd")
  )
})
