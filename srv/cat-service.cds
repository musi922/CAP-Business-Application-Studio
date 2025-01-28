using sampleProject as db from '../db/schema';

service CatalogService {
  // ADMIN SECTION
  // Only admin can modify Users, but everyone can read
  @(restrict: [
    { grant: 'READ'},
    { grant: '*', to: 'Admin' }          // Only Admin can create/update/delete
  ])
  entity Users as projection on db.Users;

  @(restrict: [
    { grant: 'READ', to: ['Employee', 'User', 'Developer', 'Admin'] },                   // Everyone can read (no where clause needed)
    { grant: '*', to: 'Admin' }          // Only Admin can modify
  ])
  entity Products as projection on db.Products;

  // DEVELOPER SECTION
  // Only Developers and Admins can access Projects
  @(restrict: [
    { grant: 'READ', to: ['Developer', 'Admin'] },  // Both can read
    { grant: '*', to: 'Developer' }                 // Developer can modify
  ])
  entity Projects as projection on db.Projects;

  @(restrict: [
    { grant: 'READ', to: ['Developer', 'Admin'] },
    { grant: '*', to: 'Developer' }
  ])
  entity TestCases as projection on db.TestCases;

  // EMPLOYEE SECTION
  // Employees can see all tasks but only modify their own
  @(restrict: [
    { grant: 'READ', to: ['Employee', 'Admin'] },                    // Can read all tasks
    { grant: '*', where: 'assignedTo.userId = $user.id', to: 'Employee' }  // Can only modify their own
  ])
  entity Tasks as projection on db.Tasks;

  // USER SECTION
  // Users can only see and modify their own orders
  @(restrict: [
    { grant: 'READ', to: ['User', 'Admin'] },                     // User and Admin can read
    { grant: '*', where: 'user.userId = $user.id', to: 'User' }   // Users can only modify their own
  ])
  entity Orders as projection on db.Orders;

  // Same rules for Wishlist as Orders
  @(restrict: [
    { grant: 'READ', to: ['User', 'Admin'] },
    { grant: '*', where: 'user.userId = $user.id', to: 'User' }
  ])
  entity Wishlist as projection on db.Wishlist;
}