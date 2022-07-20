//What are we doing? get picklistfields for industry: picklist field can change based on recordTypeId, we use getPickListValues adopter
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class GetPicklistValuesAccount extends LightningElement {

    accountRtId;  //we will use default account Id for this practice. 
    //if we have other account recordTypes, we will need data.recordTypeInfo, iterate over it and get the required record type

    industryOptions = []; //to store label and values coming from data
    selectedIndustry;

    //we need to get recordtypeid first to get picklist values. getPicklist Adaptor depends on recordTypeId
    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})

    //call info, we map the outcome to accountHandler
    accountInfoHandler({data, error}){
        if(data){
            this.accountRtId = data.defaultRecordTypeId;
        }
    }

    //wire notation and getpicklist adaptor helps to read and get values from SF
    @wire(getPicklistValues, {fieldApiName: INDUSTRY_FIELD, recordTypeId: '$accountRtId'}) 
    //instead of this.accountRtId we use a reactive property, so the changes in the accountRtId is reflected
    //Eg: What if this method runs first before accountRtId is assigned to recordTypeId

    //we map the aoutcome to picklistHandler function
    picklistHandler({data, error}){
        if(data){
            console.log(data);
            this.industryOptions = this.picklistGenerator(data);
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
        this.selectedIndustry = event.target.value;
    }
    }

