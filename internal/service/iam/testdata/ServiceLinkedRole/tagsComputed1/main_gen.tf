# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "null" {}

resource "aws_iam_service_linked_role" "test" {
  aws_service_name = "autoscaling.amazonaws.com"
  custom_suffix    = var.rName

  tags = {
    (var.unknownTagKey) = null_resource.test.id
  }
}

resource "null_resource" "test" {}

variable "rName" {
  type     = string
  nullable = false
}

variable "unknownTagKey" {
  type     = string
  nullable = false
}


