USE [ZooAzureDBSPRA]
GO
/****** Object:  Table [dbo].[Clasificaciones]    Script Date: 06/07/2017 18:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificaciones](
	[idClasificacion] [int] NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clasificaciones] PRIMARY KEY CLUSTERED 
(
	[idClasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Especies]    Script Date: 06/07/2017 18:08:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especies](
	[idEspecie] [bigint] IDENTITY(1,1) NOT NULL,
	[idClasificacion] [int] NOT NULL,
	[idTipoAnimal] [bigint] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[nPatas] [smallint] NOT NULL,
	[esMascota] [bit] NULL,
 CONSTRAINT [PK_Especies] PRIMARY KEY CLUSTERED 
(
	[idEspecie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[TiposAnimal]    Script Date: 06/07/2017 18:08:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposAnimal](
	[idTipoAnimal] [bigint] NOT NULL,
	[denominacion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TiposAnimal] PRIMARY KEY CLUSTERED 
(
	[idTipoAnimal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
INSERT [dbo].[Clasificaciones] ([idClasificacion], [denominacion]) VALUES (1, N'Mamíferos')
INSERT [dbo].[Clasificaciones] ([idClasificacion], [denominacion]) VALUES (2, N'Aves')
INSERT [dbo].[Clasificaciones] ([idClasificacion], [denominacion]) VALUES (3, N'Reptiles')
SET IDENTITY_INSERT [dbo].[Especies] ON 

INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (10, 1, 1, N'Vaca', 4, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (11, 1, 1, N'Caballo', 4, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (12, 1, 1, N'Conejo', 4, 1)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (19, 3, 3, N'Delfín', 0, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (20, 2, 1, N'Paloma', 2, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (21, 2, 1, N'Aguila', 2, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (22, 2, 1, N'Canario', 2, 1)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (23, 3, 1, N'Cocodrilo', 4, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (24, 3, 1, N'Salamandra', 4, 0)
INSERT [dbo].[Especies] ([idEspecie], [idClasificacion], [idTipoAnimal], [nombre], [nPatas], [esMascota]) VALUES (25, 3, 2, N'Serpiente', 0, 0)
SET IDENTITY_INSERT [dbo].[Especies] OFF
INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (1, N'Vertebrado')
INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (2, N'Invertebrado')
INSERT [dbo].[TiposAnimal] ([idTipoAnimal], [denominacion]) VALUES (3, N'Acuáticos')
ALTER TABLE [dbo].[Especies] ADD  CONSTRAINT [DF_Especies_nPatas]  DEFAULT ((4)) FOR [nPatas]
GO
ALTER TABLE [dbo].[Especies]  WITH CHECK ADD  CONSTRAINT [FK_Especies_Clasificaciones] FOREIGN KEY([idClasificacion])
REFERENCES [dbo].[Clasificaciones] ([idClasificacion])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Especies] CHECK CONSTRAINT [FK_Especies_Clasificaciones]
GO
ALTER TABLE [dbo].[Especies]  WITH CHECK ADD  CONSTRAINT [FK_Especies_Especies] FOREIGN KEY([idEspecie])
REFERENCES [dbo].[Especies] ([idEspecie])
GO
ALTER TABLE [dbo].[Especies] CHECK CONSTRAINT [FK_Especies_Especies]
GO
ALTER TABLE [dbo].[Especies]  WITH CHECK ADD  CONSTRAINT [FK_Especies_TiposAnimal] FOREIGN KEY([idTipoAnimal])
REFERENCES [dbo].[TiposAnimal] ([idTipoAnimal])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Especies] CHECK CONSTRAINT [FK_Especies_TiposAnimal]
GO
ALTER TABLE [dbo].[TiposAnimal]  WITH CHECK ADD  CONSTRAINT [FK_TiposAnimal_TiposAnimal] FOREIGN KEY([idTipoAnimal])
REFERENCES [dbo].[TiposAnimal] ([idTipoAnimal])
GO
ALTER TABLE [dbo].[TiposAnimal] CHECK CONSTRAINT [FK_TiposAnimal_TiposAnimal]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarClasificacion]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarClasificacion]
	@id bigint
	,@denominacion nvarchar(50)
AS
BEGIN
	UPDATE Clasificaciones SET 
		denominacion = @denominacion
		WHERE idClasificacion = @id
END

GO
/****** Object:  StoredProcedure [dbo].[ActualizarEspecie]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarEspecie]
	@id bigint
	,@nombre nvarchar(50)
AS
BEGIN
	UPDATE Especies SET 
		nombre = @nombre
		WHERE idEspecie = @id
END

GO
/****** Object:  StoredProcedure [dbo].[ActualizarTiposAnimales]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarTiposAnimales]
	@id bigint
	,@denominacion nvarchar(50)
AS
BEGIN
	UPDATE TiposAnimal SET 
		denominacion = @denominacion
		WHERE idTipoAnimal = @id
END

GO
/****** Object:  StoredProcedure [dbo].[AgregarClasificacion]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarClasificacion]
	@denominacion nvarchar(50)
AS
BEGIN
	INSERT INTO Clasificaciones(denominacion) VALUES (@denominacion)
END

GO
/****** Object:  StoredProcedure [dbo].[AgregarEspecie]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarEspecie]
	@nombre nvarchar(50)
AS
BEGIN
	INSERT INTO Especies(nombre) VALUES (@nombre)
END

GO
/****** Object:  StoredProcedure [dbo].[AgregarTipoAnimal]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarTipoAnimal]
	@denominacion nvarchar(50)
AS
BEGIN
	INSERT INTO TiposAnimal(denominacion) VALUES (@denominacion)
END

GO
/****** Object:  StoredProcedure [dbo].[EliminarClasificacion]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarClasificacion]
	@id bigint
AS
BEGIN
	DELETE FROM Clasificaciones WHERE idClasificacion = @id
END

GO
/****** Object:  StoredProcedure [dbo].[EliminarEspecie]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarEspecie]
	@id bigint
AS
BEGIN
	DELETE FROM Especies WHERE idEspecie = @id
END

GO
/****** Object:  StoredProcedure [dbo].[EliminarTipoAnimal]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarTipoAnimal]
	@id bigint
AS
BEGIN
	DELETE FROM TiposAnimal WHERE idTipoAnimal = @id
END

GO
/****** Object:  StoredProcedure [dbo].[GetClasificacion]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClasificacion]
AS
BEGIN
    SELECT idClasificacion, denominacion
    FROM Clasificaciones
END

GO
/****** Object:  StoredProcedure [dbo].[GetClasificacionPorId]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClasificacionPorId]
	@idClasificacion bigint
AS
BEGIN
    SELECT denominacion, idClasificacion
    FROM Clasificaciones
    WHERE Clasificaciones.idClasificacion = @idClasificacion
END

GO
/****** Object:  StoredProcedure [dbo].[GetEspecies]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEspecies]
AS
BEGIN
	SELECT  
	Especies.idEspecie 
	, Especies.nombre as NombreEspecie
	, Especies.idClasificacion 
	, Clasificaciones.denominacion as Clasificacion
	, Especies.idTipoAnimal
	, TiposAnimal.denominacion as TipoAnimal
	, Especies.nPatas
	, Especies.esMascota
	FROM Clasificaciones
		INNER JOIN Especies ON Clasificaciones.idClasificacion = Especies.idClasificacion
		INNER JOIN TiposAnimal ON Especies.idTipoAnimal = TiposAnimal.idTipoAnimal
	ORDER BY Especies.nombre
END

GO
/****** Object:  StoredProcedure [dbo].[GetEspeciesPorId]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEspeciesPorId]
	@idEspecie bigint
AS
BEGIN
	SELECT  
	Especies.idEspecie 
	, Especies.nombre as NombreEspecie
	, Especies.idClasificacion 
	, Clasificaciones.denominacion as Clasificacion
	, Especies.idTipoAnimal
	, TiposAnimal.denominacion as TipoAnimal
	, Especies.nPatas
	, Especies.esMascota
	FROM Clasificaciones
		INNER JOIN Especies ON Clasificaciones.idClasificacion = Especies.idClasificacion
		INNER JOIN TiposAnimal ON Especies.idTipoAnimal = TiposAnimal.idTipoAnimal
	WHERE Especies.idEspecie = @idEspecie
	ORDER BY Especies.nombre
END

GO
/****** Object:  StoredProcedure [dbo].[GetTiposAnimales]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTiposAnimales]
AS
BEGIN
    SELECT idTipoAnimal, denominacion
    FROM TiposAnimal
END

GO
/****** Object:  StoredProcedure [dbo].[GetTiposAnimalesPorId]    Script Date: 06/07/2017 18:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTiposAnimalesPorId]
	@idTipoAnimal bigint
AS
BEGIN
    SELECT denominacion, idTipoAnimal
    FROM TiposAnimal
    WHERE TiposAnimal.idTipoAnimal = @idTipoAnimal
END

GO
