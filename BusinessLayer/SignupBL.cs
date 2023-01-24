using BusinessLayer.Class;
using DataLayer;
using DataLayer.Class;

namespace BusinessLayer
{

    public class SignupBL
    {
        SignupDL signupDl = new SignupDL();
        public int insertDetails(UserBusinessObject ubo)
        {
            UserDataObject udo = new UserDataObject();
            udo.firstName = ubo.fName;
            udo.lastName = ubo.lName;
            udo.email = ubo.email;
            udo.mobile = ubo.mobile;
            udo.gender = ubo.gender;
            udo.dob = ubo.dob;
            udo.address1 = ubo.address1;
            udo.address2 = ubo.address2;
            udo.city = ubo.city;
            udo.state = ubo.state;
            udo.pin = ubo.pin;
            udo.password = ubo.password;
            int status = signupDl.UserSignup(udo);
            return status;
        }
        public int checkEmail(string email)
        {
            return signupDl.checkEmail(email);
        }
        public int checkSecurity(string email)
        {
            return signupDl.checkSecurity(email);
        }
        public int updatePassword(string email,string password)
        {
            return signupDl.updatePassword(email,password);
        }
    }
}
