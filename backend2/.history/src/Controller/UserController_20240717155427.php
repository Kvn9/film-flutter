<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
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


}




    




