output "dn" {
  value       = aci_rest.stormctrlIfPol.id
  description = "Distinguished name of `stormctrlIfPol` object."
}

output "name" {
  value       = aci_rest.stormctrlIfPol.content.name
  description = "Storm control policy name."
}
