using backend.Data;
using backend.Models;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// 🔓 CORS (чтобы React мог обращаться к backend)
builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});

// 🗄️ Подключение к PostgreSQL
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseNpgsql(
        builder.Configuration.GetConnectionString("DefaultConnection")
    )
);

var app = builder.Build();

// включаем CORS
app.UseCors();


// ==========================
// 📡 API
// ==========================

// 🔹 Получить ВСЕ курсы
app.MapGet("/api/courses", async (AppDbContext db) =>
{
    var courses = await db.Courses.ToListAsync();
    return Results.Ok(courses);
});

// 🔹 Получить курс по id
app.MapGet("/api/courses/{id}", async (int id, AppDbContext db) =>
{
    var course = await db.Courses.FindAsync(id);

    if (course == null)
        return Results.NotFound("Курс не найден");

    return Results.Ok(course);
});

// 🔹 Добавить курс
app.MapPost("/api/courses", async (Course course, AppDbContext db) =>
{
    db.Courses.Add(course);
    await db.SaveChangesAsync();

    return Results.Ok(course);
});

// 🔹 Удалить курс
app.MapDelete("/api/courses/{id}", async (int id, AppDbContext db) =>
{
    var course = await db.Courses.FindAsync(id);

    if (course == null)
        return Results.NotFound("Курс не найден");

    db.Courses.Remove(course);
    await db.SaveChangesAsync();

    return Results.Ok("Удалено");
});


app.Run();