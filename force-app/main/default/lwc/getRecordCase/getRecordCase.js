
import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import CASENUMBER_FIELD from '@salesforce/schema/Case.CaseNumber';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';

const FIELDS = [CASENUMBER_FIELD, STATUS_FIELD, PRIORITY_FIELD, SUBJECT_FIELD, DESCRIPTION_FIELD, ORIGIN_FIELD];

export default class GetRecordCase extends LightningElement {
    recordId = '5008c00001HvDyTAAV';
    priority;
    subject;
    caseNumber;
    description;
    origin;
    status;

    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    caseInfoHandler({data, error}){
        if(data){
            console.log(data);
            this.caseNumber = data.fields.CaseNumber.value;
            this.status = data.fields.Status.value;
            this.priority = data.fields.Priority.value;
            this.subject = data.fields.Subject.value;
            this.description = data.fields.Description.value;
            this.origin = data.fields.Origin.value;
        }
        if(error){
            console.error(error);
        }
    }
}