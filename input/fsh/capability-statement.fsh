Instance: FHIRValidation
InstanceOf: CapabilityStatement
Title: "FHIR Validation (Internal)"
Usage: #definition
* description = """
This is a summary of the servers requirements. A full CapabilityStatement is available via the [metadata](http://lb-fhir-validator-924628614.eu-west-2.elb.amazonaws.com/swagger-ui/index.html#/FHIR%20Package%20Queries/get_FHIR_R4_metadata) endpoint.
"""
* name = "FHIRValidation"
* status = #draft
* experimental = false
* date = "2025-01-10"
* kind = #instance
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server

* insert Resource(#CodeSystem, CodeSystem)
* rest.resource[=]
  * documentation = "Allows querying of resources loaded into the validator from the implementation guides"
  * operation[+]
    * name = "$lookup"
    * definition = "http://hl7.org/fhir/OperationDefinition/CodeSystem-lookup"
    * documentation = "[lookup](https://www.hl7.org/fhir/R4/operation-codesystem-lookup.html) uses NHS England Terminology Server"
* insert Interaction(#search-type)
* insert SearchParam(url, #uri)


* insert Resource(#ConceptMap, ConceptMap)
* rest.resource[=]
  * documentation = "Allows querying of resources loaded into the validator from the implementation guides"
* insert Interaction(#search-type)
* insert SearchParam(url, #uri)


* insert Resource(#ValueSet, ValueSet)
* rest.resource[=]
  * documentation = "Allows querying of resources loaded into the validator from the implementation guides"
  * operation[+]
    * name = "$validate-code"
    * definition = "http://hl7.org/fhir/OperationDefinition/ValueSet-validate-code"
    * documentation = "[validate-code](https://www.hl7.org/fhir/R4/operation-valueset-validate-code.html) uses NHS England Terminology Server"
* insert Interaction(#search-type)
* insert SearchParam(url, #uri)

* rest.operation[+]
  * name = "$validate"
  * definition = "http://hl7.org/fhir/OperationDefinition/Resource-validate"
  * documentation = "[validate](https://www.hl7.org/fhir/R4/resource-operation-validate.html)"


