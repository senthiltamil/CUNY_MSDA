
CREATE OR REPLACE FUNCTION convert_to_float(v_input text)
RETURNS FLOAT AS $$
DECLARE v_ret_value FLOAT DEFAULT NULL;
BEGIN
    BEGIN
	v_input = replace(v_input, '*','');
        v_ret_value := v_input::FLOAT;
    EXCEPTION WHEN OTHERS THEN
        RETURN NULL;
    END;
RETURN v_ret_value;
END;
$$ LANGUAGE plpgsql;

------------------------------------------------------------------

drop table if exists PublicDataImport;

create table if not exists PublicDataImport
(
	DBN			CHAR(6) NOT NULL,
	Name			varchar(100)  NULL,
	SchoolYear		char(9)  NULL,
	FreeLunchPer			varchar(10) null,
	FreeReducedPriceLunchPer	varchar(10) null,
	TotalEnrollment			varchar(10)  null,
	Prek			varchar(10) null,
	K			varchar(10) null,
	Grade1			varchar(10) null,
	Grade2			varchar(10) null,
	Grade3			varchar(10) null,
	Grade4			varchar(10) null,
	Grade5			varchar(10) null,
	Grade6			varchar(10) null,
	Grade7			varchar(10) null,
	Grade8			varchar(10) null,
	Grade9			varchar(10) null,
	Grade10			varchar(10) null,
	Grade11			varchar(10) null,
	Grade12			varchar(10) null,
	Ell			varchar(10) null,
	EllPer			varchar(10) null,
	Sped			varchar(10) null,
	SpedPer			varchar(10) null,
	CTT			varchar(10) null,
	SelfContained			varchar(10) null,
	Asian			varchar(10) null,
	AsianPer			varchar(10) null,
	Black			varchar(10) null,
	BlackPer			varchar(10) null,
	Hispanic			varchar(10) null,
	HispanicPer			varchar(10) null,
	White			varchar(10) null,
	WhitePer		varchar(10) null,
	Male			varchar(10) null,
	MalePer			varchar(10) null,
	Female			varchar(10) null,
	FemalePer			varchar(10) null
);	

COPY PublicDataImport FROM 'E:/MSDataAnalytics/GitHub/CUNY_MSDA/IS607_Project1/2013-demographic-snapshotpublic.csv' DELIMITER ',' CSV HEADER;

drop table if exists DemographicData;

create table if not exists DemographicData
(
	DBN			CHAR(6) NOT NULL,
	Name			varchar(100)  NULL,
	SchoolYear		char(9)  NULL,
	FreeLunchPer			float null,
	FreeReducedPriceLunchPer	float null,
	TotalEnrollment			float  null,
	Prek			float null,
	K			float null,
	Grade1			float null,
	Grade2			float null,
	Grade3			float null,
	Grade4			float null,
	Grade5			float null,
	Grade6			float null,
	Grade7			float null,
	Grade8			float null,
	Grade9			float null,
	Grade10			float null,
	Grade11			float null,
	Grade12			float null,
	Ell			float null,
	EllPer			float null,
	Sped			float null,
	SpedPer			float null,
	CTT			float null,
	SelfContained			float null,
	Asian			float null,
	AsianPer			float null,
	Black			float null,
	BlackPer			float null,
	Hispanic			float null,
	HispanicPer			float null,
	White			float null,
	WhitePer		float null,
	Male			float null,
	MalePer			float null,
	Female			float null,
	FemalePer			float null
);	


--select * from PublicDataImport limit 1000;

-- Truncate table DemographicData
Insert into DemographicData (DBN, Name, SchoolYear, FreeLunchPer, FreeReducedPriceLunchPer, TotalEnrollment, Prek, K, Grade1, Grade2, Grade3, Grade4, Grade5, Grade6, Grade7, Grade8, Grade9, Grade10, Grade11,
				Grade12, Ell, EllPer, Sped, SpedPer, CTT, SelfContained, Asian, AsianPer, Black, BlackPer, Hispanic, HispanicPer, White, WhitePer, Male, MalePer, Female, FemalePer)
				
select 				DBN, Name, SchoolYear, 
				convert_to_float(freelunchper),
				convert_to_float(freereducedpricelunchper),
				convert_to_float(totalenrollment),
				convert_to_float(prek),
				convert_to_float(k),
				convert_to_float(Grade1),
				convert_to_float(Grade2),
				convert_to_float(Grade3),
				convert_to_float(Grade4),
				convert_to_float(Grade5),
				convert_to_float(Grade6),
				convert_to_float(Grade7),
				convert_to_float(Grade8),
				convert_to_float(Grade9),
				convert_to_float(Grade10),
				convert_to_float(Grade11),
				convert_to_float(Grade12),
				convert_to_float(Ell),
				convert_to_float(EllPer),
				convert_to_float(Sped),
				convert_to_float(SpedPer),
				convert_to_float(CTT),
				convert_to_float(SelfContained),
				convert_to_float(Asian),
				convert_to_float(AsianPer),
				convert_to_float(Black),
				convert_to_float(BlackPer),
				convert_to_float(Hispanic),
				convert_to_float(HispanicPer),
				convert_to_float(White),
				convert_to_float(WhitePer),
				convert_to_float(Male),
				convert_to_float(MalePer),
				convert_to_float(Female),
				convert_to_float(FemalePer)
from 	PublicDataImport;

select * from PublicDataImport limit 1000;
select * from DemographicData limit 1000;