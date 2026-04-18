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

    [HttpGet("course/{courseId}")]
public async Task<IActionResult> GetTests(int courseId)
{
    var tests = await _context.Tests
        .Where(t => t.CourseId == courseId)
        .ToListAsync();

    var balls = await _context.Balls.ToListAsync();

    var result = tests.Select(t =>
    {
        var points = balls.FirstOrDefault(b => b.Id == t.Difficulty)?.Balls ?? 0;

        return new
        {
            id = t.Id,
            question = t.Questions,
            answer = t.Answer,
            difficulty = t.Difficulty,
            points
        };
    });

    return Ok(result);
}
    private string Normalize(string s)
        => s.Trim().ToLower().Replace(" ", "");
}

public class TestAnswerDto
{
    public int Id { get; set; }
    public string Answer { get; set; } = string.Empty;
}