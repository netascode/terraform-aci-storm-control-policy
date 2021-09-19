terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name = "SC1"
}

data "aci_rest" "stormctrlIfPol" {
  dn = "uni/infra/stormctrlifp-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "stormctrlIfPol" {
  component = "stormctrlIfPol"

  equal "name" {
    description = "name"
    got         = data.aci_rest.stormctrlIfPol.content.name
    want        = module.main.name
  }
}
