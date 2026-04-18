using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using backend.Data;
using backend.Models;

namespace backend.Controllers
{
    [Route("api/test")]
    [ApiController]
    public class TestController : ControllerBase
    {
        private readonly ApplicationDbContext _context;  // Измени на ApplicationDbContext

        public TestController(ApplicationDbContext context)  // Измени на ApplicationDbContext
        {
            _context = context;
        }
        
        // Остальной код без изменений...
    }
}