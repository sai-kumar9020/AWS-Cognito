locals {
  project_name = "HelloWorldApp"
  environment  = "dev"
}

module "cognito" {
  source = "./modules/cognito"

  project_name = local.project_name
  environment  = local.environment
}

module "lambda" {
  source = "./modules/lambda"

  project_name = local.project_name
  environment  = local.environment
}

module "api_gateway" {
  source = "./modules/api_gateway"

  project_name        = local.project_name
  environment         = local.environment
  lambda_function_arn = module.lambda.lambda_function_arn
  cognito_user_pool_arn = module.cognito.user_pool_arn
}
