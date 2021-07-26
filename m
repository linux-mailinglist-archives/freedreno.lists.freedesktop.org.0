Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB12C3D6A71
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 01:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB846EB47;
	Mon, 26 Jul 2021 23:55:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88FE6EB3A
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 23:55:51 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id l126so13079691oib.2
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 16:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=aoD4jTfRbzylcA4bNLcfmr8Z+HRIOIxaPk90sso0ATU=;
 b=eQQhbr+z1dG29juiKiHPhvhbjUjYibakqGnSF4idMAK1hnTXJ3j2IVeHu37sbE1AIk
 nD5EMYai5v4xcjYBOPRRpBYhe50X/rIN3mKJ47uQiui9FNJ9cJ9Il+q1PE1UEpMocrOf
 Jokd9Bk5aK4znpuUCHl2Q09JwDeYHuWxCthT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=aoD4jTfRbzylcA4bNLcfmr8Z+HRIOIxaPk90sso0ATU=;
 b=efVe4HK/g+NDMaVf0qAWm4dPLzbS73DKxIOx5KwiSOhbD02qx+pIdJ+Ze3obO+LM4I
 rGyrYQt9lheooqg2nu1rnzf8jCAmPW/JsWO2LgeDGaV6lUwdsKHX7Nno+I5etAFBvSkm
 op48wuHefZtAdNh3qGYO5RUgGAU7Gcm2EWx9QAnNbm+PWLLXe8fjca7oB9m3GeY+T/83
 UaeDpoaf91xvMzSUf+F5CjVf2Z7L63VyKysoVu8jz8JXy2UXmq4hsuXxRSBf5+H0cmVS
 foXaY4tQIgplHniiP+hnRivb8lCENAtg1ac1NleELH8X8OvqVJF/64qBKBv3PP9Twnqf
 K0XA==
X-Gm-Message-State: AOAM531wM+X5zcEbaGLy72xqohB8YD3lrlgnq8R/EA08VXui3YXgzbZp
 EiJVMqDJ9249H1NNKCogeiKXcER1Ynrzz2a5SxjpLg==
X-Google-Smtp-Source: ABdhPJw65cG9TGz3WiBUJWp99aUzz4g/0pjfJNvmUosztg4FLwuh1PpAx+TFNVLnqwkG0FMULV596wJRHK85NE7MZGk=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr1129053oib.166.1627343751055; 
 Mon, 26 Jul 2021 16:55:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:55:50 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-3-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
 <20210725042436.3967173-3-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 19:55:50 -0400
Message-ID: <CAE-0n53utmLLoJqqffx_-MoiereWAeBFe9nPjAizKeuKRwedHA@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 2/5] drm/msm/dp: Modify prototype of encoder
 based API
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
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-24 21:24:32)
> Functions in the DisplayPort code that relates to individual instances
> (encoders) are passed both the struct msm_dp and the struct drm_encoder. But
> in a situation where multiple DP instances would exist this means that
> the caller need to resolve which struct msm_dp relates to the struct
> drm_encoder at hand.
>
> The information for doing this lookup is available inside the DP driver,
> so update the API to take the struct msm_drm_private and the struct
> drm_encoder and have the DP code figure out which struct msm_dp the
> operation relates to.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
