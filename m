Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FA9B022FA
	for <lists+freedreno@lfdr.de>; Fri, 11 Jul 2025 19:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E968610E3AF;
	Fri, 11 Jul 2025 17:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jhal1+Be";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A4510E2D1
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:44:50 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-32cd0dfbdb8so19392231fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752255889; x=1752860689; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
 b=Jhal1+BeUCQBBPSSrVMI6FH3NAjuyXhPQq6PHAMWKeXpOhJrXbviXPsG7FjD3M8kWS
 em8I8nVR/Q6v8Q5+Yzi/58MlI0QIMm1YXAmhZQR72WD9TalCx6DZq+xEXuoUsIMFjB9T
 uBia/amJ1JWX1zKvhTOoVOwA32BlN1QL4HqCszbh8AQWpj5fo3VjAIM1JY9XCmK7RucF
 Guf/gsMTzdCQDO/S71ig1+mPYiDvtuOBKwHprhE1r4qheDyRM8RNxnCWIfioF4WDA9qS
 9jT3O80uqw75DaiEQbEmnkU3jkaQwdMosv9AJD0nFsX5YJprqULp7ZpdQCSU+UUNIejl
 eAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752255889; x=1752860689;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
 b=qZOewoTUxQJxfU7QXj7H5uMuPzfUEiUjV2SpZWlfT/VTIgsekIBuqxxMhem+15O5em
 q0cB47V2w8Oktofcy3umii6sKpkD241FwDcfWeNaOT+FXPxQXXl83/22rXZo8L7dA3Oz
 04EdEtux7rUU6ZK2agfBdOB+eNR+X8sBMyf3pAJ9RiA20fEKZUx07IKKZAuWrsZR8DXf
 ngDGWAOzD6XQ8MsUdP/eYKBdkvz7Kt+88Zr5lkt9UWUJ/XeFWrHx3TwNnXu5Q3dT2Xgh
 yeNAJOg0iFjqAEHElANHKAPQ9hzH09Sx1NJzK20xBiw5SAx5F34kzoZQ1d6/+eQtO4jt
 0sKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPcgKXlh9P76kEkBGkJmVPlkzqMeccThvhkfqatIPtsL9sUQ+m0ZAeLafqcBSKDx1BJ+fpbBK4Cbw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsXSQ4NrMP9yKZkqqOwBssoamLkJcbv5jF0q9ZOa6GKH6eDunH
 FQe+QAOB+YvX/CLyWCjzWNK43C7SR5enKHVYO5+pU9TD7eAJXH5rmSf5MQEru11xwJTJCw7ah3o
 npT+xAW+3ubl8wK3ORJ3lsYoaCZJTEctKxOCmMOQXhg==
X-Gm-Gg: ASbGncvWLaD4z3E2NG3+8hMnYZmmab46o3y4dAvmRzSu+1nklDKLMUpyBQierpBgOE6
 aE04KCLTYSPB8X7MCs1e0eI29vWUI6w+XZjYh5jcnUjEkl/3K0HMI/0XqCdTLeY2ZJBI0Lt1tIN
 KCiwN+aF6tJtp0pqWduXKeOvZIUIbdzVXDFQDJC4EbnAgfnw7Wl4T7t7R/G00BYlIJ5wTn/9QSC
 5m9D0o=
X-Google-Smtp-Source: AGHT+IH6ZOzBfHIgYUwgOc3NHyt2gji+Em8NzLEp8xFU4pLvltizLDn2SrTtw5BwtYgzrpRFDHd1anYmDStmm3/BYxA=
X-Received: by 2002:a2e:ae05:0:b0:32b:75f0:cfa4 with SMTP id
 38308e7fff4ca-3305343ffbdmr14799021fa.25.1752255889239; Fri, 11 Jul 2025
 10:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:38 +0200
X-Gm-Features: Ac12FXxUNTUQvVOGg3MoOkpShRe7WywXW6kbpP4WvN3P-CcJwwv5gR7MoObTWCg
Message-ID: <CACRpkda3R+2hhzvd+snkTGrRb-gZ8OUvzAhFE5Cg6yXfZ+E4nQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/pl111: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev
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

On Thu, Jul 10, 2025 at 7:43=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
