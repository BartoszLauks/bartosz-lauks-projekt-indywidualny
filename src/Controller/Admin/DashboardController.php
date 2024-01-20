<?php

namespace App\Controller\Admin;

use App\Entity\Company;
use App\Entity\Departament;
use App\Entity\Gender;
use App\Entity\Task;
use App\Entity\Team;
use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    /**
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[Route('/admin', name: 'app_admin')]
    public function index(): Response
    {
//        return parent::index();

        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
        // $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        // return $this->redirect($adminUrlGenerator->setController(OneOfYourCrudController::class)->generateUrl());

        // Option 2. You can make your dashboard redirect to different pages depending on the user
        //
        // if ('jane' === $this->getUser()->getUsername()) {
        //     return $this->redirect('...');
        // }

        // Option 3. You can render some custom template to display a proper dashboard with widgets, etc.
        // (tip: it's easier if your template extends from @EasyAdmin/page/content.html.twig)
        //
        // return $this->render('some/path/my-dashboard.html.twig');

        $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        return $this->redirect($adminUrlGenerator->setController(GenderCrudController::class)->generateUrl());
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Bartosz-Lauks-projekt-indywidualny')
            ->setFaviconPath('https://cdn-icons-png.flaticon.com/512/2103/2103633.png')
            ;
    }

    public function configureMenuItems(): iterable
    {
//        yield MenuItem::linkToDashboard('Dashboard', 'fa fa-home');
        yield MenuItem::linkToRoute('Home', 'fa-solid fa-house', 'app_home_index');
        yield MenuItem::linkToCrud('Gender', 'fa-solid fa-venus-mars', Gender::class);
        yield MenuItem::linkToCrud('Users', 'fa fa-user', User::class);
        yield MenuItem::linkToCrud('Company', 'fa-solid fa-building', Company::class);
        yield MenuItem::linkToCrud('Department', 'fa-solid fa-building-user', Departament::class);
        yield MenuItem::linkToCrud('Team', 'fa-solid fa-people-group', Team::class);
        yield MenuItem::linkToCrud('Task', 'fa-solid fa-list-check', Task::class);
//        yield MenuItem::linkToCrud('The Label', 'fas fa-list', EntityClass::class);
    }
}
