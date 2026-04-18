using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using backend.Data;
using backend.Models;

namespace backend.Controllers
{
    [Route("api/lessons")]
    [ApiController]
    public class LessonController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public LessonController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet("{courseId}/{classId}")]
        public async Task<IActionResult> GetLessons(int courseId, int classId)
        {
            var lessons = await _context.Lessons
                .Where(t => t.CourseId == courseId && t.ClassId == classId)
                .FirstOrDefaultAsync();

            return Ok(new { lessons });
        }
    }
}