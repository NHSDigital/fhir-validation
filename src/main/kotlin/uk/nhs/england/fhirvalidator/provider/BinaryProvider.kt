package uk.nhs.england.fhirvalidator.provider

import ca.uhn.fhir.context.FhirContext
import ca.uhn.fhir.rest.annotation.*
import ca.uhn.fhir.rest.server.IResourceProvider
import jakarta.servlet.http.HttpServletRequest
import mu.KLogging
import org.hl7.fhir.r4.model.*
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.stereotype.Component
import uk.nhs.england.fhirvalidator.awsProvider.AWSBinary
import uk.nhs.england.fhirvalidator.interceptor.CognitoAuthInterceptor

@Component
class BinaryProvider(
                     private val awsBinary: AWSBinary,

                     ) : IResourceProvider {
    companion object : KLogging()

    override fun getResourceType(): Class<Binary> {
        return Binary::class.java
    }

    @Read
    fun read(httpRequest : HttpServletRequest, @IdParam internalId: IdType): Binary? {
        return awsBinary.get(internalId)
    }

}
