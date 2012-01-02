ignore_column = [ "carrier" ];
result_column = [ "tariff", "sec" , "action_deduct" ];
function convert(fileName)
{
	var fp = fopen(fileName, "r");
	try
	{
		var line;
		var columns;


		var file = new java.io.File(fileName);
		var temp = file.getName();

		var ruleName;
		if(temp.lastIndexOf(".")>0)
		{
			ruleName = temp.substr(0 , temp.lastIndexOf("."));
			if(file.getParent()!=null)
			{
				temp = file.getParent() + "/"+ ruleName + ".rule";
			}
			else
			{
				temp = ruleName  + ".rule";
			}
			uaLog.info("rule file name = %s", temp);
		}
		else
		{
			ruleName = file.getName();
			temp = fileName + ".rule";
		}

		var header = fp.readLine();
		columns = header.split(",");

		var output = fopen( temp  , "w");

		try
		{
			output.println("[RULESET_%s]", ruleName.toUpperCase());
			for(var i=0;i<columns.length;i++)
			{
				if(ignore_column.indexOf(columns[i])>=0)
					continue;

				if(result_column.indexOf(columns[i])>=0)
				{
					output.println("%s , string(64) , result", columns[i]);
				}
				else
				{
					output.println("%s , string(64)", columns[i]);
				}

			}

			output.println();

			output.println("[%s]" , ruleName.toUpperCase());


			var count = 0;
			while((line = fp.readLine())!=null)
			{
				var factors = line.split(",");
				output.printf("rule_%d : ", count++);

				var isFirst = true;
				for(var i=0;i<columns.length;i++)
				{
					if(ignore_column.indexOf(columns[i])>=0)
						continue;

					if(factors[i]!=null && factors[i]!="")
					{
						if(!isFirst)
						{
							output.printf(" , ");
						}
						if(columns[i].indexOf("prefix")>=0)
						{
							output.printf("%s starts %s" , columns[i] , factors[i]);
						}
						else
						{
							output.printf("%s = %s" , columns[i] , factors[i]);
						}
						isFirst = false;
					}
				}
				output.println();
			}
		}
		finally
		{
			output.close();
		}
	}
	finally
	{
		fp.close();
	}
}

function main(args)
{
	if(args.length < 2 )
	{
		uaLog.info("usage : js %s files ... ");
		return;	
	}
	for(var i=1;i<args.length;i++)
	{
		if(new java.io.File(args[i]).isDirectory())
		{
			var files = com.uangel.ualib.syslib.Ls.ls(args[i], "csv");
			for(var j=0;j<files.length;j++)
			{
				convert(files[j]);
			}
		}
		else
		{
			convert(args[i]);
		}
	}
}
