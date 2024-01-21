<?php

namespace App\Controller;

use App\Repository\TaskRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/search', name: 'app_search_')]
class SearchController extends AbstractController
{
    public function __construct(
        private readonly TaskRepository $taskRepository,
        private readonly UserRepository $userRepository
    ) {}

    #[Route('/', name: 'index')]
    public function index(Request $request): Response
    {
        $offset = max(0, $request->query->getInt('offset', 0));

        $user = $this->userRepository->findOneBy(['email' => $request->query->get("search-text")]);

        if (!$user) {
            $this->addFlash('danger', 'User not exist');

            return $this->redirect($this->generateUrl('app_home_index'));
        }

        $paginator = $this->taskRepository->getUserTasksPaginator($user, $offset);

        return $this->render('task/index.html.twig', [
            'tasks' => $paginator,
            'previous' => $offset - TaskRepository::PAGINATOR_PER_PAGE,
            'next' => min(count($paginator), $offset + TaskRepository::PAGINATOR_PER_PAGE),
        ]);
    }
}
