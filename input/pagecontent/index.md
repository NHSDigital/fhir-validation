## Backend Architecture

The Validator is based on [HAPI FHIR Instance Validator](https://hapifhir.io/hapi-fhir/docs/validation/instance_validator.html), which is exposed using a [HAPI FHIR Plain Server](https://hapifhir.io/hapi-fhir/docs/server_plain/server_types.html) which gives an FHIR RESTful API to a [FHIR $validate operation](https://www.hl7.org/fhir/resource-operation-validate.html).
This API is documented via [OpenAPI Specification (swagger)](https://swagger.io/specification/) as part of the service [here](http://lb-fhir-validator-924628614.eu-west-2.elb.amazonaws.com/swagger-ui/index.html)

<figure>
{%include component-backend.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Backend component diagram</p>
</figure>
<br clear="all">

The validation configuration is composed of:

- `DefaultProfileValidationSupport` - which includes base FHIR CodeSystems and ValueSets
- `CommonCodeSystemsTerminologyService` - which includes UK Core and NHS England FHIR NPM packages
- A customised version of `TerminologyServiceValidationSupport` to handle the security mechanism of NHS England's Terminology Server
- `AWSValidationSupport` a custom class to enable validation of FHIR QuestionnaireResponse using FHIR Questionnaire's stored a AWS FHIRWorks server.

## Frontend Architecture

This is a web based application which provides a user interface to backaned FHIR Servers. These provide:

- Clinical Data Repository provided by an [AWS FHIRWorks](https://github.com/aws-solutions/fhir-works-on-aws), this is surfaced via a security and SDC facade which handles cognito authentication and provides [Structured Data Capture](https://build.fhir.org/ig/HL7/sdc/index.html) capabilities - see [FHIR Integration Engine](https://github.com/NHSDigital/IOPS-FHIR-Integration-Engine).
- [FHIR Validation Service](https://github.com/NHSDigital/FHIR-Validation)
- An experimental service to convert openEHR to FHIR Questionnaire is provided by [IOPS openFHIR](https://github.com/NHSDigital/IOPS-openFHIR)

<figure>
{%include component-frontend.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Frontend component diagram</p>
</figure>
<br clear="all">

The application is an [Angular application](https://github.com/NHSDigital/FHIR-Validation) which includes use of several libaries such as
- [@types/fhir](https://www.npmjs.com/package/@types/fhir) for working with HL7 FHIR objects.
- [Covalent Teradata](https://teradata.github.io/covalent/v8/#/) which builds on Angular Material.

