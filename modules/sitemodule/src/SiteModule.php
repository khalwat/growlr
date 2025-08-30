<?php
/**
 * Site module for Craft CMS 3.x
 *
 * Custom site module
 *
 * @link      https://nystudio107.com
 * @copyright Copyright (c) 2019 nystudio107
 */

namespace modules\sitemodule;

use Craft;
use craft\events\RegisterGqlQueriesEvent;
use craft\events\RegisterGqlSchemaComponentsEvent;
use craft\events\RegisterGqlTypesEvent;
use craft\events\RegisterTemplateRootsEvent;
use craft\events\TemplateEvent;
use craft\i18n\PhpMessageSource;
use craft\services\Gql;
use craft\web\twig\variables\CraftVariable;
use craft\web\View;
use modules\sitemodule\assetbundles\sitemodule\SiteModuleAsset;
use modules\sitemodule\gql\interfaces\GrowlrInterface;
use modules\sitemodule\gql\queries\GrowlrQuery;
use modules\sitemodule\services\Helper;
use modules\sitemodule\variables\SiteVariable;
use yii\base\Event;
use yii\base\InvalidConfigException;
use yii\base\Module;

/**
 * Class SiteModule
 *
 * @author    nystudio107
 * @package   SiteModule
 * @since     1.0.0
 *
 * @property Helper helper
 */
class SiteModule extends Module
{
    // Static Properties
    // =========================================================================

    /**
     * @var SiteModule
     */
    public static $instance;

    // Public Methods
    // =========================================================================

    /**
     * @inheritdoc
     */
    public function __construct($id, $parent = null, array $config = [])
    {
        Craft::setAlias('@modules/sitemodule', $this->getBasePath());
        $this->controllerNamespace = 'modules\sitemodule\controllers';

        // Translation category
        $i18n = Craft::$app->getI18n();
        /** @noinspection UnSafeIsSetOverArrayInspection */
        if (!isset($i18n->translations[$id]) && !isset($i18n->translations[$id . '*'])) {
            $i18n->translations[$id] = [
                'class' => PhpMessageSource::class,
                'sourceLanguage' => 'en-US',
                'basePath' => '@modules/sitemodule/translations',
                'forceTranslation' => true,
                'allowOverrides' => true,
            ];
        }

        // Base template directory
        Event::on(View::class, View::EVENT_REGISTER_CP_TEMPLATE_ROOTS, function(RegisterTemplateRootsEvent $e) {
            if (is_dir($baseDir = $this->getBasePath() . DIRECTORY_SEPARATOR . 'templates')) {
                $e->roots[$this->id] = $baseDir;
            }
        });

        // Set this as the global instance of this module class
        static::setInstance($this);

        parent::__construct($id, $parent, $config);
    }

    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();
        self::$instance = $this;

        // Register our components
        $this->setComponents([
            'helper' => [
                'class' => Helper::class,
            ]
        ]);
        // Register our variables
        Event::on(
            CraftVariable::class,
            CraftVariable::EVENT_INIT,
            static function(Event $event) {
                /** @var CraftVariable $variable */
                $variable = $event->sender;
                $variable->set('site', SiteVariable::class);
            }
        );
        // Register our Asset bundle for CP requests
        if (Craft::$app->getRequest()->getIsCpRequest()) {
            Event::on(
                View::class,
                View::EVENT_BEFORE_RENDER_TEMPLATE,
                static function(TemplateEvent $event) {
                    try {
                        Craft::$app->getView()->registerAssetBundle(SiteModuleAsset::class);
                    } catch (InvalidConfigException $e) {
                        Craft::error(
                            'Error registering AssetBundle - ' . $e->getMessage(),
                            __METHOD__
                        );
                    }
                }
            );
        }
        // Handler: Gql::EVENT_REGISTER_GQL_TYPES
        Event::on(
            Gql::class,
            Gql::EVENT_REGISTER_GQL_TYPES,
            static function(RegisterGqlTypesEvent $event) {
                Craft::debug(
                    'Gql::EVENT_REGISTER_GQL_TYPES',
                    __METHOD__
                );
                $event->types[] = GrowlrInterface::class;
            }
        );
        // Handler: Gql::EVENT_REGISTER_GQL_QUERIES
        Event::on(
            Gql::class,
            Gql::EVENT_REGISTER_GQL_QUERIES,
            static function(RegisterGqlQueriesEvent $event) {
                Craft::debug(
                    'Gql::EVENT_REGISTER_GQL_QUERIES',
                    __METHOD__
                );
                $queries = GrowlrQuery::getQueries();
                foreach ($queries as $key => $value) {
                    $event->queries[$key] = $value;
                }
            }
        );
        // Handler: Gql::EVENT_REGISTER_SCHEMA_COMPONENTS
        Event::on(
            Gql::class,
            Gql::EVENT_REGISTER_GQL_SCHEMA_COMPONENTS,
            static function(RegisterGqlSchemaComponentsEvent $event) {
                Craft::debug(
                    'Gql::EVENT_REGISTER_GQL_SCHEMA_COMPONENTS',
                    __METHOD__
                );
                $label = Craft::t('site-module', 'Growlr');
                $event->queries[$label]['growlr.all:read'] = ['label' => Craft::t('site-module', 'Query Growlr data')];
            }
        );
        Craft::info(
            Craft::t(
                'site-module',
                '{name} module loaded',
                ['name' => 'Site']
            ),
            __METHOD__
        );
    }

    // Protected Methods
    // =========================================================================
}
