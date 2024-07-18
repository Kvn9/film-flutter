<?php

namespace App\Controller;

use App\Entity\Loisir;
use App\Form\LoisirType;
use App\Repository\LoisirRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/loisir')]
class LoisirController extends AbstractController
{
    #[Route('/', name: 'app_loisir_index', methods: ['GET'])]
    public function index(LoisirRepository $loisirRepository): Response
    {
        return $this->render('loisir/index.html.twig', [
            'loisirs' => $loisirRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_loisir_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $loisir = new Loisir();
        $form = $this->createForm(LoisirType::class, $loisir);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($loisir);
            $entityManager->flush();

            return $this->redirectToRoute('app_loisir_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('loisir/new.html.twig', [
            'loisir' => $loisir,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_loisir_show', methods: ['GET'])]
    public function show(Loisir $loisir): Response
    {
        return $this->render('loisir/show.html.twig', [
            'loisir' => $loisir,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_loisir_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Loisir $loisir, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(LoisirType::class, $loisir);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_loisir_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('loisir/edit.html.twig', [
            'loisir' => $loisir,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_loisir_delete', methods: ['POST'])]
    public function delete(Request $request, Loisir $loisir, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$loisir->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($loisir);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_loisir_index', [], Response::HTTP_SEE_OTHER);
    }
}
