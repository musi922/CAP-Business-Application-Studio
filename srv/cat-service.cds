using sampleProject as db from '../db/schema';

service CatalogService {
// Admin access
  @(restrict: [
    { grant: 'READ', where: 'true' },
    { grant: '*', to: 'Admin' }
  ])
  entity Users as projection on db.Users;

  @(restrict: [
    { grant: 'READ', where: 'true' },
    { grant: '*', to: 'Admin' }
  ])
  entity Products as projection on db.Products;

  // Developer access
  @(restrict: [
    { grant: 'READ', to: ['Developer', 'Admin'] },
    { grant: '*', to: 'Developer' }
  ])
  entity Projects as projection on db.Projects;

  @(restrict: [
    { grant: 'READ', to: ['Developer', 'Admin'] },
    { grant: '*', to: 'Developer' }
  ])
  entity TestCases as projection on db.TestCases;

  // Employee access
  @(restrict: [
    { grant: 'READ', to: ['Employee', 'Admin'] },
    { grant: '*', where: 'assignedTo.userId = $user.id', to: 'Employee' }
  ])
  entity Tasks as projection on db.Tasks;

  // User access
  @(restrict: [
    { grant: 'READ', to: ['User', 'Admin'] },
    { grant: '*', where: 'user.userId = $user.id', to: 'User' }
  ])
  entity Orders as projection on db.Orders;

  @(restrict: [
    { grant: 'READ', to: ['User', 'Admin'] },
    { grant: '*', where: 'user.userId = $user.id', to: 'User' }
  ])
  entity Wishlist as projection on db.Wishlist;
}
