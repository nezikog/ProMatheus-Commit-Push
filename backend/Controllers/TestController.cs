using backend.Data;
using backend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace backend.Controllers;

[ApiController]
[Route("api/tests")]
public class TestController : ControllerBase
{
    private readonly AppDbContext _context;

    public TestController(AppDbContext context)
    {
        _context = context;
    }

    // GET: api/tests/course/1
    [HttpGet("course/{courseId}")]
    public async Task<IActionResult> GetTests(int courseId)
    {
        var tests = await _context.Tests
            .Where(t => t.CourseId == courseId)
            .ToListAsync();

        return Ok(tests);
    }

    // POST: api/tests/submit
    [HttpPost("submit")]
    public async Task<IActionResult> Submit(List<TestAnswerDto> answers)
    {
        int score = 0;
        int max = 0;

        foreach (var a in answers)
        {
            var test = await _context.Tests.FindAsync(a.Id);
            if (test == null) continue;

            max += test.Difficulty;

            if (Normalize(a.Answer) == Normalize(test.Answer))
                score += test.Difficulty;
        }

        return Ok(new { score, max });
    }

    private string Normalize(string s)
        => s.Trim().ToLower().Replace(" ", "");
}

public class TestAnswerDto
{
    public int Id { get; set; }
    public string Answer { get; set; } = string.Empty;
}