<?php

namespace App\Controller;

use App\Entity\Task;
use App\Repository\TaskRepository;
use DateTimeImmutable;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/tasks', name: 'app_task_')]
class TaskController extends AbstractController
{
    public function __construct(
        private readonly TaskRepository $taskRepository
    ) {}

    #[Route('', name: 'index')]
    public function index(Request $request): Response
    {
        $offset = max(0, $request->query->getInt('offset', 0));

        $paginator = $this->taskRepository->getUserTasksPaginator($this->getUser(), $offset);

        return $this->render('task/index.html.twig', [
            'tasks' => $paginator,
            'previous' => $offset - TaskRepository::PAGINATOR_PER_PAGE,
            'next' => min(count($paginator), $offset + TaskRepository::PAGINATOR_PER_PAGE),
        ]);
    }

    #[Route('/{id}/finish', name: 'finish')]
    public function finish(Task $task): Response
    {
        if ($task->getUser() !== $this->getUser()) {
            $this->addFlash('danger', 'Access denied!');

        } else {
            $task->setDone(true);
            $task->setFinishAt(new DateTimeImmutable('now'));

            $this->addFlash('success', 'You finishing task.');
        }

        $this->taskRepository->flush();
        return $this->redirect($this->generateUrl('app_home_index'));
    }
}
