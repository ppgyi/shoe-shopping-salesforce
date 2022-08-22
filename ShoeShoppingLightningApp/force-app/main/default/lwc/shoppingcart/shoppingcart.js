import { LightningElement, api } from 'lwc';

export default class Shoppingcart extends LightningElement {
    @api productsInCart;

    makeAnOrder(){
        const event = new CustomEvent('makeanorder');
        this.dispatchEvent(event);
    }
}