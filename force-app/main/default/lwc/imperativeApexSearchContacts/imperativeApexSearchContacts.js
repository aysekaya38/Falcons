import { LightningElement } from 'lwc';
import searchContact from '@salesforce/apex/ContactController.searchContact';

const COLUMNS = [ //we cannot create const inside func
    {label: "First Name", fieldName:"FirstName", type:"text"},
    {label: "Last Name", fieldName:"LastName", type:"text"},
    {label: "Department", fieldName:"Department", type:"text"},
    {label: "Title", fieldName:"Title", type:"text"},
]

export default class ImperativeApexSearchContacts extends LightningElement {
    columns = COLUMNS;
    searchWord; //anytime there is change in the searchWord we want the value to change
    contacts;
    error = "Start entering key words to get matching contacts";  //lets record the error as well

    changeHandler(event){
        this.searchWord = event.target.value;
        //lets call the method imperatively
        searchContact({searchKey: this.searchWord}) //we control when the method runs so no need for reactive property 
            .then(result => {
                this.contacts = result;
                if(this.contacts.length == 0){
                    this.error = "No search words with "+this.searchWord + "Try another search word"
                } else {
                    this.error = undefined //the error message will continue to display even there are results since we initilaized it in HTML, SO we need to make it undefined
                }
                
            })
            .catch(error => {
                console.error(error);
                this.error = error.detail.message;
                //if we get error, we do not want to see any searches
                this.contacts = undefined;
            })
    }
}