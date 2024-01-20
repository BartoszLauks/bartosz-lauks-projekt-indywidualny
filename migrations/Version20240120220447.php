<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240120220447 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Add done property to Task table.';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE task ADD done TINYINT(1) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE task DROP done');
    }
}
