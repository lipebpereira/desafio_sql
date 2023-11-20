-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema desafio_sql
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `desafio_sql` ;

-- -----------------------------------------------------
-- Schema desafio_sql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `desafio_sql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `desafio_sql` ;

-- -----------------------------------------------------
-- Table `desafio_sql`.`categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_sql`.`categoria` ;

CREATE TABLE IF NOT EXISTS `desafio_sql`.`categoria` (
  `CategoriaID` INT NOT NULL,
  `Categoria` TEXT NULL DEFAULT NULL,
  `Departamento` TEXT NULL DEFAULT NULL,
  `Descricao` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`CategoriaID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `desafio_sql`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_sql`.`cliente` ;

CREATE TABLE IF NOT EXISTS `desafio_sql`.`cliente` (
  `ClienteID` INT NOT NULL,
  `ClienteNm` TEXT NULL DEFAULT NULL,
  `ClienteContato` TEXT NULL DEFAULT NULL,
  `ClienteEndereco` TEXT NULL DEFAULT NULL,
  `ClienteCidade` TEXT NULL DEFAULT NULL,
  `ClientePais` TEXT NULL DEFAULT NULL,
  `ClientePaisCodigo` TEXT NULL DEFAULT NULL,
  `ClienteRegiao` TEXT NULL DEFAULT NULL,
  `ClienteCEP` TEXT NULL DEFAULT NULL,
  `ClienteLatitude` TEXT NULL DEFAULT NULL,
  `ClienteLongitude` TEXT NULL DEFAULT NULL,
  `ClienteFax` TEXT NULL DEFAULT NULL,
  `ClienteTelefone` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ClienteID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `desafio_sql`.`fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_sql`.`fornecedor` ;

CREATE TABLE IF NOT EXISTS `desafio_sql`.`fornecedor` (
  `FornecedorID` INT NOT NULL,
  `Fornecedor` TEXT NULL DEFAULT NULL,
  `FornecedorContato` TEXT NULL DEFAULT NULL,
  `FornecedorPais` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`FornecedorID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `desafio_sql`.`produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_sql`.`produto` ;

CREATE TABLE IF NOT EXISTS `desafio_sql`.`produto` (
  `ProdutoID` INT NOT NULL,
  `CategoriaID` INT NULL DEFAULT NULL,
  `Produto` TEXT NULL DEFAULT NULL,
  `FornecedorID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ProdutoID`),
  CONSTRAINT `categoriaID`
    FOREIGN KEY (`CategoriaID`)
    REFERENCES `desafio_sql`.`categoria` (`CategoriaID`),
  CONSTRAINT `fornecedorID`
    FOREIGN KEY (`FornecedorID`)
    REFERENCES `desafio_sql`.`fornecedor` (`FornecedorID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `categoriaID_idx` ON `desafio_sql`.`produto` (`CategoriaID` ASC) VISIBLE;

CREATE INDEX `fornecedorID_idx` ON `desafio_sql`.`produto` (`FornecedorID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `desafio_sql`.`cupom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_sql`.`cupom` ;

CREATE TABLE IF NOT EXISTS `desafio_sql`.`cupom` (
  `CupomID` INT NOT NULL,
  `ProdutoID` INT NOT NULL,
  `Quantidade` INT NULL DEFAULT NULL,
  `Valor` TEXT NULL DEFAULT NULL,
  `Desconto` TEXT NULL DEFAULT NULL,
  `Custo` TEXT NULL DEFAULT NULL,
  `ValorLiquido` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`CupomID`, `ProdutoID`),
  CONSTRAINT `produtoID`
    FOREIGN KEY (`ProdutoID`)
    REFERENCES `desafio_sql`.`produto` (`ProdutoID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `produtoID_idx` ON `desafio_sql`.`cupom` (`ProdutoID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `desafio_sql`.`escritorio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_sql`.`escritorio` ;

CREATE TABLE IF NOT EXISTS `desafio_sql`.`escritorio` (
  `EscritorioID` INT NOT NULL,
  `EscritorioLocalizacao` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`EscritorioID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `desafio_sql`.`funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_sql`.`funcionario` ;

CREATE TABLE IF NOT EXISTS `desafio_sql`.`funcionario` (
  `FuncionarioID` INT NOT NULL,
  `Extensao` INT NULL DEFAULT NULL,
  `NomeFuncionario` TEXT NULL DEFAULT NULL,
  `Genero` TEXT NULL DEFAULT NULL,
  `DataAdmissao` TEXT NULL DEFAULT NULL,
  `EscritorioID` INT NULL DEFAULT NULL,
  `Supervisor` TEXT NULL DEFAULT NULL,
  `Cargo` TEXT NULL DEFAULT NULL,
  `SalarioAnual` INT NULL DEFAULT NULL,
  `MetaVendas` INT NULL DEFAULT NULL,
  PRIMARY KEY (`FuncionarioID`),
  CONSTRAINT `escritorioID`
    FOREIGN KEY (`EscritorioID`)
    REFERENCES `desafio_sql`.`escritorio` (`EscritorioID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `escritorioID_idx` ON `desafio_sql`.`funcionario` (`EscritorioID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `desafio_sql`.`venda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_sql`.`venda` ;

CREATE TABLE IF NOT EXISTS `desafio_sql`.`venda` (
  `ClienteID` INT NOT NULL,
  `FuncionarioID` INT NULL DEFAULT NULL,
  `ValorFrete` DOUBLE NULL DEFAULT NULL,
  `CupomID` INT NULL DEFAULT NULL,
  `EmpresaFrete` TEXT NULL DEFAULT NULL,
  `DataEntrega` TEXT NULL DEFAULT NULL,
  `data` DATETIME NULL DEFAULT NULL,
  CONSTRAINT `clienteID`
    FOREIGN KEY (`ClienteID`)
    REFERENCES `desafio_sql`.`cliente` (`ClienteID`),
  CONSTRAINT `cupomID`
    FOREIGN KEY (`CupomID`)
    REFERENCES `desafio_sql`.`cupom` (`CupomID`),
  CONSTRAINT `funcionarioID`
    FOREIGN KEY (`FuncionarioID`)
    REFERENCES `desafio_sql`.`funcionario` (`FuncionarioID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `clienteID_idx` ON `desafio_sql`.`venda` (`ClienteID` ASC) VISIBLE;

CREATE INDEX `funcionarioID_idx` ON `desafio_sql`.`venda` (`FuncionarioID` ASC) VISIBLE;

CREATE INDEX `cupomID_idx` ON `desafio_sql`.`venda` (`CupomID` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
