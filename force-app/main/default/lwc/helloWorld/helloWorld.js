import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
//HTML only talks with JS. Js is the controller. JS can talk with everyone. HTML requests data from
//properties are like variables in Apex: placeholders to store data and can change over time: NO DATA TYPE!
//if not any access modifier it is private; and it is available only INSIDE the current lightning web component
name; //undefined property
fullName = "Salesforce Developer" //string property Note: You can use both '' or "" for strings
age = 38;
location = {    //OBJECT PROPERTY 
    city: "Houston",
    country: "United States",
    postalCode: "56395"

};
fruits = ["Banana", "Orange", "Pomogranite", "Pineapple", 3, 'apples'] //array property Note: array can contain different data types

//Data binding from html to js

//write methods by default private
getLocation(){
    //if you want to access any local property in a method in JS do NOT FORGET THIS
    return this.location.city; //meaning there is a local var namely location, get the value of that location property
}
}