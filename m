Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7E03F82DD
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 09:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BECB6E529;
	Thu, 26 Aug 2021 07:06:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B536E529
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 07:06:37 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso2285893ots.5
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 00:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Fec8a8GcTBAqynn2ZZ7COpqa2SBkQGSlbtis8MeqbXA=;
 b=hBr3EdLiF710gt5w/7Ti6OPVvPt7kJNDQbZDuHcQcwmEP36zonNG1PzQEOnSfQmh6R
 LqyeSucKdE+WhY3M35Oe0js8ljT7e5Uhvty6o8QZNtmw0ZZK0TwNKIAhq0SQM+iQOS5q
 pBT8x6egV2yIYFMfJglx/8pEwVoidmAkWS8WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Fec8a8GcTBAqynn2ZZ7COpqa2SBkQGSlbtis8MeqbXA=;
 b=DSTv2YMpsow4BLuHlW3u664y5v50ENZpt2nr1+sotDCg3NJGL5UU0Va5A36tB1O3ls
 Jhji+0q9zkzaoeQfNZcpGTvvfNVeGqXsL3KsTyfwE3/bgwjRZBI75SD1GJ6pVFmljBWq
 SyWyTiVbQsAXIrN0reiwncfGbECabEcv2OJFQf6yrV9Wtyw1z82ZGSZ+d2fL2oqu5pMr
 JvYwPbUWtfzoC7o3Lg00p+jaPJHnPJLmnBqW8YVN7NbnD9eY5xWIQoayZVItjNoao2Y5
 fyVUyzOrprTN/Gi8DjIRknpCWa3UU9ATrtBwYlJsYeoNcDTEe+tiBBS91tw1gG9fv6KS
 GMCQ==
X-Gm-Message-State: AOAM5313Vcrpn33onDpZ39XX9Z3HKpUO1zMCGOQZBF88TWnDJD+IgzRT
 HHFqiUXwCTgceMkPmVFixnSECokMwzMqD5VEJ0kxdw==
X-Google-Smtp-Source: ABdhPJxX2h4Sf0+gqNiQoqCR55xo9CLNG4eyz7rKWgznAHyCt52DcMIUBYImUTQuoIE/k/3zVeRSzxCSsUkwkxlhKnk=
X-Received: by 2002:a05:6830:88:: with SMTP id
 a8mr1891301oto.233.1629961596490; 
 Thu, 26 Aug 2021 00:06:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 07:06:36 +0000
MIME-Version: 1.0
In-Reply-To: <20210825234233.1721068-3-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-3-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 26 Aug 2021 07:06:36 +0000
Message-ID: <CAE-0n50X5vKU7arknufaj17YQ0UspET_oN9u+if89q4Y-DvTUA@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/5] drm/msm/dp: Modify prototype of
 encoder based API
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

Quoting Bjorn Andersson (2021-08-25 16:42:30)
> Functions in the DisplayPort code that relates to individual instances
> (encoders) are passed both the struct msm_dp and the struct drm_encoder. But
> in a situation where multiple DP instances would exist this means that
> the caller need to resolve which struct msm_dp relates to the struct
> drm_encoder at hand.
>
> Store a reference to the struct msm_dp associated with each
> dpu_encoder_virt to allow the particular instance to be associate with
> the encoder in the following patch.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
