import { LightningElement, wire } from 'lwc';

import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';

export default class GetPicklistValuesOpp extends LightningElement {
    opportunityRtId;
    stageNameOptions;
    selectedStageName;

    @wire(getObjectInfo, {objectApiName: OPPORTUNITY_OBJECT})

    //call info, we map the outcome to accountHandler
    opportunityInfoHandler({data, error}){
        if(data){
            this.opportunityRtId = data.defaultRecordTypeId;
        }
    }

    //wire notation and getpicklist adaptor helps to read and get values from SF
    @wire(getPicklistValues, {fieldApiName: STAGENAME_FIELD, recordTypeId: '$opportunityRtId'}) 
    //instead of this.accountRtId we use a reactive property, so the changes in the accountRtId is reflected
    //Eg: What if this method runs first before accountRtId is assigned to recordTypeId

    //we map the aoutcome to picklistHandler function
    picklistHandler({data, error}){
        if(data){
            console.log(data);
            this.stageNameOptions = this.picklistGenerator(data);
        } 
        if(error){
            console.error(error);
        }
    }
    //helps to itarate on data using map and store them in object with the label and values only (data has 4 attributes)
    //above, we store these objects in an array of industryOptions
    picklistGenerator(data){
        return  data.values.map(item => ({ //each data it creates {item: label, value} object
            label: item.label,
            value: item.value
        }));
    }

    changeHandler(event){
        this.selectedStageName = event.target.value;
    }
}