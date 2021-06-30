Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DE93B7B0B
	for <lists+freedreno@lfdr.de>; Wed, 30 Jun 2021 02:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93CA6E90F;
	Wed, 30 Jun 2021 00:36:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D836E90F
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jun 2021 00:36:41 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bu19so1662965lfb.9
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jun 2021 17:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jtVW5NMocB6oVI0WMovmBROwRBfdKl6IUOMqibW9evQ=;
 b=PfDwdfd658Y+9K8gvsYqLkb06cvO9vPX5vmZFKpgJfEU1JV8IJOHOPB/fT9gQgKia4
 CkwaR7y+3Y3sRHa1Ei3aG16+gGPQ8ellOWAofRnxXTxEphjDYqv1CvVWGiY1H2QyxJlO
 LNN65ZIV4H4+qPr/vzxELakfbfrYCNxdUuw8FlW01wdyTO9QgR55wE2WFhtmfVqmraX1
 6dsMXQqqoSbmasHFViuFkp9x9AiAQBLFBuy8aCFxO5dfncSXXyX55TVezt+pCUhXsQ8J
 9lI0d6qy92Ma9mvUYjuBxQjQw4ace0MWZURMPTZr0T5fK/9N6n3m5y70GsyXUxOFlmCr
 SukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jtVW5NMocB6oVI0WMovmBROwRBfdKl6IUOMqibW9evQ=;
 b=HMcQhswIsjoF+A/vRY4IoUkAEd0kAJwKIKszZvDjp3cMQf/mK54HmjKrlVfCwbA5tS
 K8yHSE5sIAgg8wxpl5ybkNvQz2Ar68IJ1GuYmhGl7HXKBx5L1+M5ULzgB8x80oYzfsWR
 34/6woLBrrFc/5N2YJdCCBNJEEqjzcGULiBLW5Hkpqx3zHgpRBHc0KhrqqkqaEiTXDrQ
 yhD0bXCQYNFtwEa4qvJ7uOLR5F9UcJ36ZVA0hzhEeWwtT4dPwmM5MBM//HsWbD9gow+L
 IrqCmSgVTcJ3lf0N30zkYOhJr7KOKerIAiFU6LkkDYSNx9dz2/RyFwhwMeDTbTO9VxFa
 VrgQ==
X-Gm-Message-State: AOAM533RUUz6U8JFhQv+G7CcSDJA0vFa1UZWlhpOTkschCHrS/un9s/j
 5Oc9aLcJHpj0CRbm57yT4ryg3R6thup2oKKPglP3xA==
X-Google-Smtp-Source: ABdhPJz8oylr1QBk4wbq+S09hbJVugu5jPx8c6IPCGHmiauvztZvUu2BOO8drcRIghnbm2IY/6t/MC8MygbdQHfkED4=
X-Received: by 2002:a05:6512:3c9f:: with SMTP id
 h31mr15414133lfv.465.1625013399992; 
 Tue, 29 Jun 2021 17:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210629074703.v2.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
In-Reply-To: <20210629074703.v2.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Jun 2021 02:36:28 +0200
Message-ID: <CACRpkdbRjg1PMMWPc_5fW+PKG4SQGkaesK4++MHUWTw0MdMkxg@mail.gmail.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [Freedreno] [PATCH v2] drm/dsi: Add _NO_ to MIPI_DSI_* flags
 disabling features
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Clark <robdclark@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, MSM <linux-arm-msm@vger.kernel.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, Xin Ji <xji@analogixsemi.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jun 29, 2021 at 1:47 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> Many of the DSI flags have names opposite to their actual effects,
> e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> be disabled. Fix this by including _NO_ in the flag names, e.g.
> MIPI_DSI_MODE_NO_EOT_PACKET.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
