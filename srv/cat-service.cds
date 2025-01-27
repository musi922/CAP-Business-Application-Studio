using sampleProject as my from '../db/schema';

service CatalogService {
    @readonly entity Products as projection on my.Products;
}
