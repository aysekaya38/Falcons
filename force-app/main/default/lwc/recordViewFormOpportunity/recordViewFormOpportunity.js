import { LightningElement, api } from 'lwc';
//api decorator makes the property public so we can pass values to this prop from outside
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';

import OPPORTUNITY_NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACCOUNTID_FIELD from '@salesforce/schema/Opportunity.AccountId';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import LEAD_SOURCE_FIELD from '@salesforce/schema/Opportunity.LeadSource';

export default class RecordViewFormOpportunity extends LightningElement {
    recordId = "0068c00000pWRSrAAO";
    //@api recordId; //passes the recordId from the record page if the card is on record page
    objectName = OPPORTUNITY_OBJECT;
    fields = {
        Name: OPPORTUNITY_NAME_FIELD,
        AccountId: ACCOUNTID_FIELD,
        Type: TYPE_FIELD,
        StageName: STAGE_FIELD,
        Amount: AMOUNT_FIELD,
        LeadSource: LEAD_SOURCE_FIELD
    }
}