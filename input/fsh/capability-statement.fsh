Instance: FHIRValidation
InstanceOf: CapabilityStatement
Title: "FHIR Validation (Internal)"
Usage: #definition
* description = """
TODO
"""
* name = "FHIRValidation"
* status = #draft
* experimental = false
* date = "2025-01-10"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server

* insert Resource(#Questionnaire, Questionnaire)
* rest.resource[=]
  * documentation = """
TODO
  """

