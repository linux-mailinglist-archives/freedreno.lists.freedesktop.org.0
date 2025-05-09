Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963E0AB2413
	for <lists+freedreno@lfdr.de>; Sat, 10 May 2025 16:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EAC10E0E2;
	Sat, 10 May 2025 14:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MuT2x7LW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39D410EAF6
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 21:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746825322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nADWFNkzjtB9Jfn+qaS7u6sG7u22ATf691MD3dUkDrE=;
 b=MuT2x7LWqA4fWliCjvaHSracgDm2n7ehO+BO75K/VJ+YPuVgPGDtKuc0TlTRtleeL1cdzP
 2tir71v2axQ/k2d0CVayrdcUP54rYUzK0RQZM5QkD86/tZt32C9laC68UQfmlo2vjVnKbO
 /ruEyrWDR2EOVCM4xGEyoRd58LERFw4=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-vQfwIDFsP1-ty3SLxKMy6g-1; Fri, 09 May 2025 17:15:21 -0400
X-MC-Unique: vQfwIDFsP1-ty3SLxKMy6g-1
X-Mimecast-MFC-AGG-ID: vQfwIDFsP1-ty3SLxKMy6g_1746825321
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-7081121c3f7so32469577b3.1
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 14:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746825321; x=1747430121;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nADWFNkzjtB9Jfn+qaS7u6sG7u22ATf691MD3dUkDrE=;
 b=UgZ5WUXnCu9PMdLdSm9+yblWuZebCOfDdHuo9aZTjXAW1LD8W1yEDaFV73KTpQOeXQ
 FSFc/YkonT5yxUCFZLphmfX+oav8yWGpY0XZqz2En2Cjo14x1JQZFBUCSAWo80gJGaqZ
 JF5ubFHWx05OL1OveZCxP2lQGeqDF8KXiCmB5QZzxkpDuOyjwb3Ya0u1X6BoBGDCTKX9
 IR92uV7eTwbuCfT/UGUJTDTdRXegX69v+PH1aQaXa6q3arm0UCthGGvIpmgEHK8hsCiK
 3GilhD7mFnxQT6AmJ6yA9fblDMjq3TfLhwrVk1dAih08l5Mvf1dKOiGtWtBuLN1277Gw
 4aBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSfq+bMtah0ZsE+D56WK1r/KJfRnQxVWZVkLR+83CJbCzjy+5fD9kxe/ylX1lJuaTWU4t4GhWKq2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQFb+pm2WLb8BzZiXbzBQ97dmqXjNCOI2JFFD++2Os8s223Z10
 Yl1aHtIhkg5vxtA0ThjtXj3AtmTOFyG+RKsz0PjWGrBt5y6JBS+NK0yTUVYXgY1aL+jCCru8AKP
 XlJRCAQiggQt0y4S0HZQ+2OB5eVSeaWrbpGsZ9dLQ0XZQRlNMjfxXJkqQW1GdW3Wg3fsR8xJvdV
 luBaxwK94hcb7gAMuHFJ2Imwa/QTffG4hQXb+bO8db
X-Gm-Gg: ASbGncuu3DlfDmBFCBxhrtZLqCwkpnMIGFhLeegHCnx73aYcrKQP8x8PjsuQDZ94veD
 Z7PNXjvo+C/m9wKx2acwhzfbZGszp3TQ5/uokVqi2ZMrqD8Y6kxBAEi1ula27pBQwZqo=
X-Received: by 2002:a05:690c:314:b0:6fe:c2b4:f099 with SMTP id
 00721157ae682-70a2caaff36mr121893507b3.7.1746825320858; 
 Fri, 09 May 2025 14:15:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDppELatHWApVBTbp/y0X7WZ9jAfvXOg+6Uo9FOaf+Dx2WgFQUjAVJ0M31TRzpZ6Ak/8kII08lb0sxuJedJKU=
X-Received: by 2002:a05:690c:314:b0:6fe:c2b4:f099 with SMTP id
 00721157ae682-70a2caaff36mr121892917b3.7.1746825320418; Fri, 09 May 2025
 14:15:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-8-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-8-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 16:12:00 -0400
X-Gm-Features: AX0GCFvkeMsWo0PkdeGNZVPSEOEq27001W3hGFbQbs-mb7RlOGMt0yubyvY0ySM
Message-ID: <CAN9Xe3QFFr-igXdknR9iuTk1YPYUAjjANBdYsB_sT7rzvRS1jA@mail.gmail.com>
Subject: Re: [PATCH v3 08/22] drm/omap: dss: dpi: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 "Rob Herring (Arm)" <robh@kernel.org>, Helge Deller <deller@gmx.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wdRkuXzTKFdMXEXD-fxi7UhXXCfPel9dg25m57l-ESE_1746825321
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b567400634ba7651"
X-Mailman-Approved-At: Sat, 10 May 2025 14:00:19 +0000
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

