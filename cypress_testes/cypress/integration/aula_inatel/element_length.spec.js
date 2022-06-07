/// <reference types="cypress"/>

describe('Teste de tamanho de elementos', () => {

    it('Teste tamanho', () => { 
        cy.visit('https://www.rahulshettyacademy.com/AutomationPractice/');
        var tamanho = 0;
        cy.get('fieldset > #product > tbody >').then(($el) => { //elemento que quero contar
            const itemCount = Cypress.$($el).length;
            tamanho = itemCount;
            cy.log(tamanho);
            cy.get('fieldset > #product > tbody >').should('have.length', tamanho);
        })        
    });

});

