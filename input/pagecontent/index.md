
### FHIR Tools Application

- [FHIR Tools Skunkworks](https://nhsdigital.github.io/interoperability-standards-tools-skunkworks/)
- [GitHub Repository](https://github.com/NHSDigital/interoperability-standards-tools-skunkworks)

This is a web based application which provides a user interface to backaned FHIR Servers. These provide:

- Clinical Data Repository provided by an [AWS FHIRWorks](https://github.com/aws-solutions/fhir-works-on-aws), this is surfaced via a security and SDC facade which handles cognito authentication and provides [Structured Data Capture](https://build.fhir.org/ig/HL7/sdc/index.html) capabilities - see [FHIR Integration Engine](https://github.com/NHSDigital/IOPS-FHIR-Integration-Engine).
- [FHIR Validation Service](#validation-service)

<figure>
{%include component-frontend.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Frontend component diagram</p>
</figure>
<br clear="all">

The application is an [Angular application](https://angular.dev/overview) which includes use of several libaries such as
- [@types/fhir](https://www.npmjs.com/package/@types/fhir) for working with HL7 FHIR objects.
- [Covalent Teradata](https://teradata.github.io/covalent/v8/#/) which builds on Angular Material.

### Validation Service

- OAS (Swagger) Specification [FHIR Development and Testing (FHIR Validation) Skunkworks](http://lb-fhir-validator-924628614.eu-west-2.elb.amazonaws.com/swagger-ui/index.html)
- [GitHub Repository](https://github.com/NHSDigital/FHIR-Validation)

The Validator is based on [HAPI FHIR Instance Validator](https://hapifhir.io/hapi-fhir/docs/validation/instance_validator.html), which is exposed using a [HAPI FHIR Plain Server](https://hapifhir.io/hapi-fhir/docs/server_plain/server_types.html) which gives an FHIR RESTful API to a [FHIR $validate operation](https://www.hl7.org/fhir/resource-operation-validate.html).
This API is documented via [OpenAPI Specification (swagger)](https://swagger.io/specification/).

<figure>
{%include component-backend.svg%}
<p id="fX.X.X.X-X" class="figureTitle">Backend component diagram</p>
</figure>
<br clear="all">

The validation configuration (ValidationSupportChain) is composed of:

- `DefaultProfileValidationSupport` - which includes base FHIR CodeSystems and ValueSets
- `CommonCodeSystemsTerminologyService` - which includes UK Core and NHS England FHIR NPM packages
- A customised version of `TerminologyServiceValidationSupport` to handle the security mechanism of NHS England's Terminology Server
- `AWSValidationSupport` a custom class to enable validation of FHIR QuestionnaireResponse using FHIR Questionnaire's stored a AWS FHIRWorks server.

### Repositories, Applications and Services

The following is a list of services demonstrating a variety of FHIR and IHE use cases.

| Service / Application                             | FHIR Version | GitHub Repository                                                                                          | OAS Specification                                                                                                    | Application                                                                                                           |
|---------------------------------------------------|--------------|------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| FHIR Validation                                   | R4           | [NHS Digital GitHub Repository](https://github.com/NHSDigital/FHIR-Validation)                             | [FHIR Development and Testing](http://lb-fhir-validator-924628614.eu-west-2.elb.amazonaws.com/swagger-ui/index.html) |                                                                                                                       |
| FHIR Integration Engine                           | R4           | [NHS Digital GitHub Repository](https://github.com/NHSDigital/IOPS-FHIR-Integration-Engine)                | [Orchestration Services](http://lb-hl7-tie-1794188809.eu-west-2.elb.amazonaws.com/swagger-ui/index.html)             |                                                                                                                       |                                                                                                                                                 
| FHIR Query API Demo                               | R4           | [NHS Digital GitHub Repository](https://github.com/NHSDigital/IOPS-FHIR-QEDm)                              | [Clinical Data Sharing](http://lb-fhir-facade-926707562.eu-west-2.elb.amazonaws.com/swagger-ui/index.html)           |                                                                                                                       |
| FHIR Care Directory Services API Demo             | R4 | [NHS Digital GitHub Repository](https://github.com/NHSDigital/IOPS-FHIR-mCSD) | [Care Directories](http://lb-fhir-mcsd-1736981144.eu-west-2.elb.amazonaws.com/swagger-ui/index.html) | |                                                                                                                      | |
| Clinical Data Repository                          | R4           | [AWS FHIRWorks](https://github.com/aws-solutions/fhir-works-on-aws)                                        |                                                                                                                      |                                                                                                                       |
| FHIR Development Tools Application                | R4           | [NHS Digital GitHub Repository](https://github.com/NHSDigital/interoperability-standards-tools-skunkworks) |                                                                                                                      | [FHIR Development Tools Application](https://nhsdigital.github.io/interoperability-standards-tools-skunkworks/)       |
| FHIR R4 and UK Core Demonstration | R4 | [NHS Digital GitHub Repository](https://github.com/NHSDigital/FHIR-R4-Demonstration) | | [FHIR R4 and UK Core Demonstration](https://nhsdigital.github.io/FHIR-R4-Demonstration/) |
| Care Connect API Documentation (FHIR Query API)   | STU3         | [NHS Connect GitHub](https://github.com/nhsconnect/CareConnectAPI)                                         |                                                                                                                      | [Care Connect API Documentation](https://nhsconnect.github.io/CareConnectAPI/)                                        |
| Care Connect Reference Implementation Application | STU3         | [NHS Connect GitHub](https://github.com/nhsconnect/ccri-fhir-explorer)                                     |                                                                                                                      | [FHIR Explorer](https://data.developer.nhs.uk/ccri/exp)                                                               | 
| Care Connect Reference Implementation Service     | STU3         | [NHS Connect GitHub](https://github.com/nhsconnect/careconnect-reference-implementation)                   | Use FHIR Explorer for documentation (see above)                                                                      |                                                                                                                       |                                               
| Care Connect Document Viewer                      | STU3         | [NHS Connect GitHub](https://github.com/nhsconnect/careconnect-document-viewer)                            |                                                                                                                      | [Clinical Document Viewer](https://nhsconnect.github.io/careconnect-document-viewer) used in Transfer of Care testing |                                                                                                               
| Care Connect Document Service                     | STU3         | [NHS Connect GitHub](https://github.com/nhsconnect/careconnect-document)                                   |                                                                                                                      |                                                                                                                       |
| Health Information Exchange Portal | STU3 | [NHS Connect GitHub](https://github.com/nhsconnect/ccri-hie-portal) | | [Health Information Exchange Portal](https://nhsconnect.github.io/ccri-hie-portal/hie) |
