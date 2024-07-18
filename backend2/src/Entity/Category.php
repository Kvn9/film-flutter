<?php

namespace App\Entity;

use App\Repository\CategoryRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CategoryRepository::class)]
class Category
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $nom = null;

    #[ORM\Column(length: 255)]
    private ?string $description = null;

    /**
     * @var Collection<int, Loisir>
     */
    #[ORM\OneToMany(targetEntity: Loisir::class, mappedBy: 'category')]
    private Collection $loisirs;

    public function __construct()
    {
        $this->loisirs = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): static
    {
        $this->nom = $nom;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    /**
     * @return Collection<int, Loisir>
     */
    public function getLoisirs(): Collection
    {
        return $this->loisirs;
    }

    public function addLoisir(Loisir $loisir): static
    {
        if (!$this->loisirs->contains($loisir)) {
            $this->loisirs->add($loisir);
            $loisir->setCategory($this);
        }

        return $this;
    }

    public function removeLoisir(Loisir $loisir): static
    {
        if ($this->loisirs->removeElement($loisir)) {
            // set the owning side to null (unless already changed)
            if ($loisir->getCategory() === $this) {
                $loisir->setCategory(null);
            }
        }

        return $this;
    }
}
