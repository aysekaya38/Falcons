import { LightningElement, track} from 'lwc';

export default class TrackProperty extends LightningElement {
    @track location = { //for non primitive objects and arrays you need to use @track to observe changes, 
        //for primitive it happens automaticaly
        city :"Denver",
        country: "United States",
        postalCode: "80231"
    }

    handleChange(event1){
        //below meaning from the current event go to the target and get what ever value the user has typed
        this.location.city = event1.target.value;
}
}