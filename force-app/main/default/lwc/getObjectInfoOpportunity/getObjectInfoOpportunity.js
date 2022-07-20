import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';


export default class GetObjectInfoOpportunity extends LightningElement {
    defaultRtId;
    refinedPtId;
    
    @wire(getObjectInfo, {objectApiName: OPPORTUNITY_OBJECT})
    opportunityHandler({data, error}) {
        if(data) {
            console.log(data);
            this.defaultRtId = data.defaultRecordTypeId;
            const rtIds = data.recordTypeInfos;
            this.refinedPtId  = Object.keys(rtIds).find(rtid => rtIds[rtid].name === "Refined Petrolium" );
        }
        if(error) {
            console.log(error);
        }
    }
}