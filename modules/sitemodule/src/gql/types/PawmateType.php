<?php

namespace modules\sitemodule\gql\types;

use craft\gql\base\ObjectType;
use GraphQL\Type\Definition\ResolveInfo;
use modules\sitemodule\gql\interfaces\PawmateInterface;

class PawmateType extends ObjectType
{
    public function __construct(array $config)
    {
        $config['interfaces'] = [
            PawmateInterface::getType(),
        ];

        parent::__construct($config);
    }

    /**
     * @inheritdoc
     */
    protected function resolve(mixed $source, array $arguments, mixed $context, ResolveInfo $resolveInfo): mixed
    {
        $fieldName = $resolveInfo->fieldName;

        return $source[$fieldName] ?? '';
    }
}
