Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A953CAB2412
	for <lists+freedreno@lfdr.de>; Sat, 10 May 2025 16:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EB710E0C9;
	Sat, 10 May 2025 14:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WcOzVVez";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D131710E105
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 19:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746820344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3vE0/6Pj+61VPlyLz7h5R/qWMMebiHV585td+IpLLBg=;
 b=WcOzVVezaCM4hkCnN3BMD0P9/JfF/wlpaaBxJkIdcZaXTr+R6FbaUHuMomfe8HNYnqAOLL
 Lqt6F+mmU84HuTLNK1/FypS8Bkt0NE3TAavqPqEQiuoOp29uQK3RbO+3CJm6N8HZnLZXYz
 /0QeVOoDJFPh+lLxaxDZ5m8OKFdMmow=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-XoKSou_3Pq-lMJhyTDxqtg-1; Fri, 09 May 2025 15:52:21 -0400
X-MC-Unique: XoKSou_3Pq-lMJhyTDxqtg-1
X-Mimecast-MFC-AGG-ID: XoKSou_3Pq-lMJhyTDxqtg_1746820341
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-70a51a20a1fso3015307b3.1
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 12:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746820341; x=1747425141;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3vE0/6Pj+61VPlyLz7h5R/qWMMebiHV585td+IpLLBg=;
 b=Jf+ZiDySIM3iF9S4czAsKpzE3IbjuNTkAUj4lKx7JzlC2F4FzsyuOlCAnOdDxMGvXG
 39qfhkSI5ZL0hS6a4AcrbBUhTdpWkZ4Bw6GQbgn8u6EF/HcickcTkD0gp5hAp2j9LRBu
 rxvVGO0CDGJBw2m6UIdICwIq/PB73UiXfv2dLMAOKz5vvA0+eyimgsKx5ZlB0KgBzYEV
 l2APRFrXp1vn1fLsOfGv0pAt7UlXe6ajq8ajygq3e8vMWcbmIFvJLkbifuG8MqY1wy/F
 s9wbKNSAEdcGCiD2wH/tc2Y8BB8hLZvw0Q0mGybPXLYznAZyPEDADFzJlAkUM+g8jHFW
 8oJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJRvvbtCdZlLuY/dd6BR5lecnPx/fy0+5+zgLc+DZaAcEQHeIL4AKAbyqkobcZzqihEEXbtk3Yj3o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRvWdclecq5Ofj8aThijOWUhibHTIDNC9vli/zLKAjruGpokyF
 NhbdDUnM5YuK7vsC7H6I6nWUXmq1JHk1kJYetpWD+WCQdPYGR4Jbl40K2HTDXq0cKZGzqutFWY6
 SCPsdesD0nivZy/6Qfpg+iDrUH+o4Dn8rF8wJvEHrjJcuBNa9SOjR7qZTylLxjJr1SoYO0Z9J6N
 yr5yKrNrD5Tth+gWSsPionnHoHK316R9izjg1XgQ/l
X-Gm-Gg: ASbGncu5CaonqRLHomfIrtLWscoP4qdcg95/AmHNd05wciSyddD24YNQdmWZOFRdatY
 y7IwU1MFysyoSw/R+iRfgdtIbEn8tfls/V2PtwZgJ3y4osdaHW+QBjjHYo38grzSt47I=
X-Received: by 2002:a05:690c:3703:b0:700:b007:a33e with SMTP id
 00721157ae682-70a3fa35c34mr70580387b3.16.1746820340988; 
 Fri, 09 May 2025 12:52:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC0DQtfZer1s8WwuAvy5jnVdxcwwQL/obDFoxp/4pNvDHhS41o78nZLGWDEe5iMAgCmeGcNcnilGM5zXpvfJI=
X-Received: by 2002:a05:690c:3703:b0:700:b007:a33e with SMTP id
 00721157ae682-70a3fa35c34mr70579597b3.16.1746820340021; Fri, 09 May 2025
 12:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-5-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-5-b8bc1f16d7aa@bootlin.com>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 9 May 2025 14:48:59 -0400
X-Gm-Features: AX0GCFsJF80p2L07AVq8o4PxcvpfTfJkchc-7guLHKrPsZV_s9GdXIanRE7r2lY
Message-ID: <CAN9Xe3SQbH4gnKdDJvOiZ82+5t+L+d_Srxd=p=aYAH5vY7F4Dw@mail.gmail.com>
Subject: Re: [PATCH v3 05/22] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw:
 convert to devm_drm_bridge_alloc() API
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
 linux-stm32@st-md-mailman.stormreply.com, Ian Ray <ian.ray@gehealthcare.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AGtI4JTgsUUAWeMLaVhYgiL_Frn-szW2IrOt-Ju9ERo_1746820341
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000da95ab0634b94dcc"
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

