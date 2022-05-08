<?php

namespace SprykerSdk\Sdk\Extension\Tasks\Commands;

use SprykerSdk\Sdk\Core\Domain\Entity\Message;
use SprykerSdk\Sdk\Extension\Exception\FileNotFoundException;
use SprykerSdk\Sdk\Extension\Service\PbcFileModifierInterface;
use SprykerSdk\SdkContracts\Entity\ContextInterface;
use SprykerSdk\SdkContracts\Entity\ConverterInterface;
use SprykerSdk\SdkContracts\Entity\ExecutableCommandInterface;
use SprykerSdk\SdkContracts\Entity\MessageInterface;

class AddAopSdkCommand implements ExecutableCommandInterface
{
    protected const AOP_SDK_REPOSITORY = 'spryker-sdk/aop-sdk';

    private PbcFileModifierInterface $composerFileModifier;

    /**
     * @param PbcFileModifierInterface $composerFileModifier
     */
    public function __construct(PbcFileModifierInterface $composerFileModifier)
    {
        $this->composerFileModifier = $composerFileModifier;
    }


    /**
     * @param \SprykerSdk\SdkContracts\Entity\ContextInterface $context
     *
     * @return \SprykerSdk\SdkContracts\Entity\ContextInterface
     */
    public function execute(ContextInterface $context): ContextInterface
    {
        try {
            $this->addAopSdk($context);
        } catch (FileNotFoundException $exception) {
            $context->addMessage(static::class, new Message($exception->getMessage(), MessageInterface::ERROR));
        }

        return $context;
    }

    /**
     * @return string
     */
    public function getCommand(): string
    {
        return '';
    }

    /**
     * @return string
     */
    public function getType(): string
    {
        return 'php';
    }

    /**
     * @return bool
     */
    public function hasStopOnError(): bool
    {
        return true;
    }

    /**
     * @return array<string>
     */
    public function getTags(): array
    {
        return [];
    }

    /**
     * @return \SprykerSdk\SdkContracts\Entity\ConverterInterface|null
     */
    public function getViolationConverter(): ?ConverterInterface
    {
        return null;
    }

    /**
     * @param ContextInterface $context
     *
     * @return void
     */
    protected function addAopSdk(ContextInterface $context): void
    {
        $composerContent = $this->composerFileModifier->read($context, sprintf('Can not add %s to composer.json in generated PBC', static::AOP_SDK_REPOSITORY));
        $composerContent['require-dev'][static::AOP_SDK_REPOSITORY] = '*';
        $this->composerFileModifier->write($composerContent, $context);
    }
}
