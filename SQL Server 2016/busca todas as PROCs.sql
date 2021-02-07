declare @Nome as table(
	Id int identity(1,1),
	Nome nvarchar (250)
)

insert @Nome(Nome)
select [name]
from sys.objects
where type = 'P'

Declare @cont int, @IdAtual int, @NomeAtual nvarchar(max);

select @cont = count(nome) from @Nome;

while(@cont > 0)
BEGIN
	select top 1 
	@IdAtual = Id,
	@NomeAtual = Nome
	from @Nome

	exec sp_helptext @objname=@NomeAtual;

	delete from @Nome where Id =@IdAtual;
	set @cont = @cont - 1; 
END
