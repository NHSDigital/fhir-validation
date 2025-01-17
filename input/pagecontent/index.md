
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

| Service / Application                             | FHIR Version | Implementation Guide                                                                                                                                                                           | GitHub Repository                                                                | OAS Specification                                                                                                    | Application                                                                                                           |
|---------------------------------------------------|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| FHIR Validation                                   | R4           | [HL7 FHIR Validation](https://hl7.org/fhir/R4/validation.html)                                                                                                                                                                        | [NHS Digital GitHub Repository](https://github.com/NHSDigital/FHIR-Validation)   | [FHIR Development and Testing](https://ulg1llnfga.execute-api.eu-west-2.amazonaws.com/swagger-ui/index.html) | [FHIR Validation](https://ulg1llnfga.execute-api.eu-west-2.amazonaws.com/)                          |
| FHIR Integration Engine                           | R4           | [HL7 Structured Data Capture (SDC)](https://build.fhir.org/ig/HL7/sdc/)                                                                                                                        | [NHS Digital GitHub Repository](https://github.com/NHSDigital/IOPS-FHIR-Integration-Engine)             | [Orchestration Services](https://oh5vdeg59i.execute-api.eu-west-2.amazonaws.com/) |                                                                                                                       |                                                                                                                                                 
| FHIR Query API Demo                               | R4           | [HL7 International Patient Access (IPA)](https://build.fhir.org/ig/HL7/fhir-ipa/) / [IHE Query for Existing Data mobile (QEDm)](https://build.fhir.org/ig/IHE/QEDm/branches/master/index.html) | [NHS Digital GitHub Repository](https://github.com/NHSDigital/IOPS-FHIR-QEDm)                           | [Clinical Data Sharing](https://ffw91ex2z5.execute-api.eu-west-2.amazonaws.com)   |                                                                                                                       |
| FHIR Care Directory Services API Demo             | R4           | [IHE mobile Care Directory Services (mCSD)](https://profiles.ihe.net/ITI/mCSD/index.html)                                                                                                      | [NHS Digital GitHub Repository](https://github.com/NHSDigital/IOPS-FHIR-mCSD)                           | [Care Directories](https://uz0xlsaixi.execute-api.eu-west-2.amazonaws.com/)       |                                                                                                                       | 
| Clinical Data Repository                          | R4           |                                                                                                                                                                                                | [AWS FHIRWorks](https://github.com/aws-solutions/fhir-works-on-aws)                                     |                                                                                   |                                                                                                                       |
| Document Repository                               | R4           | [IHE Mobile Health Documents](https://profiles.ihe.net/ITI/MHD/index.html)                                                                                                                     | [NHS Digital GitHub Repository](https://github.com/NHSDigital/IOPS-FHIR-MHDS)                           | [Document Sharing](https://6zsrlg601k.execute-api.eu-west-2.amazonaws.com/)       |                                                                                                                       |
| FHIR Development Tools Application                | R4           |                                                                                                                                                                                                | [NHS Digital GitHub Repository](https://github.com/NHSDigital/interoperability-standards-tools-skunkworks) |                                                                                   | [FHIR Development Tools Application](https://nhsdigital.github.io/interoperability-standards-tools-skunkworks/)       |
| FHIR R4 and UK Core Demonstration                 | R4           |                                                                                                                                                                                                | [NHS Digital GitHub Repository](https://github.com/NHSDigital/FHIR-R4-Demonstration)                    |                                                                                   | [FHIR R4 and UK Core Demonstration](https://nhsdigital.github.io/FHIR-R4-Demonstration/)                              |
| Care Connect API Documentation (FHIR Query API)   | STU3         | [CareConnectAPI](https://nhsconnect.github.io/CareConnectAPI/)                                                                                                                                 | [NHS Connect GitHub](https://github.com/nhsconnect/CareConnectAPI)                                      |                                                                                   |                                                                                                                       |
| Care Connect Reference Implementation Application | STU3         |                                                                                                                                                                                                | [NHS Connect GitHub](https://github.com/nhsconnect/ccri-fhir-explorer)                                  |                                                                                   | [FHIR Explorer](https://data.developer.nhs.uk/ccri/exp)                                                               | 
| Care Connect Reference Implementation Service     | STU3         |                                                                                                                                                                                                | [NHS Connect GitHub](https://github.com/nhsconnect/careconnect-reference-implementation)                | Use FHIR Explorer for documentation (see above)                                   |                                                                                                                       |                                               
| Care Connect Document Viewer                      | STU3         | See Technology / Representation Layer [Transfer of Care](https://digital.nhs.uk/services/transfer-of-care-initiative/transfer-of-care-resource-library)                                        | [NHS Connect GitHub](https://github.com/nhsconnect/careconnect-document-viewer)                         |                                                                                   | [Clinical Document Viewer](https://nhsconnect.github.io/careconnect-document-viewer) used in Transfer of Care testing |                                                                                                               
| Care Connect Document Service                     | STU3         |                                                                                                                                                                                                | [NHS Connect GitHub](https://github.com/nhsconnect/careconnect-document)                                |                                                                                   |                                                                                                                       |
| Health Information Exchange Portal                | STU3         |                                                                                                                                                                                                | [NHS Connect GitHub](https://github.com/nhsconnect/ccri-hie-portal)                                     |                                                                                   | [Health Information Exchange Portal](https://nhsconnect.github.io/ccri-hie-portal/hie)                                |
