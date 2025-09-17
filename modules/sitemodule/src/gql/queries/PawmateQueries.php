<?php

namespace modules\sitemodule\gql\queries;

use craft\gql\base\Query;
use GraphQL\Type\Definition\Type;
use modules\sitemodule\gql\arguments\PawmateArguments;
use modules\sitemodule\gql\interfaces\PawmateInterface;
use modules\sitemodule\gql\resolvers\PawmateAllMatchesResolver;
use modules\sitemodule\gql\resolvers\PawmateBestMatchesResolver;
use modules\sitemodule\helpers\Gql as GqlHelper;

class PawmateQueries extends Query
{
    public static function getQueries($checkToken = true): array
    {
        if ($checkToken && !GqlHelper::canQueryPawmate()) {
            return [];
        }

        return [
            'pawmateBestMatches' => [
                'type' => Type::listOf(PawmateInterface::getType()),
                'args' => PawmateArguments::getArguments(),
                'resolve' => PawmateBestMatchesResolver::class . '::resolve',
                'description' => 'This query is used to resolve pawmates that best match the passed in attributes arguments.',
            ],
            'pawmateAllMatches' => [
                'type' => Type::listOf(PawmateInterface::getType()),
                'args' => PawmateArguments::getArguments(),
                'resolve' => PawmateAllMatchesResolver::class . '::resolve',
                'description' => 'This query is used to resolve all pawmates, sorted by `matchPercentage`.',
            ],
        ];
    }
}
