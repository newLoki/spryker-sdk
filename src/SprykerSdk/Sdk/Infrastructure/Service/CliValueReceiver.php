<?php

/**
 * Copyright © 2019-present Spryker Systems GmbH. All rights reserved.
 * Use of this software requires acceptance of the Evaluation License Agreement. See LICENSE file.
 */

namespace SprykerSdk\Sdk\Infrastructure\Service;

use SprykerSdk\Sdk\Contracts\ValueReceiver\ValueReceiverInterface;
use SprykerSdk\Sdk\Core\Appplication\Exception\MissingValueException;
use Symfony\Component\Console\Helper\SymfonyQuestionHelper;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Question\ConfirmationQuestion;
use Symfony\Component\Console\Question\Question;

class CliValueReceiver implements ValueReceiverInterface
{
    protected InputInterface $input;

    protected OutputInterface $output;

    protected SymfonyQuestionHelper $questionHelper;

    /**
     * @param \Symfony\Component\Console\Helper\SymfonyQuestionHelper $questionHelper
     */
    public function __construct(SymfonyQuestionHelper $questionHelper)
    {
        $this->questionHelper = $questionHelper;
    }

    /**
     * @param \Symfony\Component\Console\Input\InputInterface $input
     *
     * @return void
     */
    public function setInput(InputInterface $input)
    {
        $this->input = $input;
    }

    /**
     * @param \Symfony\Component\Console\Output\OutputInterface $output
     *
     * @return void
     */
    public function setOutput(OutputInterface $output)
    {
        $this->output = $output;
    }

    /**
     * @param string $key
     *
     * @return bool
     */
    public function has(string $key): bool
    {
        return $this->input->hasOption($key) && $this->input->getOption($key) !== null;
    }

    /**
     * @param string $key
     *
     * @return mixed
     */
    public function get(string $key): mixed
    {
        return $this->input->getOption($key);
    }

    /**
     * @param string $description
     * @param mixed $defaultValue
     * @param string $type
     *
     * @return mixed
     */
    public function receiveValue(string $description, mixed $defaultValue, string $type): mixed
    {
        switch ($type) {
            case 'bool':
                $question = new ConfirmationQuestion($description, (bool)$defaultValue);

                break;
            default:
                $question = new Question($description, $defaultValue);
                $question->setNormalizer(function ($value) {
                    return $value ?: '';
                });

                if ($type === 'array') {
                    $question->setMultiline(true);
                }
        }

        if (!$defaultValue) {
            $question->setValidator(function ($value) {
                if (!$value && $value !== false) {
                    throw new MissingValueException('Value is invalid');
                }

                return $value;
            });
        }

        return $this->questionHelper->ask(
            $this->input,
            $this->output,
            $question,
        );
    }
}
