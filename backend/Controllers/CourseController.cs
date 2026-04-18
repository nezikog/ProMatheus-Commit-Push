using Microsoft.AspNetCore.Mvc;
using backend.Data;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers
{
    [Route("api/user")]
    [ApiController]
    public class CourseController : ControllerBase
    {
        private readonly ApplicationDbContext _context;
        
        public CourseController(ApplicationDbContext context)
        {
            _context = context;
        }
        
        [HttpGet("get-courses")]
        public async Task<IActionResult> GetCourses()
        {
            try
            {
                // Используем имена колонок в нижнем регистре, как в БД
                var courses = await _context.Courses
                    .Select(c => new { 
                        Id = c.Id,  // EF Core сам сопоставит с column("id")
                        Name = c.Name,
                        Path = c.Path,
                        Img = c.Img
                    })
                    .ToListAsync();
                    
                return Ok(courses);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return StatusCode(500, new { error = ex.Message });
            }
        }
    }
}