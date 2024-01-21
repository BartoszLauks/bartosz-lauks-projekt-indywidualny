<?php

namespace App\Controller\Admin;

use App\Entity\User;
use Doctrine\ORM\Mapping\Entity;
use EasyCorp\Bundle\EasyAdminBundle\Config\Filters;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\EmailField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Filter\ArrayFilter;
use EasyCorp\Bundle\EasyAdminBundle\Filter\BooleanFilter;
use EasyCorp\Bundle\EasyAdminBundle\Filter\ChoiceFilter;
use EasyCorp\Bundle\EasyAdminBundle\Filter\DateTimeFilter;
use EasyCorp\Bundle\EasyAdminBundle\Filter\EntityFilter;
use EasyCorp\Bundle\EasyAdminBundle\Filter\NumericFilter;
use EasyCorp\Bundle\EasyAdminBundle\Filter\TextFilter;

class UserCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return User::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            EmailField::new('email'),
            TextField::new('name'),
            TextField::new('surname'),
            TextField::new('city'),
            TextField::new('postCode'),
            TextField::new('street'),
            TextField::new('houseAndApartmentNumber'),
            AssociationField::new('team'),
            ChoiceField::new('status', 'Status')
            ->autocomplete()
            ->setRequired(true)
            ->setChoices([
                'Working' => 'Working',
                'Off work' => 'Off work',
                'L4' => 'L4',
            ]),
            ChoiceField::new('roles', 'Roles')
                ->allowMultipleChoices()
                ->autocomplete()
                ->setRequired(false)
                ->setChoices([
                        'Administrator' => 'ROLE_ADMIN',
                    ]
                ),
            TextField::new('password')->hideWhenUpdating()->setMaxLength(10),
            AssociationField::new('gender'),
            DateField::new('dateOfBirth'),
            BooleanField::new('isBlocked'),
            DateTimeField::new('updatedAt')->hideOnForm(),
            DateTimeField::new('createdAt')->hideOnForm()
        ];
    }

    public function configureFilters(Filters $filters): Filters
    {
        return $filters
            ->add(NumericFilter::new('id'))
            ->add(TextFilter::new('email'))
            ->add(TextFilter::new('name'))
            ->add(TextFilter::new('surname'))
            ->add(TextFilter::new('city'))
            ->add(TextFilter::new('postCode'))
            ->add(TextFilter::new('street'))
            ->add(TextFilter::new('houseAndApartmentNumber'))
            ->add(ArrayFilter::new('roles')
                ->setChoices([
                        'Administrator' => 'ROLE_ADMIN',
                    ]
                ))
            ->add(EntityFilter::new('team'))
            ->add(ChoiceFilter::new('status')
                ->setChoices([
                    'Working' => 'Working',
                    'Off work' => 'Off work',
                    'L4' => 'L4',
                ]))
            ->add(EntityFilter::new('gender'))
            ->add(DateTimeFilter::new('dateOfBirth'))
            ->add(BooleanFilter::new('isBlocked'))
            ->add(DateTimeFilter::new('updatedAt'))
            ->add(DateTimeFilter::new('createdAt'))
            ;
    }
}
