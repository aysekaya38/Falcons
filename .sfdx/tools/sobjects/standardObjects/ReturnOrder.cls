// This file is generated as an Apex representation of the
//     corresponding sObject and its fields.
// This read-only file is used by the Apex Language Server to
//     provide code smartness, and is deleted each time you
//     refresh your sObject definitions.
// To edit your sObjects and their fields, edit the corresponding
//     .object-meta.xml and .field-meta.xml files.

global class ReturnOrder {
    global Id Id;
    global SObject Owner;
    global Id OwnerId;
    global Boolean IsDeleted;
    global String ReturnOrderNumber;
    global Datetime CreatedDate;
    global User CreatedBy;
    global Id CreatedById;
    global Datetime LastModifiedDate;
    global User LastModifiedBy;
    global Id LastModifiedById;
    global Datetime SystemModstamp;
    global Datetime LastViewedDate;
    global Datetime LastReferencedDate;
    global Account Account;
    global Id AccountId;
    global Contact Contact;
    global Id ContactId;
    global Case Case;
    global Id CaseId;
    global Order Order;
    global Id OrderId;
    global Location SourceLocation;
    global Id SourceLocationId;
    global Location DestinationLocation;
    global Id DestinationLocationId;
    global String ShipmentType;
    global String ShipFromStreet;
    global String ShipFromCity;
    global String ShipFromState;
    global String ShipFromPostalCode;
    global String ShipFromCountry;
    global Double ShipFromLatitude;
    global Double ShipFromLongitude;
    global String ShipFromGeocodeAccuracy;
    global Address ShipFromAddress;
    global User ReturnedBy;
    global Id ReturnedById;
    global String Description;
    global Datetime ExpectedArrivalDate;
    global String Status;
    global List<ActivityHistory> ActivityHistories;
    global List<AttachedContentDocument> AttachedContentDocuments;
    global List<CombinedAttachment> CombinedAttachments;
    global List<ContentDocumentLink> ContentDocumentLinks;
    global List<EmailMessage> Emails;
    global List<EntitySubscription> FeedSubscriptionsForEntity;
    global List<Event> Events;
    global List<OpenActivity> OpenActivities;
    global List<ProcessInstance> ProcessInstances;
    global List<ProcessInstanceHistory> ProcessSteps;
    global List<RecordAction> RecordActions;
    global List<RecordActionHistory> RecordActionHistories;
    global List<ReturnOrderFeed> Feeds;
    global List<ReturnOrderHistory> Histories;
    global List<ReturnOrderLineItem> ReturnOrderLineItems;
    global List<ReturnOrderShare> Shares;
    global List<Task> Tasks;
    global List<TopicAssignment> TopicAssignments;
    global List<ContentVersion> FirstPublishLocation;
    global List<EventChangeEvent> What;
    global List<EventRelationChangeEvent> Relation;
    global List<FeedComment> Parent;
    global List<FlowRecordRelation> RelatedRecord;
    global List<OutgoingEmail> RelatedTo;
    global List<TaskChangeEvent> What;

    global ReturnOrder () 
    {
    }
}