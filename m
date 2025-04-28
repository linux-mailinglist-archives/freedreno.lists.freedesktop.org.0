Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB80A9FAD0
	for <lists+freedreno@lfdr.de>; Mon, 28 Apr 2025 22:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8466810EA1A;
	Mon, 28 Apr 2025 20:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YCpiCoDq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EAE10EA1D
 for <freedreno@lists.freedesktop.org>; Mon, 28 Apr 2025 20:54:05 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b07d607dc83so4653552a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745873645; x=1746478445;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
 b=YCpiCoDq6sPh6svruz0MlsIlBweFs5dqFoLwoEOv5qBH2P0tZpgsJMC2YgkUDl4Qcp
 uwgov61Zu87qoR2jag2VIo/RoERqRSzCL/3QfPPb0ySJ2lIJY4jR5P3xlgSKolGcXR/2
 bCjngBT02j6RgeUPvPNaJRgTCUXyjyx3pfsGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873645; x=1746478445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
 b=CR9IOTqptHL2g1fvrHYqUXsyXtT64+4Ru41tr7f54wGLgx+mrmOWE7Y4fRGCzGs+fj
 +6KfFklkRltvw2A2SElZQf7aNRteUJIGmLbRncWM1Pi8Sfw20LvhlyRqhIIRvZffnIUW
 ShQKoxn2z9w5UIpl0lSbbLTDellCV1FdM7XLACcddOvzjah+aEYIZIY8L8UhUYuTydC5
 Sbwku2z1QUaMbLL6TX3ozJjQP0eFHKTMxEyaWuY1GqaAV1eAs+lhGE6/N60lyxCn/zwK
 QctVDm6JZnbBpVvxjsEPajMV6zIzYUr4J1jZgJqVF8anPn46jWWHtQ6Nht4TixMYkp6P
 Lwkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6DNJERJ8vBqgMmEbNJgd2QlGQWUk403H8545KWtVOKtgbETaHGXlO5D7GPYBh+9amDKuupktFr1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPq2Tey6gqhx8AXFknUPZSFygMOQ5vLO1fAJRF9mMEbKdgpbSF
 8n7GzYYqQVCMXMw8CjVRzPt9g+Ydj7+TR2arOseT8mDDxlvU+IRy8DRp6VTmprVYUUuy5M9VVks
 =
X-Gm-Gg: ASbGncvXUI5rsrg7o1Ilh+Z1YpqMNlzMhAD5wybSDrwSgi54CMTsbsp6CSebW3W2R+h
 c5pj6Wd0OuETNp6cKPfoR2lTVZaWmcthueHqbxYzYVOttPe6uE3ds0E6NcKeYuLV9jXgxxjx33J
 9As2XWJh7zoW9WYAE8OhpALV/Lt1jREio154b0rR7yniYTisM5EpNGsdj7Uocgu+H2UJ8kdJZr0
 MHbPjEwYaZW5Hh9+J/09fKYXs8Td2XKGXgYBEwSLKnscySZJ5MKESUqLZbvNB/b0MWEGwCYK8rv
 c28kK3LxdfUJDeGigQw+kg8WX6a0ZG7ZWyeegKy4i60MlVpjY2+upTyJe5nX5vT0Cei9sG9BlPp
 d02Cw
X-Google-Smtp-Source: AGHT+IEJl2g0V+yE9450LiCN/SP18LMEEAUFNdrpf1hRlLYh9PAQ55FyomqK4iQXCPA1pPTE44gdQA==
X-Received: by 2002:a05:6a21:6b18:b0:1f5:8655:3282 with SMTP id
 adf61e73a8af0-2093e6256aamr1381769637.42.1745873645375; 
 Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com.
 [209.85.216.45]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b15f4b1749dsm7665777a12.0.2025.04.28.13.54.04
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-301918a4e1bso4407052a91.1
 for <freedreno@lists.freedesktop.org>; Mon, 28 Apr 2025 13:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWCHhfCByVSAcFSLrDVLUuO3PYjyy5pwGncML0muKjgbvE3ZMbnZfP8SurGqPD6NkYqQ8EUBoietN8=@lists.freedesktop.org
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
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
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
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
 Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Thu, Apr 24, 2025 at 12:00=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> This is the new API for allocating DRM bridges.
>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that I can still build/boot on a board with ti-sn65dsi86
after this patch. Thus, happy with:

Tested-by: Douglas Anderson <dianders@chromium.org>

Happy to have someone else land this through drm-misc-next or I can
land it there myself.
