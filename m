Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CC1AB2410
	for <lists+freedreno@lfdr.de>; Sat, 10 May 2025 16:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA2D10E078;
	Sat, 10 May 2025 14:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Hxm1adXd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67D710EACB
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 19:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746818976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EeO2G/lhUp0fvXv3rAWysdL6gOIA9pKqHAwh5CmMO38=;
 b=Hxm1adXdOd9WckKXrxE5WJSe3NwR6MvWkKI4T38Y8DPjm1yXLIKE+twPxnowzB+BHBS5AQ
 deTnA5r/yBj1I4UZkhew84s2nS+N+/ab2NpnK+c+6LUJnuXw3LZ59jvQKsSidhTGsFVBLl
 ZAw7KxVvEHy12YwT+zv2tZGQx3Rm3zs=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-6LPe4Z7WO4mu5jY19N-fNg-1; Fri, 09 May 2025 15:29:35 -0400
X-MC-Unique: 6LPe4Z7WO4mu5jY19N-fNg-1
X-Mimecast-MFC-AGG-ID: 6LPe4Z7WO4mu5jY19N-fNg_1746818974
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-7075bbaa916so36200027b3.1
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 12:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746818974; x=1747423774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EeO2G/lhUp0fvXv3rAWysdL6gOIA9pKqHAwh5CmMO38=;
 b=CHkJ/W0v32MsPGkHYVNC+rcbOKWUV6mP8953epmbBznIoF8GPEIu/vS0o1HTls0mzl
 81Lmj7VVaYr1yfcEOy+RHz9Ox/dqsH27GavcvCakUo9cC3rM7V6s0nxgZqIUKdGh6yKX
 Tn8+x4tKxQ3fMVOMkHa5lKrKZG/WUADJOFtdeVhGcCZaBJjl2cFmqQYwjybQxN920zX0
 0Nb1rebmY0lVwRr9ndre4DT/GmhbNDJbQylBdjxY9DdMBoMbfpMNCbGdpUyslH2CDldc
 /P4w5gsCbpxy6yUaL+peGEBWMlGRIuuPvhU+kvWzFta6GGVqZhJS4hCV2BxzvX/z6FNW
 Ii6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzTW6wF9GSLaIuBBqAfHHLML5WpTXI+QQlW3nlmRnb13dntd57qcYS1zcUXbEIouUTiTA7BQ+S/xw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKmy8jcy4VitP+prSjEAVm/n+VQ0RbfJlpJ5ws5B6Nez4uXaDt
 K2O96vEszsEVegqZhmq4PqunOnS3Rkpofluq5d3xasXBWJ17Mu5J54zNzeuY4KJ+mb0OM4LYNzC
 Ik49XYxvaEMt9ujfKUGbISo6bFdNnmi0nH04RtmbUCd88eIbyjCxlYWQD+W6yJMtT55+hqz9VxO
 UlOsulnp6AdZC1IL5FPdqzO4nPUvOEpBBwtAcGVGoH
X-Gm-Gg: ASbGncvOCP/CwJ3MmizeYwkme1kJ/DinJd70/ZAOvBwPiDb1CRSYBA+MkwgDB0PmX4S
 ObZ+KeshX4ffrB5hJ5rpGm6m3a4KyWmETUWsMIQWC5InieP4Wgf3cRWWOE+MPinrKkPg=
X-Received: by 2002:a05:6902:e92:b0:e73:71b:72f0 with SMTP id
 3f1490d57ef6-e78fdc4e2fcmr6108674276.9.1746818974568; 
 Fri, 09 May 2025 12:29:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+7fws5TA4mVh5ocXWRZzFUs/OIGtrMcL76jc2c3ct6B3jN6ukgxli2N8OqVa3oFfcQPsz93peY7PKT/AwuOs=
X-Received: by 2002:a05:6902:e92:b0:e73:71b:72f0 with SMTP id
 3f1490d57ef6-e78fdc4e2fcmr6108614276.9.1746818974149; Fri, 09 May 2025
 12:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-3-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-3-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 14:26:14 -0400
