Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F2343D0CE
	for <lists+freedreno@lfdr.de>; Wed, 27 Oct 2021 20:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6425089B03;
	Wed, 27 Oct 2021 18:34:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F96989B03
 for <freedreno@lists.freedesktop.org>; Wed, 27 Oct 2021 18:34:18 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id h11so6289764ljk.1
 for <freedreno@lists.freedesktop.org>; Wed, 27 Oct 2021 11:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oMasC2rgckEWdCe4DVz6in+O9oEmCriK7Q/BDKT8+60=;
 b=BU9c4Kt2klb9pGlGYSH6N2/niQ4oNqfLZ0U1NjtsaTgg7k2zPmvXxZMNe4LsT/a25Y
 FIhGhLYGlcZIbZ5j7j/wImxQN0EpLG2rhMuMjkY2ZOZtzRN9RqqqM2Z5uaL0wHre6mWM
 X7XRH+g6SO72fi7HbBdQdNVRGP6vVPJBwpQNB051MQ98oMp8EsGzZR8rkERWdlg/ct9o
 ddJXJKuqCo1GoTk5cB29k6H24t/jtwCG/qx/JiEgo0fh9G2BeRlLJWBsA8+ncOvhsWK7
 4aJySPcTUrOnoJ4Ah5b9ngmkz6HfI8+bB1S/leVgn/9yzaNvwSOGDWeh+h8NSiDjQk22
 DXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oMasC2rgckEWdCe4DVz6in+O9oEmCriK7Q/BDKT8+60=;
 b=O/oSpz+BV9DpVT62jr0Bk6RxNdgjdxYp9p4Zasd6Pta9QW3Q+qZv+WNwa07Fn6ZlGu
 KgGo+41Oa7+0TTsaejMsH0fOQicahb6T/DU5puno05SU0M+7bYEys+77BwF2FYeiHUtN
 GtCvH/JwBHJFlwACOFTrtTj0CqjcaQxTI5R2+gtR0Oy7+Ozww96xwCFh2eh/MwDn4nyj
 z00HCR3NSNpiweUOrK+PPYvGIFzHTe+RMbpI2+ZTjKcXgEER7kUkJt7ZftxfpKSynX3J
 BP7cAPbJ0QUDoz8M5Q+sfdEPOCXZHq8E3YfyTVMje592UeSGVvtpPxEM2SpbwxRRDBio
 YQ2g==
X-Gm-Message-State: AOAM530qS86i+QStzE5KqpQwPLRbt89dWK64bWSqpkTJeF/zvBbst6pZ
 JQRTV4bm9avS5FLcdbLdehETOXm+YVyvmGM26hIvbA==
X-Google-Smtp-Source: ABdhPJydr0p5R5kOrBi0cKjyUtJDjfb0NxbOwZhHcj6m+H19kxZT9BRZop/bB7yZsgjxXgCMaOYdHA2FjRV6asLzles=
X-Received: by 2002:a05:651c:389:: with SMTP id
 e9mr14617679ljp.61.1635359656666; 
 Wed, 27 Oct 2021 11:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-21-maxime@cerno.tech>
In-Reply-To: <20211025151536.1048186-21-maxime@cerno.tech>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 27 Oct 2021 11:34:05 -0700
Message-ID: <CALAqxLXG5R2ZN9gfFsGTLfdY8mhNhh=o8f1w5Axo8NSw8QanAQ@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 linux-arm-msm@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, 
 Rob Clark <robdclark@gmail.com>, Tian Tao <tiantao6@hisilicon.com>, 
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 Xinliang Liu <xinliang.liu@linaro.org>, linux-kernel@vger.kernel.org, 
 Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 20/21] drm/kirin: dsi: Adjust probe order
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

On Mon, Oct 25, 2021 at 8:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Without proper care and an agreement between how DSI hosts and devices
> drivers register their MIPI-DSI entities and potential components, we can
> end up in a situation where the drivers can never probe.
>
> Most drivers were taking evasive maneuvers to try to workaround this,
> but not all of them were following the same conventions, resulting in
> various incompatibilities between DSI hosts and devices.
>
> Now that we have a sequence agreed upon and documented, let's convert
> kirin to it.
>
> Tested-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

For this patch, and any others in this series folks see fit:
   Acked-by: John Stultz <john.stultz@linaro.org>

thanks
-john
