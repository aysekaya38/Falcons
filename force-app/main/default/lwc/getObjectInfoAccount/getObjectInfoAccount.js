import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
//We use Lightning Data Service adopters, like wire adopters for web components to read SF data & adopters need helper, such as @wire to run
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetObjectInfoAccount extends LightningElement {
    //choose @wire from suggestions so that it adds on to the import automatically
    //getObjectInfo takes one parameter, hover on it to see the suggestions and copy paste 
    rtId;
    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT} ) //wire gets two parameters: getObjectInfo method & 
    //the wire service provides us outcome and we can store the outcome in a function or property
    objectInfoHandler({data, error}){  
          //results is an object that contains data & error. Data contains all info, we can call the info we need using data. notation
        //you can print to see the results . Everthig is an object in data; fields, etc.
        if (data) {
            this.rtId = data.defaultRecordTypeId; //rtId is a local property
        }
        
    }
}  
