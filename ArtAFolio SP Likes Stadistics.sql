CREATE PROCEDURE sp_GetArtworkLikes
    @idArte INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Contar el número de likes de la obra de arte
    DECLARE @likeCount INT;
    SELECT @likeCount = COUNT(*)
    FROM ArtAFolio.Likes
    WHERE idArte = @idArte;

    -- Devolver el resultado
    SELECT @likeCount AS LikeCount;
END;
GO