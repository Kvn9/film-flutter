<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Loisir;
use App\Entity\Category;
use App\Repository\LoisirRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class LoisirController extends AbstractController
{
    private EntityManagerInterface $entityManager;
    private LoisirRepository $loisirRepository;

    public function __construct(EntityManagerInterface $entityManager, LoisirRepository $loisirRepository)
    {
        $this->entityManager = $entityManager;
        $this->loisirRepository = $loisirRepository;
    }

    #[Route('/loisirs', name: 'app_loisir_list', methods: ['GET'])]
    public function list(): JsonResponse
    {
        $loisirs = $this->loisirRepository->findAll();

        $data = [];
        foreach ($loisirs as $loisir) {
            $data[] = [
                'id' => $loisir->getId(),
                'titre' => $loisir->getTitre(),
                'description' => $loisir->getDescription(),
                'notation' => $loisir->getNotation(),
                'createdAt' => $loisir->getCreatedAt()->format('c'),
                'category' => $loisir->getCategory() ? $loisir->getCategory()->getId() : null,
                'user' => $loisir->getUser() ? $loisir->getUser()->getId() : null,
            ];
        }

        return $this->json($data);
    }

    #[Route('/loisir/{id}', name: 'app_loisir_show', methods: ['GET'])]
    public function show(int $id): JsonResponse
    {
        $loisir = $this->loisirRepository->find($id);

        if (!$loisir) {
            return new JsonResponse(['message' => 'Loisir not found'], Response::HTTP_NOT_FOUND);
        }

        return $this->json([
            'id' => $loisir->getId(),
            'titre' => $loisir->getTitre(),
            'description' => $loisir->getDescription(),
            'notation' => $loisir->getNotation(),
            'createdAt' => $loisir->getCreatedAt()->format('c'),
            'category' => $loisir->getCategory() ? $loisir->getCategory()->getId() : null,
            'user' => $loisir->getUser() ? $loisir->getUser()->getId() : null,
        ]);
    }

    #[Route('/loisir', name: 'app_loisir_create', methods: ['POST'])]
    public function create(Request $request): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        $loisir = new Loisir();
        $loisir->setTitre($data['titre']);
        $loisir->setDescription($data['description']);
        $loisir->setNotation($data['notation']);
        $loisir->setCreatedAt(new \DateTime($data['createdAt']));
        
        // Handle category and user associations
        $category = $this->entityManager->getRepository(Category::class)->find($data['category']);
        $user = $this->entityManager->getRepository(User::class)->find($data['user']);
        $loisir->setCategory($category);
        $loisir->setUser($user);

        $this->entityManager->persist($loisir);
        $this->entityManager->flush();

        return new JsonResponse([
            'message' => 'Loisir created successfully',
            'loisir_id' => $loisir->getId(),
        ], Response::HTTP_CREATED);
    }

    #[Route('/loisir/{id}', name: 'app_loisir_update', methods: ['PUT'])]
    public function update(Request $request, int $id): JsonResponse
    {
        $data = json_decode($request->getContent(), true);
        $loisir = $this->loisirRepository->find($id);

        if (!$loisir) {
            return new JsonResponse(['message' => 'Loisir not found'], Response::HTTP_NOT_FOUND);
        }

        $loisir->setTitre($data['titre']);
        $loisir->setDescription($data['description']);
        $loisir->setNotation($data['notation']);
        $loisir->setCreatedAt(new \DateTime($data['createdAt']));

        // Handle category and user associations
        $category = $this->entityManager->getRepository(Category::class)->find($data['category']);
        $user = $this->entityManager->getRepository(User::class)->find($data['user']);
        $loisir->setCategory($category);
        $loisir->setUser($user);

        $this->entityManager->flush();

        return new JsonResponse([
            'message' => 'Loisir updated successfully',
        ]);
    }

    #[Route('/loisir/{id}', name: 'app_loisir_delete', methods: ['DELETE'])]
    public function delete(int $id): JsonResponse
    {
        $loisir = $this->loisirRepository->find($id);

        if (!$loisir) {
            return new JsonResponse(['message' => 'Loisir not found'], Response::HTTP_NOT_FOUND);
        }

        $this->entityManager->remove($loisir);
        $this->entityManager->flush();

        return new JsonResponse([
            'message' => 'Loisir deleted successfully',
        ], Response::HTTP_NO_CONTENT);
    }
}
