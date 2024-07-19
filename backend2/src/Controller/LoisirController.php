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
use Symfony\Component\HttpFoundation\File\Exception\FileException;
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

        ]);
    }

    #[Route('/add-loisir', name: 'app_loisir_create', methods: ['POST'])]
    public function create(Request $request): JsonResponse
    {
        $data = json_decode($request->getContent(), true);

        $loisir = new Loisir();
        $loisir->setTitre($data['titre']);
        $loisir->setDescription($data['description']);
        $loisir->setNotation($data['notation']);
        $loisir->setCreatedAt(new \DateTime($data['createdAt']));



        // if ($request->files->has('image')) {
        //     $imageFile = $request->files->get('image');
        //     $fileName = $this->uploadImage($imageFile);
        //     $loisir->setImage($fileName);
        // }



        // Handle category and user associations


        $this->entityManager->persist($loisir);
        $this->entityManager->flush();

        return new JsonResponse([
            'message' => 'Loisir created successfully',
            'loisir_id' => $loisir->getId(),
        ], Response::HTTP_CREATED);
    }

    // private function uploadImage($imageFile): string
    // {
    //     $fileName = uniqid() . '.' . $imageFile->guessExtension();

    //     try {
    //         $imageFile->move(
    //             $this->getParameter('kernel.project_dir') . '/public/uploads',
    //             $fileName
    //         );
    //     } catch (FileException $e) {
    //         throw new \Exception('Failed to upload file.');
    //     }

    //     return $fileName;
    // }

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
