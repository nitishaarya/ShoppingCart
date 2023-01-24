namespace BusinessLayer.Class
{
    public class OrderBusinessObject
    {
        public int userId
        {
            get;
            set;
        }
        public int itemId
        {
            get;
            set;
        }
        public int quantity
        {
            get;
            set;
        }
        public double paidAmount
        {
            get;
            set;
        }
        public string address
        {
            get;
            set;
        }
        public bool status
        {
            get;
            set;
        }
    }
}
