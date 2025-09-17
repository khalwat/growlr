<?php

namespace modules\sitemodule\gql\types\generators;

use craft\gql\base\GeneratorInterface;
use craft\gql\GqlEntityRegistry;
use craft\gql\TypeLoader;
use modules\sitemodule\gql\arguments\PawmateArguments;
use modules\sitemodule\gql\interfaces\PawmateInterface;
use modules\sitemodule\gql\types\PawmateType;

class PawmateGenerator implements GeneratorInterface
{
    public static function generateTypes(mixed $context = null): array
    {
        $gqlTypes = [];
        $pawmateFields = PawmateInterface::getFieldDefinitions();
        $pawmateArgs = PawmateArguments::getArguments();
        $typeName = self::getName();
        $pawmateType = GqlEntityRegistry::getEntity($typeName)
            ?: GqlEntityRegistry::createEntity($typeName, new PawmateType([
                'name' => $typeName,
                'args' => function() use ($pawmateArgs) {
                    return $pawmateArgs;
                },
                'fields' => function() use ($pawmateFields) {
                    return $pawmateFields;
                },
                'description' => 'This entity has all the pawmate fields',
            ]));

        $gqlTypes[$typeName] = $pawmateType;
        TypeLoader::registerType($typeName, function() use ($pawmateType) {
            return $pawmateType;
        });

        return $gqlTypes;
    }

    public static function getName($context = null): string
    {
        return 'PawmateType';
    }
}
