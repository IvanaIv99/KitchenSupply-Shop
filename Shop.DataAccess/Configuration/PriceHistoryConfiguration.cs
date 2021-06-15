using System;
using System.Collections.Generic;
using System.Text;
using Shop.Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Shop.DataAccess.Configuration
{
    class PriceHistoryConfiguration : IEntityTypeConfiguration<PriceHistory>
    {
        public void Configure(EntityTypeBuilder<PriceHistory> builder)
        {
            builder.Property(x => x.Price).IsRequired();
        }
    }
}
