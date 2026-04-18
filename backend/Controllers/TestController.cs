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
        private readonly ApplicationDbContext _context;

        public TestController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/test/{courseId}/{classId}
        [HttpGet("{lessonId}")]
        public async Task<IActionResult> GetTests(int lessonId)
        {
            var tests = await _context.Tests
                .Where(t => t.LessonId == lessonId)
                .ToListAsync();

            return Ok(new { tests });
        }

        // POST: api/test/submit
        [HttpPost("submit")]
        public async Task<IActionResult> Submit(List<TestAnswerDto> answers)
        {
            int score = 0;
            int max = 0;

            foreach (var a in answers)
            {
                var test = await _context.Tests.FindAsync(a.TestId);
                if (test == null) continue;

                max += test.Difficulty;

                if (Normalize(a.UserAnswer) == Normalize(test.Answer))
                    score += test.Difficulty;
            }

            return Ok(new { score, max });
        }

        private string Normalize(string s)
            => (s ?? "").Trim().ToLower().Replace(" ", "");
    }
}