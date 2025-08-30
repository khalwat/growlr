<?php

namespace modules\sitemodule\gql\types;

use craft\gql\base\ObjectType;
use GraphQL\Type\Definition\ResolveInfo;
use modules\sitemodule\gql\interfaces\GrowlrInterface;

class GrowlrType extends ObjectType
{
    public function __construct(array $config)
    {
        $config['interfaces'] = [
            GrowlrInterface::getType(),
        ];

        parent::__construct($config);
    }

    /**
     * @inheritdoc
     */
    protected function resolve(mixed $source, array $arguments, mixed $context, ResolveInfo $resolveInfo): mixed
    {
        $fieldName = $resolveInfo->fieldName;
        $result = $source[$fieldName] ?? '';

        if (empty($result)) {
            $result = null;
        }

        return $result;
    }
}
