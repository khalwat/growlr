<?php

namespace modules\sitemodule\gql\types\generators;

use craft\gql\base\GeneratorInterface;
use craft\gql\GqlEntityRegistry;
use craft\gql\TypeLoader;
use modules\sitemodule\gql\arguments\GrowlrArguments;
use modules\sitemodule\gql\interfaces\GrowlrInterface;
use modules\sitemodule\gql\types\GrowlrType;

class GrowlrGenerator implements GeneratorInterface
{
    public static function generateTypes(mixed $context = null): array
    {
        $gqlTypes = [];
        $growlrFields = GrowlrInterface::getFieldDefinitions();
        $growlrArgs = GrowlrArguments::getArguments();
        $typeName = self::getName();
        $growlrType = GqlEntityRegistry::getEntity($typeName)
            ?: GqlEntityRegistry::createEntity($typeName, new GrowlrType([
                'name' => $typeName,
                'args' => function() use ($growlrArgs) {
                    return $growlrArgs;
                },
                'fields' => function() use ($growlrFields) {
                    return $growlrFields;
                },
                'description' => 'This entity has all the Growlr fields',
            ]));

        $gqlTypes[$typeName] = $growlrType;
        TypeLoader::registerType($typeName, function() use ($growlrType) {
            return $growlrType;
        });

        return $gqlTypes;
    }

    public static function getName($context = null): string
    {
        return 'GrowlrType';
    }
}
