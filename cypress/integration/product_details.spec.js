describe('Testing Product page', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('Redirect to product page if you click on a single product', () => {
    cy.get('.products article')
      .first()
      .click()
      .get('.product-detail')
      .contains('Scented Blade');
  });
});
