CREATE PROCEDURE sp_GetUserStatistics
    @idUsuario VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;

    -- Contar el número de galerías del usuario
    DECLARE @galleryCount INT;
    SELECT @galleryCount = COUNT(*)
    FROM ArtAFolio.Galerias
    WHERE idUsuario = @idUsuario;

    -- Contar el número de ilustraciones del usuario (IsAnimation = 0)
    DECLARE @illustrationCount INT;
    SELECT @illustrationCount = COUNT(*)
    FROM ArtAFolio.Artes
    WHERE idUsuario = @idUsuario AND IsAnimation = '0';

    -- Contar el número de animaciones del usuario (IsAnimation = 1)
    DECLARE @animationCount INT;
    SELECT @animationCount = COUNT(*)
    FROM ArtAFolio.Artes
    WHERE idUsuario = @idUsuario AND IsAnimation = '1';

    -- Devolver los resultados
    SELECT 
        @galleryCount AS GalleryCount,
        @illustrationCount AS IllustrationCount,
        @animationCount AS AnimationCount;
END;
GO