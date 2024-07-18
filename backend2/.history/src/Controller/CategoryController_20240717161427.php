<?php

namespace App\Controller;

use App\Entity\Category;
use App\Form\CategoryType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;

class CategoryController extends AbstractController
{
    private EntityManagerInterface $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    #[Route('/categories', name: 'app_category_list', methods: ['GET'])]
    public function list(): JsonResponse
    {
        $categories = $this->entityManager->getRepository(Category::class)->findAll();

        $data = [];
        foreach ($categories as $category) {
            $data[] = [
                'id' => $category->getId(),
                'nom' => $category->getNom(),
                'description' => $category->getDescription(),
            ];
        }

        return new JsonResponse($data, Response::HTTP_OK);
    }

    #[Route('/category/{id}', name: 'app_category_get', methods: ['GET'])]
    public function get(int $id): JsonResponse
    {
        $category = $this->entityManager->getRepository(Category::class)->find($id);

        if (!$category) {
            return new JsonResponse(['message' => 'Category not found'], Response::HTTP_NOT_FOUND);
        }

        $data = [
            'id' => $category->getId(),
            'nom' => $category->getNom(),
            'description' => $category->getDescription(),
        ];

        return new JsonResponse($data, Response::HTTP_OK);
    }

    #[Route('/category', name: 'app_category_create', methods: ['POST'])]
    public function create(Request $request): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        $category = new Category();
        $category->setNom($data['nom']);
        $category->setDescription($data['description']);

        $this->entityManager->persist($category);
        $this->entityManager->flush();

        return new JsonResponse([
            'message' => 'Category created successfully',
            'id' => $category->getId(),
        ], Response::HTTP_CREATED);
    }

    #[Route('/category/{id}', name: 'app_category_edit', methods: ['PUT'])]
    public function edit(int $id, Request $request): JsonResponse
    {
        $category = $this->entityManager->getRepository(Category::class)->find($id);

        if (!$category) {
            return new JsonResponse(['message' => 'Category not found'], Response::HTTP_NOT_FOUND);
        }

        $data = json_decode($request->getContent(), true);

        if (isset($data['nom'])) {
            $category->setNom($data['nom']);
        }
        if (isset($data['description'])) {
            $category->setDescription($data['description']);
        }

        $this->entityManager->flush();

        return new JsonResponse([
            'message' => 'Category updated successfully',
            'id' => $category->getId(),
        ], Response::HTTP_OK);
    }

    #[Route('/category/{id}', name: 'app_category_delete', methods: ['DELETE'])]
    public function delete(int $id): JsonResponse
    {
        $category = $this->entityManager->getRepository(Category::class)->find($id);

        if (!$category) {
            return new JsonResponse(['message' => 'Category not found'], Response::HTTP_NOT_FOUND);
        }

        $this->entityManager->remove($category);
        $this->entityManager->flush();

        return new JsonResponse(['message' => 'Category deleted successfully'], Response::HTTP_NO_CONTENT);
    }
}