--000000000000da95ab0634b94dcc
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
> Cc: Ian Ray <ian.ray@gehealthcare.com>
> Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> Cc: Peter Senna Tschudin <peter.senna@gmail.com>
>
> Changed in v3:
> - updated Ian Ray's e-mail (old one is bouncing


 ^^^^^^ you missed closing the breaces here.

Code changes look good.

Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>


> Changed in v2: none
> ---
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 11 ++++------=
-
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index
> 15a5a1f644fc10182c55bc9e489ccb81d4f924f9..81dde9ed7bcf7cacae000d9da31a3a5=
c347ce037
> 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -225,13 +225,11 @@ static int ge_b850v3_lvds_init(struct device *dev)
>         if (ge_b850v3_lvds_ptr)
>                 goto success;
>
> -       ge_b850v3_lvds_ptr =3D devm_kzalloc(dev,
> -                                         sizeof(*ge_b850v3_lvds_ptr),
> -                                         GFP_KERNEL);
> -
> -       if (!ge_b850v3_lvds_ptr) {
> +       ge_b850v3_lvds_ptr =3D devm_drm_bridge_alloc(dev, struct
> ge_b850v3_lvds, bridge,
> +                                                  &ge_b850v3_lvds_funcs)=
;
> +       if (IS_ERR(ge_b850v3_lvds_ptr)) {
>                 mutex_unlock(&ge_b850v3_lvds_dev_mutex);
> -               return -ENOMEM;
> +               return PTR_ERR(ge_b850v3_lvds_ptr);
>         }
>
>  success:
> @@ -264,7 +262,6 @@ static int ge_b850v3_register(void)
>         struct device *dev =3D &stdp4028_i2c->dev;
>
>         /* drm bridge initialization */
> -       ge_b850v3_lvds_ptr->bridge.funcs =3D &ge_b850v3_lvds_funcs;
>         ge_b850v3_lvds_ptr->bridge.ops =3D DRM_BRIDGE_OP_DETECT |
>                                          DRM_BRIDGE_OP_EDID;
>         ge_b850v3_lvds_ptr->bridge.type =3D DRM_MODE_CONNECTOR_DisplayPor=
t;
>
> --
> 2.49.0
>
> thanks,
Anusha

--000000000000da95ab0634b94dcc
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
Cc: Ian Ray &lt;<a href=3D"mailto:ian.ray@gehealthcare.com" target=3D"_blan=
k">ian.ray@gehealthcare.com</a>&gt;<br>
Cc: Martyn Welch &lt;<a href=3D"mailto:martyn.welch@collabora.co.uk" target=
=3D"_blank">martyn.welch@collabora.co.uk</a>&gt;<br>
Cc: Peter Senna Tschudin &lt;<a href=3D"mailto:peter.senna@gmail.com" targe=
t=3D"_blank">peter.senna@gmail.com</a>&gt;<br>
<br>
Changed in v3:<br>
- updated Ian Ray&#39;s e-mail (old one is bouncing</blockquote><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^ you missed closing the breaces here.</div><d=
iv>=C2=A0</div><div>Code changes look good.</div><div><br></div><div>Review=
ed-by: Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com">asrivats@=
redhat.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
Changed in v2: none<br>
---<br>
=C2=A0drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 11 ++++---=
----<br>
=C2=A01 file changed, 4 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/dri=
vers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c<br>
index 15a5a1f644fc10182c55bc9e489ccb81d4f924f9..81dde9ed7bcf7cacae000d9da31=
a3a5c347ce037 100644<br>
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c<br>
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c<br>
@@ -225,13 +225,11 @@ static int ge_b850v3_lvds_init(struct device *dev)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ge_b850v3_lvds_ptr)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto success;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ge_b850v3_lvds_ptr =3D devm_kzalloc(dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si=
zeof(*ge_b850v3_lvds_ptr),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GF=
P_KERNEL);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ge_b850v3_lvds_ptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ge_b850v3_lvds_ptr =3D devm_drm_bridge_alloc(de=
v, struct ge_b850v3_lvds, bridge,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;ge_b850v3_lvds_funcs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(ge_b850v3_lvds_ptr)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;g=
e_b850v3_lvds_dev_mutex);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(ge_b=
850v3_lvds_ptr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0success:<br>
@@ -264,7 +262,6 @@ static int ge_b850v3_register(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D &amp;stdp4028_i2c-&gt;de=
v;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* drm bridge initialization */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ge_b850v3_lvds_ptr-&gt;bridge.funcs =3D &amp;ge=
_b850v3_lvds_funcs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ge_b850v3_lvds_ptr-&gt;bridge.ops =3D DRM_BRIDG=
E_OP_DETECT |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DR=
M_BRIDGE_OP_EDID;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ge_b850v3_lvds_ptr-&gt;bridge.type =3D DRM_MODE=
_CONNECTOR_DisplayPort;<br>
<br>
-- <br>
2.49.0<br>
<br></blockquote><div>thanks,</div><div>Anusha=C2=A0</div></div></div>

--000000000000da95ab0634b94dcc--

