Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5E3426053
	for <lists+freedreno@lfdr.de>; Fri,  8 Oct 2021 01:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112B76E043;
	Thu,  7 Oct 2021 23:19:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 357 seconds by postgrey-1.36 at gabe;
 Thu, 07 Oct 2021 21:35:52 UTC
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24776F4E6
 for <freedreno@lists.freedesktop.org>; Thu,  7 Oct 2021 21:35:52 +0000 (UTC)
Date: Thu, 07 Oct 2021 22:29:42 +0100
From: Paul Cercueil <paul@crapouillou.net>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, Russell King
 <rmk+kernel@arm.linux.org.uk>, Saravana Kannan <saravanak@google.com>
Message-Id: <IDMM0R.KPFO72NRAH8T2@crapouillou.net>
In-Reply-To: <20211006193819.2654854-16-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-16-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 07 Oct 2021 23:19:47 +0000
Subject: Re: [Freedreno] [PATCH v2 15/34] drm/ingenic: Migrate to aggregate
 driver
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Stephen,

Le mer., oct. 6 2021 at 12:38:00 -0700, Stephen Boyd=20
<swboyd@chromium.org> a =E9crit :
> Use an aggregate driver instead of component ops so that we can get
> proper driver probe ordering of the aggregate device with respect to=20
> all
> the component devices that make up the aggregate device.
>=20
> TODO: Move the helpers to PM in aggregate driver hooks.
>=20
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 24=20
> +++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index a5df1c8d34cd..058b7bfe5610 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1150,8 +1150,10 @@ static int ingenic_drm_bind(struct device=20
> *dev, bool has_components)
>  	return ret;
>  }
>=20
> -static int ingenic_drm_bind_with_components(struct device *dev)
> +static int ingenic_drm_bind_with_components(struct aggregate_device=20
> *adev)
>  {
> +	struct device *dev =3D adev->parent;
> +
>  	return ingenic_drm_bind(dev, true);
>  }
>=20
> @@ -1174,9 +1176,19 @@ static void ingenic_drm_unbind(struct device=20
> *dev)
>  	drm_atomic_helper_shutdown(&priv->drm);
>  }
>=20
> -static const struct component_master_ops ingenic_master_ops =3D {
> -	.bind =3D ingenic_drm_bind_with_components,
> -	.unbind =3D ingenic_drm_unbind,
> +static void ingenic_aggregate_remove(struct aggregate_device *adev)
> +{
> +	struct device *dev =3D adev->parent;

Space here.

With that:

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> +	ingenic_drm_unbind(dev);
> +}
> +
> +static struct aggregate_driver ingenic_aggregate_driver =3D {
> +	.probe =3D ingenic_drm_bind_with_components,
> +	.remove =3D ingenic_aggregate_remove,
> +	.driver =3D {
> +		.name =3D "ingenic_drm",
> +		.owner =3D THIS_MODULE,
> +	},
>  };
>=20
>  static int ingenic_drm_probe(struct platform_device *pdev)
> @@ -1196,7 +1208,7 @@ static int ingenic_drm_probe(struct=20
> platform_device *pdev)
>  	drm_of_component_match_add(dev, &match, compare_of, np);
>  	of_node_put(np);
>=20
> -	return component_master_add_with_match(dev, &ingenic_master_ops,=20
> match);
> +	return component_aggregate_register(dev, &ingenic_aggregate_driver,=20
> match);
>  }
>=20
>  static int ingenic_drm_remove(struct platform_device *pdev)
> @@ -1206,7 +1218,7 @@ static int ingenic_drm_remove(struct=20
> platform_device *pdev)
>  	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
>  		ingenic_drm_unbind(dev);
>  	else
> -		component_master_del(dev, &ingenic_master_ops);
> +		component_aggregate_unregister(dev, &ingenic_aggregate_driver);
>=20
>  	return 0;
>  }
> --
> https://chromeos.dev
>=20


