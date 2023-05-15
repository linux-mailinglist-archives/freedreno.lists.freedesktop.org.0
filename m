Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 283E6704022
	for <lists+freedreno@lfdr.de>; Mon, 15 May 2023 23:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29FB10E298;
	Mon, 15 May 2023 21:57:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D2710E298
 for <freedreno@lists.freedesktop.org>; Mon, 15 May 2023 21:57:41 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-55a6efe95c9so189696747b3.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 May 2023 14:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684187860; x=1686779860;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZjFA8JG+boBHtApx1W1Y1Xhnw+KcbpR1DWdRqTv9O08=;
 b=whHh4H0na5gYCL8b5GzIJnareJWs9QEZGYrfFV4AaQaY8C2oGojtV0xpPAGdtZbFyh
 CdSDukMo9OWdIsJ+GzgLUW7m7mijnipvAAn6NLfYnYdzndDawGxhX3zKHsAH2hC7TqdJ
 uRJZlw1ShqYNQfRkVJXiJ5N0sFnOI+tVYN96rQ0rRxoPTuoauLlAgGmlSUdTTlOp4MZu
 BaqzBscIH6qM29AlXU2TeoNvyyrFnbYznPKL+T3gMUsNtEjf24VfOuy/8TcGaIEtrzSo
 LYWnMbQaSn3BVr2a4MjOF2w1y0/INjddCDp6k21CELNkt959rBc8/5/QnKHA6IrpZFMx
 XPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684187860; x=1686779860;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZjFA8JG+boBHtApx1W1Y1Xhnw+KcbpR1DWdRqTv9O08=;
 b=HHrQjwElt0nSy35gmfbVa1+oqtiZPJFYcjjaw7Wf6BRIska4e9J5msCFB/U6FeYkPs
 jfuj2abny5bBKHuMGL3Mrg66lrCOM+VbOwo90Ml1BuKg+RGq2ugNujOc+oA32/G1ENFH
 HpMGiQvxhlTtmJRFuHtTFmx5TiM7du0GKaC4amAs05X84RIZgcK0qv2HbEWaj6K0SaKN
 H7nOzUt5q3Ug7GXBBYdhm9mMUpJ44xgd1MANpdeXpUuEgjGi6tuGn2nHDOAk100/NPTc
 6qGZNOTnqlcGhrUF071pXaBsRTbddZS3SS6qdPBoCT+Pm4dhdMeYZlgGbfqOJCcmF3ID
 brsA==
X-Gm-Message-State: AC+VfDwogoJITiejkDFCuS0EXviDbtAnX//8bAx/ttw/kl1hzhEBGZJp
 faBzUezBBi8RENZRgeKQZ7lUVCKOmcoQPgiJklU4qQ==
X-Google-Smtp-Source: ACHHUZ6z8gNR0nAgnuyg7d/9En/fNuzcDBO2CeB5DEkDrKfL8s5sR+oPsHGOSU9ePGTe37Ap4f810X8xaCup6UkhSJ0=
X-Received: by 2002:a81:6046:0:b0:561:7cb7:6fb4 with SMTP id
 u67-20020a816046000000b005617cb76fb4mr891313ywb.7.1684187860372; Mon, 15 May
 2023 14:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <1684185928-24195-1-git-send-email-quic_khsieh@quicinc.com>
 <1684185928-24195-4-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1684185928-24195-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 May 2023 00:57:29 +0300
Message-ID: <CAA8EJppREQYCnCiA-2vTTmiyEa+ZN8Tj5-Q3Zq=dWEg+T3SLGw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v9 3/8] drm/msm/dpu: test DPU_PINGPONG_DSC
 bit before assign DSC ops to PINGPONG
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 16 May 2023 at 00:25, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> DPU < 7.0.0 has DPU_PINGPONG_DSC feature bit set to indicate it requires
> both dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() to be
> executed to complete DSC configuration if DSC hardware block is present.
> Hence test DPU_PINGPONG_DSC feature bit and assign DSC related functions
> to the ops of PINGPONG block accordingly if DPU_PINGPONG_DSC bit is set.
>
> changes in v6:
> -- split patches, this patch has function handles DPU_PINGPONG_DSC bit
>
> changes in v9:
> -- remove un condition assign dsc related functions to pingpong ops

Huh? This is beyond my parsing skills.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)


-- 
With best wishes
Dmitry
