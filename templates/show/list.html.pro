<html>
  <head><title>List</title>
<body>
<TMPL_LOOP NAME="PAR">
	<TMPL_VAR NAME =name>=<TMPL_VAR NAME =value><br>
</TMPL_LOOP>
<hr>
<TMPL_LOOP NAME="ABC">
&nbsp;<TMPL_VAR NAME = SUB>
</TMPL_LOOP>
<hr>
<form action="fb.fcgi" method = "POST">
	<p>
	<input  type="text" size ="30" name="F">Фамилия<br>
	<input 	type="text" size ="30" name="N">Имя<br>
	<input 	type="text" size ="30" name="P">Отчество<br>
	</p>
	<input type="submit" name="SEARCH"  value = "Поиск"/>
</form>
<hr>
<table>
<TMPL_LOOP NAME="LIST">
		<tr>
		<td><a href=fb.fcgi?ID=<TMPL_VAR NAME = ID>><TMPL_VAR NAME = ID></a></td>
		<td><TMPL_VAR NAME = F></td><td><TMPL_VAR NAME = N></td><td><TMPL_VAR NAME = P></td>
		<td><TMPL_VAR NAME = ADR></td><td><TMPL_VAR NAME = BIRTHDATE></td>
		</tr>
</TMPL_LOOP>
<table>
<TMPL_LOOP NAME="MENU">
<TMPL_VAR NAME = PAGE>
</TMPL_LOOP>
<br>
<form action="fb.fcgi" method = "POST">
	<input type="submit" name="NEW"  value = "Создать"/>
</form>
</body>
</html>
