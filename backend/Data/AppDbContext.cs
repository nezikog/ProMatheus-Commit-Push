using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options) { }

    public DbSet<Test> Tests => Set<Test>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Test>().ToTable("test");

        modelBuilder.Entity<Test>().Property(x => x.Id).HasColumnName("id");
        modelBuilder.Entity<Test>().Property(x => x.CourseId).HasColumnName("course_id");
        modelBuilder.Entity<Test>().Property(x => x.Questions).HasColumnName("questions");
        modelBuilder.Entity<Test>().Property(x => x.Answer).HasColumnName("answer");
        modelBuilder.Entity<Test>().Property(x => x.Difficulty).HasColumnName("difficulty");
    }
}