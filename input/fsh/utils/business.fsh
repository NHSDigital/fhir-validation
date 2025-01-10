// Extensions
Alias: $conf             = http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation
Alias: $dar              = http://hl7.org/fhir/StructureDefinition/data-absent-reason
Alias: $minLength        = http://hl7.org/fhir/StructureDefinition/minLength
Alias: $pertainsToGoal   = http://hl7.org/fhir/StructureDefinition/resource-pertainsToGoal
Alias: $typeMS           = http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support


// Inter-version extensions
Alias: $observationFocus = http://hl7.org/fhir/5.0/StructureDefinition/extension-Observation.focus
Alias: $instanceContent  = http://hl7.org/fhir/5.0/StructureDefinition/extension-ExampleScenario.instance.content
Alias: $verContent       = http://hl7.org/fhir/5.0/StructureDefinition/extension-ExampleScenario.instance.version.content
Alias: $verTitle         = http://hl7.org/fhir/5.0/StructureDefinition/extension-ExampleScenario.instance.version.title


// ExampleScenario RuleSets
RuleSet: ActorEntity(id, name, description)
* actor[+]
  * actorId = "{id}"
  * type = #entity
  * name = {name}
  * description = "{description}"

RuleSet: ActorPerson(id, name, description)
* actor[+]
  * actorId = "{id}"
  * type = #person
  * name = {name}
  * description = "{description}"

RuleSet: Instance_Empty(id, type, name, description)
* instance[+]
  * resourceId = "{id}"
  * resourceType = #{type}
  * name = {name}
  * description = "{description}"

RuleSet: Instance_Content(id, type, name, description)
* insert Instance_Empty({id}, {type}, {name}, [[{description}]])
* instance[=].extension[$instanceContent].valueReference = Reference({id})

RuleSet: InstanceVersion(id, name, content, description)
* instance[=].version[+]
  * extension[$verTitle].valueString = {name}
  * extension[$verContent].valueReference = Reference({content})
  * versionId = "{id}"
  * description = "{description}"

RuleSet: InstanceContains(id, version)
* instance[=].containedInstance
  * resourceId = "{id}"
  * versionId = "{version}"

RuleSet: ProcessSearch(num, name, sender, receiver, request, response, description)
* step[+].operation
  * number = "{num}"
  * type = "search-type"
  * name = {name}
  * description = "{description}"
  * initiator = "{sender}"
  * receiver = "{receiver}"
  * request.resourceId = "{request}"
  * response.resourceId = "{response}"

RuleSet: ProcessRead(num, name, sender, receiver, request, response, description)
* step[+].operation
  * number = "{num}"
  * type = "read"
  * name = {name}
  * description = "{description}"
  * initiator = "{sender}"
  * receiver = "{receiver}"
  * request.resourceId = "{request}"
  * response.resourceId = "{response}"

RuleSet: ProcessCreateEvent(num, name, sender, receiver, request, version, description)
* step[+].operation
  * number = "{num}"
  * type = "create"
  * name = {name}
  * description = "{description}"
  * initiator = "{sender}"
  * receiver = "{receiver}"
  * request.resourceId = "{request}"
  * request.versionId = "{version}"

RuleSet: ProcessCreate(num, name, sender, receiver, request, version, description)
* step[+].operation
  * number = "{num}"
  * type = "create"
  * name = {name}
  * description = "{description}"
  * initiator = "{sender}"
  * receiver = "{receiver}"
  * request.resourceId = "{request}"
  * request.versionId = "{version}"

RuleSet: ProcessUpdate(num, name, sender, receiver, request, version, description)
* step[+].operation
  * number = "{num}"
  * type = "update"
  * name = {name}
  * description = "{description}"
  * initiator = "{sender}"
  * receiver = "{receiver}"
  * request.resourceId = "{request}"
  * request.versionId = "{version}"

RuleSet: SubNotification(parameters, endpointPrefix, subscriptionId)
* entry
  * fullUrl = "http://example.org/fhir/Parameters/{parameters}"
  * resource = {parameters}
  * request
    * method = #GET
    * url = "https://{endpointPrefix}.example.org/fhir/Subscription/{subscriptionId}/$status"
  * response.status = "200"

RuleSet: SubParameters(subscription, resource, number)
* parameter[subscription].valueReference = Reference({subscription})
* parameter[topic].valueCanonical = "http://hl7.org/fhir/us/sdoh-clinicalcare/SubscriptionTopic/Task"
* parameter[status].valueCode = #active
* parameter[type].valueCode = #event-notification
* parameter[notificationEvent]
  * part[eventNumber].valueString = "{number}"
  * part[eventFocus].valueReference = Reference({resource})


// PA RuleSets
RuleSet: Note(time, author, authorName, note)
* note[+]
  * authorReference = Reference({author}) {authorName}
  * time = {time}
  * text = "{note}"

RuleSet: ConditionPA(patient, patientName, asserter, asserterName, onset)
* clinicalStatus = $clinicalStatus#active
* verificationStatus = $verifyStatus#confirmed
* category[+] = $condition-category#health-concern
* subject = Reference({patient}) {patientName}
* onsetDateTime = "{onset}"
* asserter = Reference({asserter}) {asserterName}

