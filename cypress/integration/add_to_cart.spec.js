describe('Testing Add To Cart Buttons', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('There is products on the page', () => {
    cy.get('.products article').should('be.visible');
  });

  it('Items could be added to the cart', () => {
    cy.get('.nav-item').contains('Cart').contains('0');
    cy.get('.products article').contains('Add').first().click({ force: true });
    cy.get('.nav-item').contains('Cart').contains('1');
  });
});