X-Gm-Features: AX0GCFu24hR8J2U03NXjuAhnS6iurt_eMN47OaDzmkhI_jPjCeztvZ2zuh4Tk8Q
Message-ID: <CAN9Xe3T6WJmjXXLa=Y_qTXc253DG8dCw_u_rr3mYr3Qap==BaQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/22] drm/bridge: anx7625: convert to
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
 "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Jani Nikula <jani.nikula@intel.com>, Pin-yen Lin <treapking@chromium.org>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, Xin Ji <xji@analogixsemi.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9cr5ft2pKCiglguJHX4r4kEIo4q3Z-d0QBgQRYOh7JQ_1746818974
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000071104f0634b8fc83"
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

--00000000000071104f0634b8fc83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:56=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com>
wrote:

> This is the new API for allocating DRM bridges.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Looks good!

Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>


> ---
>
> Cc: "Rob Herring (Arm)" <robh@kernel.org>
> Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
> Cc: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index
> 8a9079c2ed5c22565d0733ef899119e347947d21..0ac4a82c5a6e5e665d913674b664905=
a96c0d8e6
> 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2596,7 +2596,6 @@ static int anx7625_link_bridge(struct drm_dp_aux
> *aux)
>                 return ret;
>         }
>
> -       platform->bridge.funcs =3D &anx7625_bridge_funcs;
>         platform->bridge.of_node =3D dev->of_node;
>         if (!anx7625_of_panel_on_aux_bus(dev))
>                 platform->bridge.ops |=3D DRM_BRIDGE_OP_EDID;
> @@ -2630,10 +2629,10 @@ static int anx7625_i2c_probe(struct i2c_client
> *client)
>                 return -ENODEV;
>         }
>
> -       platform =3D devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
> -       if (!platform) {
> +       platform =3D devm_drm_bridge_alloc(dev, struct anx7625_data, brid=
ge,
> &anx7625_bridge_funcs);
> +       if (IS_ERR(platform)) {
>                 DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
> -               return -ENOMEM;
> +               return PTR_ERR(platform);
>         }
>
>         pdata =3D &platform->pdata;
>
> --
> 2.49.0
>
>

--00000000000071104f0634b8fc83
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
<br></blockquote><div>Looks good!</div><div><br></div><div>Reviewed-by: Anu=
sha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com">asrivats@redhat.com=
</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
---<br>
<br>
Cc: &quot;Rob Herring (Arm)&quot; &lt;<a href=3D"mailto:robh@kernel.org" ta=
rget=3D"_blank">robh@kernel.org</a>&gt;<br>
Cc: Hsin-Te Yuan &lt;<a href=3D"mailto:yuanhsinte@chromium.org" target=3D"_=
blank">yuanhsinte@chromium.org</a>&gt;<br>
Cc: Jani Nikula &lt;<a href=3D"mailto:jani.nikula@intel.com" target=3D"_bla=
nk">jani.nikula@intel.com</a>&gt;<br>
Cc: Pin-yen Lin &lt;<a href=3D"mailto:treapking@chromium.org" target=3D"_bl=
ank">treapking@chromium.org</a>&gt;<br>
Cc: Sui Jingfeng &lt;<a href=3D"mailto:sui.jingfeng@linux.dev" target=3D"_b=
lank">sui.jingfeng@linux.dev</a>&gt;<br>
Cc: Xin Ji &lt;<a href=3D"mailto:xji@analogixsemi.com" target=3D"_blank">xj=
i@analogixsemi.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/analogix/anx7625.c | 7 +++----<br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/br=
idge/analogix/anx7625.c<br>
index 8a9079c2ed5c22565d0733ef899119e347947d21..0ac4a82c5a6e5e665d913674b66=
4905a96c0d8e6 100644<br>
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c<br>
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c<br>
@@ -2596,7 +2596,6 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0platform-&gt;bridge.funcs =3D &amp;anx7625_brid=
ge_funcs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 platform-&gt;bridge.of_node =3D dev-&gt;of_node=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!anx7625_of_panel_on_aux_bus(dev))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 platform-&gt;bridge=
.ops |=3D DRM_BRIDGE_OP_EDID;<br>
@@ -2630,10 +2629,10 @@ static int anx7625_i2c_probe(struct i2c_client *cli=
ent)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0platform =3D devm_kzalloc(dev, sizeof(*platform=
), GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!platform) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform =3D devm_drm_bridge_alloc(dev, struct =
anx7625_data, bridge, &amp;anx7625_bridge_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(platform)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEV_ERROR(dev, =
&quot;fail to allocate driver data\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(plat=
form);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pdata =3D &amp;platform-&gt;pdata;<br>
<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--00000000000071104f0634b8fc83--

