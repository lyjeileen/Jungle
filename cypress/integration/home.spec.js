describe('Testing Home page', () => {
  beforeEach(() => {
    cy.visit('/');
  });
  it('There is products on the page', () => {
    cy.get('.products article').should('be.visible');
  });
});
