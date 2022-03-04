Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9110A4CDFE2
	for <lists+freedreno@lfdr.de>; Fri,  4 Mar 2022 22:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2F3113A45;
	Fri,  4 Mar 2022 21:47:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFDE113A46
 for <freedreno@lists.freedesktop.org>; Fri,  4 Mar 2022 21:47:27 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id b23so8585302qtt.6
 for <freedreno@lists.freedesktop.org>; Fri, 04 Mar 2022 13:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=07QUV/roAPX5T4vcJdRHGYdQI94K3C6oZepbJubN048=;
 b=ZyQ0k5CWcpdtr4eC0/7b4Rznt5zb4XDOsarVR6S+cR1VoJ6KfH1s56A5+EZ5tRASZZ
 aq/wddTwsm4FUsvSZKAsJALQCvCagM8jQ1E1K52lCcoGFEbInN7CTr0orGcbGAW7uCOW
 uy+L6y+GIzRI+1IHMDUv4XuJF7DfO+LvVFAJl+qtGHVcO4Sh5iCgobpjofpA94KxeKA8
 KFlJECZwlUrNgIRtpzLt35h8VGRxm7TFI07cLe4VcIcq9w7FUCghDT4L49vZl2Qn414R
 kt2CXu3c7zwgOJETW3d/HYBv9JvzvJO9JWIO7qJPPxzTRtP1Xnyw063zMJwt0qPhKwOZ
 fzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=07QUV/roAPX5T4vcJdRHGYdQI94K3C6oZepbJubN048=;
 b=aapNhFwTkP/ypCQgwV7jkKd8cdQc9ykysold1TF2VYMg5VIcAQpdWDGIxSufGSv8qt
 BHBoaMC/Y3DqISwzzqcUfP03Gwg1YCyT1jSOBBKY17PdTMRkQC3G+C3NctyIEYGNHear
 cbTqSQ0nX3pHYclCqW98pQtVY6YJqNri3v+0MpwoR45fzuAd1mHqXdiPaYumqIy9lokZ
 +Gcif4DxuP8uI5EnK0zNFEjqN8c5HRIiAz7kKUbBIMyltbxC3dF3F/QcKG9fDYTroK26
 gT6lybwjnbrLQceM4wM0jrbYVrJPg54eVgbWwMEAtOx0uD4nFOU16hneqcBD4NntmTa9
 VZTA==
X-Gm-Message-State: AOAM530PY5tWC70VKHRHvjBw6EFFbygSUDUvXWGKI+hsvDAP9rW17Dg9
 boQ8nAW7CpX3sd6TxdazhhF1GxoE4TdHN535aPtc8A==
X-Google-Smtp-Source: ABdhPJz79U1gHypq9yZMvIBnhQSWouY8E2jvQI7JMuB03UuB1XxnCs8Hf/wSBrxsG1zxreEQkdCnmKSY5cuJydinrzQ=
X-Received: by 2002:ac8:5b84:0:b0:2e0:234:73c1 with SMTP id
 a4-20020ac85b84000000b002e0023473c1mr784457qta.62.1646430446705; Fri, 04 Mar
 2022 13:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20220304202406.846485-1-robdclark@gmail.com>
In-Reply-To: <20220304202406.846485-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 5 Mar 2022 00:47:15 +0300
Message-ID: <CAA8EJprik57F+t0KicoYaRm=oDOgcQHyHSBjJKbekBKjO_-=0A@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: Fix missing ARRAY_SIZE() check
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 4 Mar 2022 at 23:23, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Fixes: f6d62d091cfd ("drm/msm/a6xx: add support for Adreno 660 GPU")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
However see the comment below.

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 02b47977b5c3..6406d8c3411a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -687,6 +687,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>
>         BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
>         BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
> +       BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);

The magic number 32 and 48 are repeated through this code. I'd suggest
to define them and use defined names.
It can come up as a separate commit.

>         if (adreno_is_a650(adreno_gpu)) {
>                 regs = a650_protect;
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
