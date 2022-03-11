<?php

/**
 * Copyright © 2019-present Spryker Systems GmbH. All rights reserved.
 * Use of this software requires acceptance of the Evaluation License Agreement. See LICENSE file.
 */

namespace SprykerSdk\Sdk\Acceptance\Extension\Tasks;

use PHPUnit\Framework\Assert;
use SprykerSdk\Sdk\Tests\AcceptanceTester;

class SprykAddModuleTaskCest
{
    /**
     * @var string
     */
    protected const COMMAND = 'generate:php:add-module';

    /**
     * @var string
     */
    protected const PROJECT_DIR = 'spryk_project';

    /**
     * @param \SprykerSdk\Sdk\Tests\AcceptanceTester $I
     *
     * @return void
     */
    public function testSprykAddModuleRunsSuccessfully(AcceptanceTester $I): void
    {
        // Arrange
        $I->cleanDirIfExists($I->getPathFromProjectRoot('src', static::PROJECT_DIR));

        // Act
        $process = $I->runSdkCommand(
            [
                static::COMMAND,
                '--module=Test',
                '--namespace=Pyz',
            ],
            $I->getProjectRoot(static::PROJECT_DIR),
        );

        // Assert
        Assert::assertTrue($process->isSuccessful());
        Assert::assertDirectoryExists($I->getPathFromProjectRoot('src/Pyz/Zed/Test', static::PROJECT_DIR));
    }
}
