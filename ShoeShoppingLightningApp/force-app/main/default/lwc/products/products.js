import { LightningElement, wire, track } from 'lwc';
import getProducts from '@salesforce/apex/ProductManager.getProducts';

import getFilteredProductsByCategory from '@salesforce/apex/ProductManager.getFilteredProductsByCategory';
import getFilteredProductsByColor from '@salesforce/apex/ProductManager.getFilteredProductsByColor';
import getFilteredProductsByPrice from '@salesforce/apex/ProductManager.getFilteredProductsByPrice';
import setOrder from '@salesforce/apex/OrderManager.setOrder';

export default class HelloWorld extends LightningElement {
  @wire(getProducts) products;
  @track productsInCart = [];
  order = [];
  noFilter = true;
  filterBy;
  filterText;
  productsFilter = getFilteredProductsByCategory({ filter: undefined});
  productsFilterNew;

  connectedCallback() {
    this.productsFilter
        .then(value => {
            this.productsFilterNew = value
        });
      }

  handleClicked(event){
    this.filterBy = event.detail.filterby;
    this.filterText = event.detail.filtertext;

    if(this.filterBy == 'Category'){
      this.productsFilter = getFilteredProductsByCategory({ filter: this.filterText});
    } else if(this.filterBy == 'Color'){
      this.productsFilter = getFilteredProductsByColor({ filter: this.filterText});
    } else if(this.filterBy == 'Price' && !isNaN(this.filterText) || this.filterText==undefined){
      this.productsFilter = getFilteredProductsByPrice({ filter: this.filterText});
    }

    this.noFilter = false;

    this.connectedCallback();
  }

  addToCart(event){
    this.products.data.forEach(element => {
      if(element.ID__c == event.currentTarget.dataset.id){
        this.productsInCart.push(element);
        this.order.push(element);
      }
    });
  }

  sendRecords(){
    if(Array.isArray(this.order) && this.order.length){
      setOrder({products: this.order});
    }
  }
}