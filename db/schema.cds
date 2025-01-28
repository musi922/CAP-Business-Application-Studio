namespace sampleProject;
using { managed, cuid } from '@sap/cds/common';

entity Users : managed, cuid {
  name        : String;
  role        : String enum {
    admin; employee; user; developer;
  };
  status      : String;
  email       : String;
}
entity Products : managed, cuid {
  name        : String;
  description : String;
  category    : String;
  price       : Decimal;
  stock       : Integer;
}
entity Orders : managed, cuid {
  user        : Association to Users;
  items       : Composition of many {
    product   : Association to Products;
    quantity  : Integer;
    price     : Decimal;
  };
  status      : String;
  totalAmount : Decimal;
}
entity Tasks : managed, cuid {
  taskName    : String;
  description : String;
  assignedTo  : Association to Users;
  status      : String;
  dueDate     : Date;
}

entity Projects : managed, cuid {
  projectName : String;
  description : String;
  status      : String;
  lead        : Association to Users;
  team        : Composition of many {
    member    : Association to Users;
    role      : String;
  };
}

entity TestCases : managed, cuid {
  description : String;
  status      : String;
  project     : Association to Projects;
}

entity Wishlist : managed, cuid {
  user        : Association to Users;
  product     : Association to Products;
}