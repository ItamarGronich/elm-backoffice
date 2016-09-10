module Assets.SalesJson exposing (..)


salesJson : String
salesJson =
    """
  [{
    "id": 7,
    "label": {
      "en": "Sale 5 <script>alert('xss');</script>",
      "he": "מכירה 5"
    },
    "published": "1",
    "created": 1472384634000,
    "updated": 1472715899000,
    "author": {
      "id": null,
      "label": null,
      "self": "http://localhost/backoffice/www/drupal/api/v1.0/users/0",
      "mail": null
    },
    "status": {
      "value": "new",
      "label": "New"
    },
    "description": {
      "en": null,
      "he": null
    },
    "subtitle": {
      "en": null,
      "he": null
    },
    "sale_type": "mail_and_live",
    "bid_steps": null,
    "logo": {
      "fid": "5",
      "uid": "0",
      "filename": "sale-logo_3.jpg",
      "uri": "public://sale_covers/sale-logo_3.jpg",
      "filemime": "image/jpeg",
      "filesize": "7805",
      "status": "1",
      "timestamp": "1472384634",
      "alt": null,
      "title": null,
      "width": "198",
      "height": "128",
      "url": "https://demo-backoffice.s3.eu-central-1.amazonaws.com/files-local/sale_covers/sale-logo_3.jpg"
    },
    "auctioneer_name": null,
    "mail_sale_date_from": null,
    "mail_sale_date_to": null,
    "live_sale_date_from": null,
    "live_sale_date_to": null,
    "buyers_premium": null,
    "lots_locked": false,
    "post_sale_discount": "20",
    "sync_item_images": false,
    "last_item_images_sync": null,
    "sale_sessions": null,
    "last_date_for_consignment": null,
    "sale_number": null,
    "additional_charges": null
  }, {
    "id": 6,
    "label": {
      "en": "Sale 4",
      "he": "מכירה 4"
    },
    "published": "1",
    "created": 1472384634000,
    "updated": 1472719909000,
    "author": {
      "id": null,
      "label": null,
      "self": "http://localhost/backoffice/www/drupal/api/v1.0/users/0",
      "mail": null
    },
    "status": {
      "value": "ready_to_publish",
      "label": "Ready to publish"
    },
    "description": {
      "en": null,
      "he": null
    },
    "subtitle": {
      "en": null,
      "he": null
    },
    "sale_type": "mail_and_live",
    "bid_steps": [{
      "step": "4",
      "step_from": "0"
    }, {
      "step": "9",
      "step_from": "24"
    }],
    "logo": {
      "fid": "4",
      "uid": "0",
      "filename": "sale-logo_2.jpg",
      "uri": "public://sale_covers/sale-logo_2.jpg",
      "filemime": "image/jpeg",
      "filesize": "7805",
      "status": "1",
      "timestamp": "1472384634",
      "alt": null,
      "title": null,
      "width": "198",
      "height": "128",
      "url": "https://demo-backoffice.s3.eu-central-1.amazonaws.com/files-local/sale_covers/sale-logo_2.jpg"
    },
    "auctioneer_name": null,
    "mail_sale_date_from": null,
    "mail_sale_date_to": null,
    "live_sale_date_from": null,
    "live_sale_date_to": null,
    "buyers_premium": null,
    "lots_locked": false,
    "post_sale_discount": "20",
    "sync_item_images": false,
    "last_item_images_sync": null,
    "sale_sessions": null,
    "last_date_for_consignment": null,
    "sale_number": null,
    "additional_charges": null
  }, {
    "id": 5,
    "label": {
      "en": "Sale 3",
      "he": "מכירה 3"
    },
    "published": "1",
    "created": 1472384634000,
    "updated": 1472385529000,
    "author": {
      "id": null,
      "label": null,
      "self": "http://localhost/backoffice/www/drupal/api/v1.0/users/0",
      "mail": null
    },
    "status": {
      "value": "ready_to_publish",
      "label": "Ready to publish"
    },
    "description": {
      "en": null,
      "he": null
    },
    "subtitle": {
      "en": null,
      "he": null
    },
    "sale_type": "mail_and_live",
    "bid_steps": [{
      "step": "3",
      "step_from": "0"
    }, {
      "step": "8",
      "step_from": "23"
    }, {
      "step": "15",
      "step_from": "53"
    }],
    "logo": {
      "fid": "3",
      "uid": "0",
      "filename": "sale-logo_1.jpg",
      "uri": "public://sale_covers/sale-logo_1.jpg",
      "filemime": "image/jpeg",
      "filesize": "7805",
      "status": "1",
      "timestamp": "1472384634",
      "alt": null,
      "title": null,
      "width": "198",
      "height": "128",
      "url": "https://demo-backoffice.s3.eu-central-1.amazonaws.com/files-local/sale_covers/sale-logo_1.jpg"
    },
    "auctioneer_name": null,
    "mail_sale_date_from": null,
    "mail_sale_date_to": null,
    "live_sale_date_from": null,
    "live_sale_date_to": null,
    "buyers_premium": null,
    "lots_locked": false,
    "post_sale_discount": "20",
    "sync_item_images": false,
    "last_item_images_sync": "1472384677",
    "sale_sessions": null,
    "last_date_for_consignment": null,
    "sale_number": null,
    "additional_charges": null
  }, {
    "id": 4,
    "label": {
      "en": "Sale 2",
      "he": "מכירה 2"
    },
    "published": "1",
    "created": 1472384634000,
    "updated": 1472385491000,
    "author": {
      "id": null,
      "label": null,
      "self": "http://localhost/backoffice/www/drupal/api/v1.0/users/0",
      "mail": null
    },
    "status": {
      "value": "ready_to_publish",
      "label": "Ready to publish"
    },
    "description": {
      "en": null,
      "he": null
    },
    "subtitle": {
      "en": null,
      "he": null
    },
    "sale_type": "mail_and_live",
    "bid_steps": [{
      "step": "2",
      "step_from": "0"
    }, {
      "step": "15",
      "step_from": "52"
    }],
    "logo": {
      "fid": "2",
      "uid": "0",
      "filename": "sale-logo_0.jpg",
      "uri": "public://sale_covers/sale-logo_0.jpg",
      "filemime": "image/jpeg",
      "filesize": "7805",
      "status": "1",
      "timestamp": "1472384634",
      "alt": null,
      "title": null,
      "width": "198",
      "height": "128",
      "url": "https://demo-backoffice.s3.eu-central-1.amazonaws.com/files-local/sale_covers/sale-logo_0.jpg"
    },
    "auctioneer_name": null,
    "mail_sale_date_from": null,
    "mail_sale_date_to": null,
    "live_sale_date_from": null,
    "live_sale_date_to": null,
    "buyers_premium": null,
    "lots_locked": false,
    "post_sale_discount": "20",
    "sync_item_images": false,
    "last_item_images_sync": "1472384677",
    "sale_sessions": null,
    "last_date_for_consignment": null,
    "sale_number": null,
    "additional_charges": null
  }, {
    "id": 3,
    "label": {
      "en": "Sale 1",
      "he": "מכירה 1"
    },
    "published": "1",
    "created": 1472384634000,
    "updated": 1472385312000,
    "author": {
      "id": null,
      "label": null,
      "self": "http://localhost/backoffice/www/drupal/api/v1.0/users/0",
      "mail": null
    },
    "status": {
      "value": "ready_to_publish",
      "label": "Ready to publish"
    },
    "description": {
      "en": null,
      "he": null
    },
    "subtitle": {
      "en": null,
      "he": null
    },
    "sale_type": "mail_and_live",
    "bid_steps": [{
      "step": "1",
      "step_from": "0"
    }, {
      "step": "6",
      "step_from": "21"
    }, {
      "step": "15",
      "step_from": "51"
    }],
    "logo": {
      "fid": "1",
      "uid": "0",
      "filename": "sale-logo.jpg",
      "uri": "public://sale_covers/sale-logo.jpg",
      "filemime": "image/jpeg",
      "filesize": "7805",
      "status": "1",
      "timestamp": "1472384634",
      "alt": null,
      "title": null,
      "width": "198",
      "height": "128",
      "url": "https://demo-backoffice.s3.eu-central-1.amazonaws.com/files-local/sale_covers/sale-logo.jpg"
    },
    "auctioneer_name": null,
    "mail_sale_date_from": null,
    "mail_sale_date_to": null,
    "live_sale_date_from": null,
    "live_sale_date_to": null,
    "buyers_premium": null,
    "lots_locked": false,
    "post_sale_discount": "20",
    "sync_item_images": false,
    "last_item_images_sync": "1472384677",
    "sale_sessions": null,
    "last_date_for_consignment": null,
    "sale_number": null,
    "additional_charges": null
  }]
"""


