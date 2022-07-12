import { LightningElement, track} from 'lwc';

export default class CompanyInfo extends LightningElement {
    @track details = { //for non primitive objects and arrays you need to use @track to observe changes, 
        //for primitive it happens automaticaly
        name : "Jeff Bezos",
        title: "Executive Cahorman",
        company: "Amazon"
    }

    handleChange(event1){
        //below meaning from the current event go to the target and get what ever value the user has typed
        this.details.company = event1.target.value;
}
}