import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class GetObjectInfoContact extends LightningElement {
    defaultRtId;
    supplierRtId;
    @wire(getObjectInfo, {objectApiName: CONTACT_OBJECT})
    contactInfoHandler({data, error}) {
        //print data
        if(data){
            console.log(data);
            this.defaultRtId = data.defaultRecordTypeId;
            const rtIds = data.recordTypeInfos; //map
            this.supplierRtId = Object.keys(rtIds).find(rtid => rtIds[rtid].name === "Supplier Contact" );
            //object.keys() returns an array of keys. Find() function means: Among those array elements find the rtId where name is Supplier Contact.

        }
        if(error){
            console.log(error);
        }
    }
}