Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2029E4F9588
	for <lists+freedreno@lfdr.de>; Fri,  8 Apr 2022 14:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902B710F0FB;
	Fri,  8 Apr 2022 12:21:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E899910F0C7
 for <freedreno@lists.freedesktop.org>; Fri,  8 Apr 2022 12:21:32 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id e22so7297862qvf.9
 for <freedreno@lists.freedesktop.org>; Fri, 08 Apr 2022 05:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YRo7o4btpESJNDRm1Sx3TiY7NQIcJDsdvvXgFQ9NGKc=;
 b=fC4YVY0voFTb7xf7jGHf5z4ClA2JWzzjJAJk/eJAafLPDNcd51omB5oEC5gIAPs+mb
 9vwV+W+ZpWER1jaHI/z80OUDSzO11ylNsDJh1oPo2W/tegkiykV45tyH+zyV8TRB4lrM
 SQcT6so8RswTm3LdtHFeJsdwz0qW0J+J8t21nI24qlqYvkUY+jnggPRjnnVTWz0Eh0an
 rNCxcXVQG4PloCSVuG3qvJp8sc7syNWTI0oQ719vT9lY704ztiYvv0xb4WmfkyFyLKWd
 jess8X1HhbxeJdjhmgoM8zkWQQ9+//RUAemVGiLaC5mggO/ishyKoOgv6ycLk5TSKHFt
 kUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YRo7o4btpESJNDRm1Sx3TiY7NQIcJDsdvvXgFQ9NGKc=;
 b=4O1f2NnLoPvqq8CoDuv0rkro+Sp8OqmZl1mTEZ+hj67y2euqBvLJuYOKOcl2PbFBqf
 heBF66KFx3TQudyKF62L9hXjiQt1/WHIQPvaLlWiZErVbwEPqlQA0ydRdkiLAaaTsm/d
 wCzoSoe23jyCDVYCpLqtVbEDXNDe+m39dQehZeJwOe2ozwKo4uej2xVwGeVsXdMomI2O
 3iWAGRKhW5rb8Kh7Tqn4lkzA09qJbUZ6s0JwTOukWA9qgPhm68rJmHwxLYVjyaUJPZb+
 +WmOi3syl7eHKdyyBXFbUJzyQPYmKaoyo7SetCskM+PYTHaTje6HxCpcUWQff0UF4sFN
 qo9A==
X-Gm-Message-State: AOAM533DZ4TfxLvISwkpg/KCpaxFCxZWL7hkjM30QYLsZ3ixGav9eOD1
 TFFuzXeVMaWKzjqi6jXXgr3q+M/wRrvGDhH8/wp81g==
X-Google-Smtp-Source: ABdhPJzyPvV2EX3O5x5qzKd7QrCWD7nwrriMxeUbFZZ/oV9CoHBlI4Bman5yBlnB8oOnR72ONhBZO5Vt7RuHEAXJx9g=
X-Received: by 2002:a05:6214:921:b0:443:ce3d:577b with SMTP id
 dk1-20020a056214092100b00443ce3d577bmr15918452qvb.122.1649420490768; Fri, 08
 Apr 2022 05:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220407202836.1211268-1-robdclark@gmail.com>
In-Reply-To: <20220407202836.1211268-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Apr 2022 15:21:20 +0300
Message-ID: <CAA8EJpqfoPwmsJcwMvFgz1KL7sE5XahFGV4WoJ=Eg9Sr8R39RQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix range size vs end confusion
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

On Thu, 7 Apr 2022 at 23:27, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The fourth param is size, rather than range_end.
>
> Note that we could increase the address space size if we had a way to
> prevent buffers from spanning a 4G split, mostly just to avoid fw bugs
> with 64b math.
>
> Fixes: 84c31ee16f90 ("drm/msm/a6xx: Add support for per-instance pagetables")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 17de46fc4bf2..80d57608b34a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1742,7 +1742,7 @@ a6xx_create_private_address_space(struct msm_gpu *gpu)
>                 return ERR_CAST(mmu);
>
>         return msm_gem_address_space_create(mmu,
> -               "gpu", 0x100000000ULL, 0x1ffffffffULL);
> +               "gpu", 0x100000000ULL, SZ_4G);
>  }
>
>  static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
