The Validator is based on [HAPI FHIR Instance Validator](https://hapifhir.io/hapi-fhir/docs/validation/instance_validator.html), which is exposed using a [HAPI FHIR Plain Server](https://hapifhir.io/hapi-fhir/docs/server_plain/server_types.html) which gives an FHIR RESTful API to a [FHIR $validate operation](https://www.hl7.org/fhir/resource-operation-validate.html).
This API is documented via [OpenAPI Specification (swagger)](https://swagger.io/specification/) as part of the service [here](http://lb-fhir-validator-924628614.eu-west-2.elb.amazonaws.com/swagger-ui/index.html)

<figure>
{%include component.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Overview component diagram</p>
</figure>
<br clear="all">

The validation configuration is composed of:

- `DefaultProfileValidationSupport` - which includes base FHIR CodeSystems and ValueSets
- `CommonCodeSystemsTerminologyService` - which includes UK Core and NHS England FHIR NPM packages
- A customised version of `TerminologyServiceValidationSupport` to handle the security mechanism of NHS England's Terminology Server
- `AWSValidationSupport` a custom class to enable validation of FHIR QuestionnaireResponse using FHIR Questionnaire's stored a AWS FHIRWorks server.

