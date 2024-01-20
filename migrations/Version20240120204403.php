<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240120204403 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Add isBlocked property to User table.';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE user ADD is_blocked TINYINT(1) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE user DROP is_blocked');
    }
}
