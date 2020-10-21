

--====================================================================================================
DECLARE @PromotionName nvarchar( 100); DECLARE @PromotionID nvarchar( 50);
--########################
        SET @PromotionName = 'Five Finger Discount Unlimited';         SET @PromotionID = (select PromotionID from tblPromotion where PromotionName = @PromotionName);
--     SET @PromotionID = '1338';                                      SET @PromotionName = (select PromotionName from tblPromotion where PromotionID = @PromotionID);
--########################

select (@PromotionName ) AS PromotionName, (@PromotionID ) AS PromotionID, ('Product') AS Type,  (Description) AS Name, (ProductID) AS ID, ABS(-1 +discontinued) As Enabled
        from Products  
               where
                            ProductID IN( select ProductID   from tblPromotionProduct)
                      AND @PromotionID IN(select PromotionID from tblPromotionProduct)
                            UNION ALL

select (@PromotionName ) AS PromotionName, (@PromotionID ) AS PromotionID, ('Supplier') AS Type, (CompanyName) AS Name, (SupplierID) AS ID, (Active) As Enabled
        from suppliers
               where
                            SupplierID IN( select SupplierID from tblPromotionSupplier)
                      AND @PromotionID IN(select PromotionID from tblPromotionSupplier)
                            UNION ALL

select (@PromotionName ) AS PromotionName, (@PromotionID ) AS PromotionID, ('Category') AS Type, (CategoryName)      AS Name, (CategoryID) AS ID, (Active) As Enabled
        from categories
               where
                            CategoryID IN( select CategoryID from tblPromotionCategory)
                      AND @PromotionID IN(select PromotionID from tblPromotionCategory)
                            UNION ALL

select (@PromotionName ) AS PromotionName, (@PromotionID ) AS PromotionID, ('TypeGroup') AS Type, TypeName AS Name, (TypeGroup )   AS ID, (Active ) As Enabled
        from tblVisitTypes
               where
                            TypeGroup     IN( select TypeGroupID from tblPromotionTypeGroup)
                      AND @PromotionID IN(select PromotionID from tblPromotionTypeGroup)

--====================================================================================================
