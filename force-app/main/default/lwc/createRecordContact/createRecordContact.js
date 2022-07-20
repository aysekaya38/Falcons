import { LightningElement } from 'lwc';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { createRecord } from 'lightning/uiRecordApi';

export default class CreateRecordContact extends LightningElement {
    formdata = {}; //store the fields and vlaues
    changeHandler(event){
            
        //inorder to avoid writing a const prop for every field like below, take one constant and store both field and value
        // const name1= event.target.event.name;
        // const value1 = event.target.value;  
        //if(name==="FirstName"){
            //code
        //     if(name ===LastName){
        //         //code
        //     }
        // }
        const {name, value} = event.target; //everytime there is a change we put the field & value, //values entered by the user
        this.formdata[name] = value;
        console.log(this.formdata);
    }

        //with fucntion not wire service we can decide when to run the function, this is called 

        createContact(){ //createRecord fucntion requires recordInput, & recordInput needs two keys:apiName and fields, think about Apecz contact creation requires new contact and fields to be assigned
            const recordInput = {
                apiName: CONTACT_OBJECT.objectApiName, //instead of hardcoding apiname, import the object
                fields: this.formdata
        }
            createRecord(recordInput) //recordInput = recordInput in JS we do not need to map the same values
                .then(result => {
                    console.log(result); 
                    //meaning when you receive a + outcome/repsonse, because we need to tell JS when to run, we need provide promise concept
                    this.template.querySelector('form.contact').reset(); 
                    //meaning: find the class named contact and reset it once it is saved
                })  

                .catch(error => {
                    console.log(error);
                })

    }   
}