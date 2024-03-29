
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/18/2012 11:48:11
-- Generated from EDMX file: D:\Ewerton\ProjetosTeste\Projetos\EF_TESTE\RelatedEntities_EF\EF_TESTE\EF_TESTE\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [EF_TEST];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_FisioterapeutaPaciente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PacienteSet] DROP CONSTRAINT [FK_FisioterapeutaPaciente];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FisioterapeutaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FisioterapeutaSet];
GO
IF OBJECT_ID(N'[dbo].[PacienteSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PacienteSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'FisioterapeutaSet'
CREATE TABLE [dbo].[FisioterapeutaSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PacienteSet'
CREATE TABLE [dbo].[PacienteSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [FisioterapeutaId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'FisioterapeutaSet'
ALTER TABLE [dbo].[FisioterapeutaSet]
ADD CONSTRAINT [PK_FisioterapeutaSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PacienteSet'
ALTER TABLE [dbo].[PacienteSet]
ADD CONSTRAINT [PK_PacienteSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [FisioterapeutaId] in table 'PacienteSet'
ALTER TABLE [dbo].[PacienteSet]
ADD CONSTRAINT [FK_FisioterapeutaPaciente]
    FOREIGN KEY ([FisioterapeutaId])
    REFERENCES [dbo].[FisioterapeutaSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FisioterapeutaPaciente'
CREATE INDEX [IX_FK_FisioterapeutaPaciente]
ON [dbo].[PacienteSet]
    ([FisioterapeutaId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------