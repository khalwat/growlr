<?php

namespace modules\sitemodule\gql\interfaces;

use craft\gql\base\InterfaceType as BaseInterfaceType;
use craft\gql\GqlEntityRegistry;
use GraphQL\Type\Definition\InterfaceType;
use GraphQL\Type\Definition\Type;
use modules\sitemodule\gql\types\generators\PawmateGenerator;

class PawmateInterface extends BaseInterfaceType
{
    public static function getTypeGenerator(): string
    {
        return PawmateGenerator::class;
    }

    public static function getType($fields = null): Type
    {
        if ($type = GqlEntityRegistry::getEntity(self::class)) {
            return $type;
        }

        $type = GqlEntityRegistry::createEntity(self::class, new InterfaceType([
            'name' => static::getName(),
            'fields' => self::class . '::getFieldDefinitions',
            'description' => 'This is the interface implemented by Growlr for Pawmates.',
            'resolveType' => function(array $value) {
                return GqlEntityRegistry::getEntity(PawmateGenerator::getName());
            },
        ]));
        PawmateGenerator::generateTypes();

        return $type;
    }

    /**
     * @inheritdoc
     */
    public static function getName(): string
    {
        return 'PawmateInterface';
    }

    /**
     * @inheritdoc
     */
    public static function getFieldDefinitions(): array
    {
        return array_merge(parent::getFieldDefinitions(), [
            'id' => [
                'name' => 'id',
                'type' => Type::int(),
                'description' => 'The id of the pawmate.',
            ],
            'title' => [
                'name' => 'title',
                'type' => Type::string(),
                'description' => 'The title of the pawmate.',
            ],
            'age' => [
                'name' => 'age',
                'type' => Type::string(),
                'description' => 'The age of the pawmate.',
            ],
            'sex' => [
                'name' => 'sex',
                'type' => Type::string(),
                'description' => 'The sex of the pawmate.',
            ],
            'neutered' => [
                'name' => 'neutered',
                'type' => Type::boolean(),
                'description' => 'Whether the pawmate is neutered.',
            ],
            'shortDescription' => [
                'name' => 'shortDescription',
                'type' => Type::string(),
                'description' => 'Description of the pawmate.',
            ],
            'imageUrl' => [
                'name' => 'imageUrl',
                'type' => Type::string(),
                'description' => 'The URL to a pawmate image.',
            ],
            'affection' => [
                'name' => 'affection',
                'type' => Type::int(),
                'description' => 'The pawmate affection level.',
            ],
            'activityLevel' => [
                'name' => 'activityLevel',
                'type' => Type::int(),
                'description' => 'The pawmate activityLevel level.',
            ],
            'bodySize' => [
                'name' => 'bodySize',
                'type' => Type::int(),
                'description' => 'The pawmate bodySize level.',
            ],
            'hairyness' => [
                'name' => 'hairyness',
                'type' => Type::int(),
                'description' => 'The pawmate hairyness level.',
            ],
            'diet' => [
                'name' => 'diet',
                'type' => Type::int(),
                'description' => 'The pawmate diet level.',
            ],
            'attractiveness' => [
                'name' => 'attractiveness',
                'type' => Type::int(),
                'description' => 'The pawmate attractiveness level.',
            ],
            'matchPercentage' => [
                'name' => 'matchPercentage',
                'type' => Type::int(),
                'description' => 'How close of a match is this pawmate, as a percentage.',
            ],
        ]);
    }
}
