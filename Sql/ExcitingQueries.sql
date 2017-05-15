select Category, sum(Debit), sum(Credit), DATE_FORMAT(MyDate,'%b') Month, DATE_FORMAT(MyDate,'%y') Year from cashflows group by MONTH(MyDate), Category;

