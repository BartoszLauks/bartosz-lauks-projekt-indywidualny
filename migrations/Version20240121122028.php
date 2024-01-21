<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240121122028 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Add title property to Task table.';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE task ADD title VARCHAR(255) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE task DROP title');
    }
}
