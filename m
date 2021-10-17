Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD674305DE
	for <lists+freedreno@lfdr.de>; Sun, 17 Oct 2021 03:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907486E56D;
	Sun, 17 Oct 2021 01:31:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA48D6E56D
 for <freedreno@lists.freedesktop.org>; Sun, 17 Oct 2021 01:31:21 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id y207so19062146oia.11
 for <freedreno@lists.freedesktop.org>; Sat, 16 Oct 2021 18:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=FkZ8BDMTGchcGS1E2IMJTlJ/g3mJdDD78OtHNGJ/EEg=;
 b=h9Pokhi4AVZI55uOa2jKdmsv1a9iMYO6Olt4WTnzPXHH1FearCdMb+CLrENVdDFx9F
 r+dk3bWzipc0ifqGDMW8qvRcQGRlZU//OAQbH/kZbfAKAh25odMFAv6FZdL1fDv5ixBe
 0qIlOENPlbW5mFiKP9X5w4oAif6j1ttN8V8Z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=FkZ8BDMTGchcGS1E2IMJTlJ/g3mJdDD78OtHNGJ/EEg=;
 b=SxEnHX2a5KZwyG2TWgZDtjljlG4D2dmFWOuE650u4GEz/9X5HIdooblhvTP5xjraP1
 GAQBEGlQovqE81GW0XoGYFwhYUeb3zdcRtPtyy8+un0ksqFyCUgP58+neq3U/v/D7G00
 mAoVCvIfKFeAVGE9swjjsE4GCmfEWrqnwM61sU7he+DslCZsXOoZPinj2+DVtOW088Yy
 bsFwws5h+xzHCnFx33Z/afgqM/Lxfap6cQ++9PVZY/Qhpg72wAPM0aQS5W+pbqqRpTdA
 GXZBq++0Om8QX1C+svDn3Y4381g29yvFaU/TFhFh4XPu3Zi1lvSkpQ6DMH/o+GhzrIpe
 EW1Q==
X-Gm-Message-State: AOAM530rrwqma2oBqo4h3YoaqTVmOgqpSrhGf8g977PPSv5JU44RkAZZ
 YG4BhtCubxBoPRVedvliIzQ+nMMf7iQ4CRY4tU2VissNVAs=
X-Google-Smtp-Source: ABdhPJyugEUY5uN9Q+jCOvC6LoW1QUtqZ3z4ufKS9HicaDBtN79ngOQb5eAvAKrduNWR9bmcYtqK+pwYIsIhVnOfYlE=
X-Received: by 2002:aca:3306:: with SMTP id z6mr23201636oiz.164.1634434280958; 
 Sat, 16 Oct 2021 18:31:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Oct 2021 20:31:20 -0500
MIME-Version: 1.0
In-Reply-To: <20211016221843.2167329-6-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
 <20211016221843.2167329-6-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 16 Oct 2021 20:31:20 -0500
Message-ID: <CAE-0n51WqRgoY11x_y-LoNAwzaZZWDgWxU4z+bcfRRa7OfaAtw@mail.gmail.com>
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
Subject: Re: [Freedreno] [PATCH v5 5/7] drm/msm/dp: Support up to 3 DP
 controllers
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

Quoting Bjorn Andersson (2021-10-16 15:18:41)
> Based on the removal of the g_dp_display and the movement of the
> priv->dp lookup into the DP code it's now possible to have multiple
> DP instances.
>
> In line with the other controllers in the MSM driver, introduce a
> per-compatible list of base addresses which is used to resolve the
> "instance id" for the given DP controller. This instance id is used as
> index in the priv->dp[] array.
>
> Then extend the initialization code to initialize struct drm_encoder for
> each of the registered priv->dp[] and update the logic for associating
> each struct msm_dp with the struct dpu_encoder_virt.
>
> A new enum is introduced to document the connection between the
> instances referenced in the dpu_intf_cfg array and the controllers in
> the DP driver and sc7180 is updated.
>
> Lastly, bump the number of struct msm_dp instances carries by priv->dp
> to 3, the currently known maximum number of controllers found in a
> Qualcomm SoC.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
