<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240121121623 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Add done adn finishAt property to Task table.';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE task ADD done TINYINT(1) NOT NULL, ADD finish_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\'');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE task DROP done, DROP finish_at');
    }
}