--000000000000b567400634ba7651
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:56=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com>
wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> Cc: "Rob Herring (Arm)" <robh@kernel.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dpi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c
> b/drivers/gpu/drm/omapdrm/dss/dpi.c
> index
> 6eff97a091602f6d137095b3b7bf54fce17e8d3e..9f86db774c395db7e3396cbf2694748=
fc23c309d
> 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dpi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dpi.c
> @@ -562,7 +562,6 @@ static const struct drm_bridge_funcs dpi_bridge_funcs
> =3D {
>
>  static void dpi_bridge_init(struct dpi_data *dpi)
>  {
> -       dpi->bridge.funcs =3D &dpi_bridge_funcs;
>         dpi->bridge.of_node =3D dpi->pdev->dev.of_node;
>         dpi->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
>
> @@ -707,9 +706,9 @@ int dpi_init_port(struct dss_device *dss, struct
> platform_device *pdev,
>         u32 datalines;
>         int r;
>
> -       dpi =3D devm_kzalloc(&pdev->dev, sizeof(*dpi), GFP_KERNEL);
> -       if (!dpi)
> -               return -ENOMEM;
> +       dpi =3D devm_drm_bridge_alloc(&pdev->dev, struct dpi_data, bridge=
,
> &dpi_bridge_funcs);
> +       if (IS_ERR(dpi))
> +               return PTR_ERR(dpi);
>
>         ep =3D of_graph_get_next_port_endpoint(port, NULL);
>         if (!ep)
>
>
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks,
Anusha

> --
> 2.49.0
>
>

--000000000000b567400634ba7651
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 9, =
2025 at 9:56=E2=80=AFAM Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@b=
ootlin.com">luca.ceresoli@bootlin.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">This is the new API for allocating DRM=
 bridges.<br>
<br>
Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.co=
m" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
<br>
---<br>
<br>
Cc: &quot;Rob Herring (Arm)&quot; &lt;<a href=3D"mailto:robh@kernel.org" ta=
rget=3D"_blank">robh@kernel.org</a>&gt;<br>
Cc: Helge Deller &lt;<a href=3D"mailto:deller@gmx.de" target=3D"_blank">del=
ler@gmx.de</a>&gt;<br>
Cc: Kuninori Morimoto &lt;<a href=3D"mailto:kuninori.morimoto.gx@renesas.co=
m" target=3D"_blank">kuninori.morimoto.gx@renesas.com</a>&gt;<br>
Cc: Tomi Valkeinen &lt;<a href=3D"mailto:tomi.valkeinen@ideasonboard.com" t=
arget=3D"_blank">tomi.valkeinen@ideasonboard.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/omapdrm/dss/dpi.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/omapdrm/dss/dpi.c b/drivers/gpu/drm/omapdrm/ds=
s/dpi.c<br>
index 6eff97a091602f6d137095b3b7bf54fce17e8d3e..9f86db774c395db7e3396cbf269=
4748fc23c309d 100644<br>
--- a/drivers/gpu/drm/omapdrm/dss/dpi.c<br>
+++ b/drivers/gpu/drm/omapdrm/dss/dpi.c<br>
@@ -562,7 +562,6 @@ static const struct drm_bridge_funcs dpi_bridge_funcs =
=3D {<br>
<br>
=C2=A0static void dpi_bridge_init(struct dpi_data *dpi)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dpi-&gt;bridge.funcs =3D &amp;dpi_bridge_funcs;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dpi-&gt;bridge.of_node =3D dpi-&gt;pdev-&gt;dev=
.of_node;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dpi-&gt;bridge.type =3D DRM_MODE_CONNECTOR_DPI;=
<br>
<br>
@@ -707,9 +706,9 @@ int dpi_init_port(struct dss_device *dss, struct platfo=
rm_device *pdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 datalines;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int r;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dpi =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(=
*dpi), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dpi)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dpi =3D devm_drm_bridge_alloc(&amp;pdev-&gt;dev=
, struct dpi_data, bridge, &amp;dpi_bridge_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(dpi))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(dpi)=
;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ep =3D of_graph_get_next_port_endpoint(port, NU=
LL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ep)<br>
<br></blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a hr=
ef=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br=
></div><div>Thanks,</div><div>Anusha=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--000000000000b567400634ba7651--

