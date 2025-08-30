<?php

namespace modules\sitemodule\gql\arguments;

use craft\gql\base\Arguments;
use GraphQL\Type\Definition\Type;

class GrowlrArguments extends Arguments
{
    /**
     * @inheritdoc
     */
    public static function getArguments(): array
    {
        return [
            'affection' => [
                'name' => 'affection',
                'type' => Type::int(),
                'description' => 'The desired affection level.',
            ],
            'activityLevel' => [
                'name' => 'activityLevel',
                'type' => Type::int(),
                'description' => 'The desired activityLevel level.',
            ],
            'bodySize' => [
                'name' => 'bodySize',
                'type' => Type::int(),
                'description' => 'The desired bodySize level.',
            ],
            'hairyness' => [
                'name' => 'hairyness',
                'type' => Type::int(),
                'description' => 'The desired hairyness level.',
            ],
            'diet' => [
                'name' => 'diet',
                'type' => Type::int(),
                'description' => 'The desired diet level.',
            ],
            'attractiveness' => [
                'name' => 'attractiveness',
                'type' => Type::int(),
                'description' => 'The desired attractiveness level.',
            ],
        ];
    }
}