saleJson : String
saleJson =
    """
    {
      "id": 7,
      "label": {
        "en": "Sale 5 <script>alert('xss');</script>",
        "he": "מכירה 5"
      },
      "published": "1",
      "created": 1472384634000,
      "updated": 1472715899000,
      "author": {
        "id": null,
        "label": null,
        "self": "http://localhost/backoffice/www/drupal/api/v1.0/users/0",
        "mail": null
      },
      "status": {
        "value": "new",
        "label": "New"
      },
      "description": {
        "en": null,
        "he": null
      },
      "subtitle": {
        "en": null,
        "he": null
      },
      "sale_type": "mail_and_live",
      "bid_steps": null,
      "logo": {
        "fid": "5",
        "uid": "0",
        "filename": "sale-logo_3.jpg",
        "uri": "public://sale_covers/sale-logo_3.jpg",
        "filemime": "image/jpeg",
        "filesize": "7805",
        "status": "1",
        "timestamp": "1472384634",
        "alt": null,
        "title": null,
        "width": "198",
        "height": "128",
        "url": "https://demo-backoffice.s3.eu-central-1.amazonaws.com/files-local/sale_covers/sale-logo_3.jpg"
      },
      "auctioneer_name": null,
      "mail_sale_date_from": null,
      "mail_sale_date_to": null,
      "live_sale_date_from": null,
      "live_sale_date_to": null,
      "buyers_premium": null,
      "lots_locked": false,
      "post_sale_discount": "20",
      "sync_item_images": false,
      "last_item_images_sync": null,
      "sale_sessions": null,
      "last_date_for_consignment": null,
      "sale_number": null,
      "additional_charges": null
    }
  """
