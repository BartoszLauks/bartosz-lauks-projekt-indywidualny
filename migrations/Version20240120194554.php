<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240120194554 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Add company levels tables and relation with user';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE company (id INT AUTO_INCREMENT NOT NULL, city VARCHAR(255) NOT NULL, post_code VARCHAR(255) NOT NULL, street VARCHAR(255) NOT NULL, place_number VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', updated_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE departament (id INT AUTO_INCREMENT NOT NULL, company_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', updated_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_34F6FDA3979B1AD6 (company_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE team (id INT AUTO_INCREMENT NOT NULL, departament_id INT DEFAULT NULL, name VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', updated_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_C4E0A61F48B3EEE4 (departament_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE departament ADD CONSTRAINT FK_34F6FDA3979B1AD6 FOREIGN KEY (company_id) REFERENCES company (id)');
        $this->addSql('ALTER TABLE team ADD CONSTRAINT FK_C4E0A61F48B3EEE4 FOREIGN KEY (departament_id) REFERENCES departament (id)');
        $this->addSql('ALTER TABLE user ADD team_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE user ADD CONSTRAINT FK_8D93D649296CD8AE FOREIGN KEY (team_id) REFERENCES team (id)');
        $this->addSql('CREATE INDEX IDX_8D93D649296CD8AE ON user (team_id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE user DROP FOREIGN KEY FK_8D93D649296CD8AE');
        $this->addSql('ALTER TABLE departament DROP FOREIGN KEY FK_34F6FDA3979B1AD6');
        $this->addSql('ALTER TABLE team DROP FOREIGN KEY FK_C4E0A61F48B3EEE4');
        $this->addSql('DROP TABLE company');
        $this->addSql('DROP TABLE departament');
        $this->addSql('DROP TABLE team');
        $this->addSql('DROP INDEX IDX_8D93D649296CD8AE ON user');
        $this->addSql('ALTER TABLE user DROP team_id');
    }
}
