IF (EXISTS(
    SELECT * 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME = 'jurisdiction_lookup' 
    AND TABLE_SCHEMA = 'infohub'
))
   DROP TABLE [infohub].[jurisdiction_lookup];

CREATE TABLE [infohub].[jurisdiction_lookup] (
    [Jurisdiction] VARCHAR(255),
    [Jurisdiction_Abbreviation] VARCHAR(255),
    [Jurisdiction_Type] VARCHAR(255)
);

INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Alabama', 'AL', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Alaska', 'AK', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('American Samoa', 'AS', 'Territory');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Arizona', 'AZ', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Arkansas', 'AR', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('California', 'CA', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Chicago', 'CHI', 'City');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Colorado', 'CO', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Connecticut', 'CT', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Delaware', 'DE', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('District Of Columbia', 'DC', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Federated States of Micronesia', 'FM', 'Territory');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Florida', 'FL', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Georgia', 'GA', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Guam', 'GU', 'Territory');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Hawaii', 'HI', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Houston', 'HOU', 'City');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Idaho', 'ID', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Illinois', 'IL', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Indiana', 'IN', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Iowa', 'IA', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Kansas', 'KS', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Kentucky', 'KY', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Los Angeles County', 'LAC', 'County');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Louisiana', 'LA', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Maine', 'ME', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Marshall Islands', 'MH', 'Territory');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Maryland', 'MD', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Massachusetts', 'MA', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Michigan', 'MI', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Minnesota', 'MN', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Mississippi', 'MS', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Missouri', 'MO', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Montana', 'MT', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Nebraska', 'NE', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Nevada', 'NV', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('New Hampshire', 'NH', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('New Jersey', 'NJ', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('New Mexico', 'NM', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('New York', 'NY', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('New York City', 'NYC', 'City');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('North Carolina', 'NC', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('North Dakota', 'ND', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Northern Mariana Islands', 'MP', 'Territory');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Ohio', 'OH', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Oklahoma', 'OK', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Oregon', 'OR', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Palau', 'PW', 'Territory');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Pennsylvania', 'PA', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Philadelphia', 'PHL', 'City');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Puerto Rico', 'PR', 'Territory');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Rhode Island', 'RI', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('South Carolina', 'SC', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('South Dakota', 'SD', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Tennessee', 'TN', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Texas', 'TX', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('U.S. Virgin Islands', 'VI', 'Territory');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Utah', 'UT', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Vermont', 'VT', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Virginia', 'VA', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Washington', 'WA', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('West Virginia', 'WV', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Wisconsin', 'WI', 'State/DC');
INSERT INTO [infohub].[jurisdiction_lookup] ([Jurisdiction], [Jurisdiction_Abbreviation], [Jurisdiction_Type]) VALUES ('Wyoming', 'WY', 'State/DC');


SELECT * FROM [infohub].[jurisdiction_lookup];
