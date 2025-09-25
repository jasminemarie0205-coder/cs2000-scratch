use context dcic2024
fun add-tax(t:: Table) -> Table:
  doc:"Adds new column with tax amount"
  build-column(t, "tax", lam(r:: Row) -> Number:
      t.row-n(r) * 0.06
    end )

where:
test-table=
    table: price
      row: 50
      row: 120
      row: 80
      row: 40
        #  sanitize price using num-sanitizer
    end
          
add-tax(test-table) is
  table: tax
row: 50 * 1.06
row: 120 * 1.06
    row: 80 * 1.06
    row: 40 * 1.06
  end
end

