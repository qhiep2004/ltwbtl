namespace BTL
{
    public class Product
    {
        public int Id { get; set; }
        public string Ten { get; set; }
        public string Image { get; set; }
    
        public string Information { get; set; }

        public Product() { }

        public Product(int id, string ten, string image, string information)
        {
            Id = id;
            Ten = ten;
            Image = image;
        
            Information = information;
        }
    }
}
