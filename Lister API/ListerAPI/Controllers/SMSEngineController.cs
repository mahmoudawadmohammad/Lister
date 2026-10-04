using ListerAPI.Helpers;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ListerAPI.Controllers
{
    [Route("lister/[controller]")]
    [ApiController]
    public class SMSEngineController : ControllerBase
    {
        public SMSEngineController()
        {

        }

        [HttpGet("")]
        public string GetOTP([FromQuery] string Name, [FromQuery] string PhoneNumber)
        {
            Random rnd = new Random();
            int OTP = rnd.Next(100000, 999999);
            PhoneNumber = "+" + PhoneNumber;
            string massege = "Hi Mr.\\Ms. " + Name + " this is your One Time Password to confirm you phone in our App L-" + OTP.ToString();
            SMSEngine.SendSingleMessage(PhoneNumber, massege, "1502|0");
            return OTP.ToString();
        }
    }
}