RuleSet: Condition(patient, patientName, asserter, asserterName, code, display, onset)
* insert ConditionPA({patient}, {patientName}, {asserter}, {asserterName}, {onset})
* code = {code} {display}


RuleSet: CarePlan(start, end, patient, patientName, author, authorName, detail)
* text
  * status = #additional
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">{detail}</div>"
* status = #active
* intent = #plan
* subject = Reference({patient}) {patientName}
* period
  * start = "{start}"
  * start = "{end}"
* author = Reference({author}) {authorName}

RuleSet: Goal(patient, patientName, status, description)
* lifecycleStatus = #active
* achievementStatus = $goal-achievement#{status}
* description.text = "{description}"
* subject = Reference({patient}) {patientName}

RuleSet: GoalTarget(due, loinc, display, quantity)
* target
  * measure = $loinc#{loinc} {display}
  * detailQuantity = {quantity}
  * dueDate = "{due}"

RuleSet: ExerciseReferral(start, end, patient, patientName, author, authorName, code, display)
* status = #active
* intent = #order
* priority = #routine
* code = {code} "{display}"
* subject = Reference({patient}) {patientName}
* requester = Reference({author}) {authorName}
* authoredOn = "{start}"
* occurrencePeriod
  * start = "{start}"
  * end = "{end}"

RuleSet: ExerciseRx(start, end, patient, patientName, author, authorName)
* insert ExerciseReferral({start}, {end}, {patient}, {patientName}, {author}, {authorName}, $sct#229065009, [[Exercise therapy (regime/therapy)]])
* performer = Reference({patient}) {patientName}

RuleSet: FulfillTask(patient, patientName, requester, requesterName, owner, ownerName, order, status, date)
* status = #{status}
* intent = #order
* code = $task-code#fulfill
* focus = Reference({order})
* requester = Reference({requester}) {requesterName}
* for = Reference({patient}) {patientName}
* authoredOn = "{date}"
* owner = Reference({owner}) {ownerName}

RuleSet: QuestionnaireTask(patient, patientName, requester, requesterName, priority, date, status, canonical, description)
* status = #{status}
* intent = #order
* priority = #{priority}
* code = $SDC-Temp#complete-questionnaire
* description = "{description}"
* for = Reference({patient}) {patientName}
* owner = Reference({patient}) {patientName}
* authoredOn = {date}
* requester = Reference({requester}) {requesterName}
* input[Questionnaire].valueCanonical = "{canonical}"

RuleSet: ReviewTask(patient, patientName, requester, requesterName, priority, date, status, content, description)
* status = #{status}
* intent = #order
* priority = #{priority}
* code = $SDOHCC-Temp#review-material
* focus = Reference({content})
* description = "{description}"
* for = Reference({patient}) {patientName}
* owner = Reference({patient}) {patientName}
* authoredOn = {date}
* requester = Reference({requester}) {requesterName}

RuleSet: DocRefVideo(url)
* status = #current
* content[+]
  * attachment
    * contentType = #video/mp4
    * url = "{url}"

RuleSet: Questionnaire(url, version)
* url = "{url}"
* version = "{version}"
* status = #active
* subjectType = #Patient

RuleSet: Question(linkId, type, text)
* item[+]
  * linkId = "{linkId}"
  * text = "{text}"
  * type = #{type}

RuleSet: QuestionnaireResponse(patient, patientName, date, questionnaire)
* status = #completed
* questionnaire = "{questionnaire}"
* subject = Reference({patient}) {patientName}
* authored = {date}

RuleSet: BooleanAnswer(linkId, answer, text)
* item[+]
  * linkId = "{linkId}"
  * text = "{text}"
  * answer.valueBoolean = {answer}

RuleSet: StringAnswer(linkId, answer, text)
* item[+]
  * linkId = "{linkId}"
  * text = "{text}"
  * answer.valueString = {answer}

RuleSet: DiagnosticReport(patient, patientName, performer, performerName, code, display, order, start, end, base64)
* basedOn = Reference({order})
* status = #final
* code = {code} {display}
* subject = Reference({patient}) {patientName}
* effectivePeriod
  * start = "{start}"
  * end   = "{end}"
* performer = Reference({performer}) {performerName}
* presentedForm
  * contentType = #application/pdf
  * data = {base64}


// Bundle RuleSets
RuleSet: SearchBundle(count, search)
* type = #searchset
* total = {count}
* link
  * relation = "self"
  * url = "{search}"

RuleSet: TransactionBundle(timestamp)
* type = #transaction
* timestamp = {timestamp}

RuleSet: AddTransactionEntry(type, resourceId,uri)
* entry[+]
  * fullUrl = "http://example.org/fhir/{type}/{resourceId}"
  * resource = {resourceId}
  * request.method = #POST
  * request.url = {uri}

RuleSet: EntryMatch(type, resourceId)
* entry[+]
  * fullUrl = "http://example.org/fhir/{type}/{resourceId}"
  * resource = {resourceId}
  * search.mode = #match

RuleSet: EntryInclude(type, resourceId)
* entry[+]
  * fullUrl = "http://example.org/fhir/{type}/{resourceId}"
  * resource = {resourceId}
  * search.mode = #include

