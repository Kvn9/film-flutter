<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use App\Form\LoginType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class UserController extends AbstractController
{
       
    private EntityManagerInterface $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }


    #[Route('/inscription', name: 'app_registration',methods:['POST'])]
    public function index(Request $request, UserPasswordHasherInterface $encoder, EntityManagerInterface $entityManager): Response
    {
       
        $user = new User();
        $form = $this->createForm(UserType::class, $user);

        $data= json_decode($request->getContent(), true);
       
          
            $user_find = $this->entityManager->getRepository(User::class)->findOneByEmail($data['email']);

            if (!$user_find) {
                // Hasher le mot de passe
                $password = $encoder->hashPassword($user, $data['password']);
                $user->setEmail($data['email']);
                $user->setNom($data['nom']);
                $user->setPrenom($data['prenom']);
                
                $user->setRoles(['ROLE_USER']);
                $user->setPassword($password);
                $this->entityManager->persist($user);
                $this->entityManager->flush();

        }
        return $this->json([
            'message' => 'user created successfully',
            'user_id' => $user->getId(),

        ], Response::HTTP_CREATED);
    }

    #[Route('/users/{id}', name: 'get_user_by_id', methods: ['GET'])]
    public function getUserById(int $id): Response
    {
        $user = $this->entityManager->getRepository(User::class)->find($id);

        if (!$user) {
            return $this->json(['error' => 'User not found'], Response::HTTP_NOT_FOUND);
        }

        $data = [
            'id' => $user->getId(),
            'email' => $user->getEmail(),
            'nom' => $user->getNom(),
            'prenom' => $user->getPrenom(),
            'roles' => $user->getRoles(),
        ];

        return $this->json($data);
    }


    #[Route('/users', name: 'get_all_users', methods: ['GET'])]
    public function getAllUsers(): Response
    {
        $users = $this->entityManager->getRepository(User::class)->findAll();

        $data = array_map(fn(User $user) => [
            'id' => $user->getId(),
            'email' => $user->getEmail(),
            'nom' => $user->getNom(),
            'prenom' => $user->getPrenom(),
            'roles' => $user->getRoles(),
        ], $users);

        return $this->json($data);
    }
    #[Route('/connexion', name: 'app_connexion', methods:['GET'])]

    public function login(Request $request, UserPasswordHasherInterface $passwordHasher): JsonResponse
    {
        $user = new User();
        $form = $this->createForm(LoginType::class, $user);
        $data = json_decode($request->getContent(), true);
        
        // Manuellement soumettre les données JSON au formulaire
        $form->submit($data);

            $user = $this->entityManager->getRepository(User::class)->findOneBy(['email' => $data['email']]);

            if (!$user) {
                return new JsonResponse(['message' => 'Invalid credentials'], Response::HTTP_UNAUTHORIZED);
            }
            if (!$passwordHasher->isPasswordValid($user, $data['password'])) {
                return new JsonResponse(['message' => 'Invalid credentials'], Response::HTTP_UNAUTHORIZED);
            }
            return new JsonResponse([
                'message' => 'Login successful',
            ], Response::HTTP_OK);
        return new JsonResponse(['message' => 'Invalid data'], Response::HTTP_BAD_REQUEST);
    }
}

    










    




