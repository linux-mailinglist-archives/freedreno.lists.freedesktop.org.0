Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED757477A6
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 19:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5CF10E16B;
	Tue,  4 Jul 2023 17:20:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8607610E054
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jul 2023 17:20:06 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-bdd069e96b5so6404369276.2
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jul 2023 10:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688491205; x=1691083205;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yoK4H6nDlRDDhLrKCYHElhgk6WD3qdHNe/PnJeljUiQ=;
 b=OLeYoW5tLQwUeeBmQg/YUvzkIdEFQjDWA2se+/29g2kPN9DcLL8DWA+czO0slfDbUe
 egRIssEmEQQwMOjRBAzlRsl2mjnE4e0SsWdpzTBVvqxaTdDkaxpOTMsg92QCs0k+aM0N
 FU5DuGePCzhNmqpN68imusx27FRmvyWO16rVs3/ge4k0EFvUToqzDUwGvlbPrpTSCGf6
 9bQNl/ebxpa1mKa/MM4yovs8/6ab+gUtYwGpJLm61KATkefWCqoWjCMJCpV74fokVu4X
 oeCZ8N4pauaPMAFaRk/4J9gniu7gZWcTkXPlPZjBIH57IQCVKkRkPxntmYpjlrfEBjWm
 TrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688491205; x=1691083205;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yoK4H6nDlRDDhLrKCYHElhgk6WD3qdHNe/PnJeljUiQ=;
 b=P0PpPCYXfrPct+cIas3GzfSxOtvcAbptq/JKEvJ8N9arozOEsGrRRRTPjxfPdBXrcK
 I6V3cM7Ste/9bjbCwp8iZNHrF5K+4pg7InyZqRjgi+xlBggQijDtx7wVr2yBTnQsVZ87
 0hXMEmDReBRY4erUomAbCqDFoLy4OE9MVpxygNFOFPMepGbgrWt90etxRQukcNRzY/As
 myAOVG6xIuVL5rYjtniOZExvgtm7iX1zMB4swXQtI8/olhfwo08u8f2CxXKJ1yPQ+Og4
 q8fqG/3FQ4V/68cPaLVPFhutoZn/wHagdSYtlqr8Y30EfEHtTGeK/+Ni8oxGzZyo7MIn
 /xdQ==
X-Gm-Message-State: ABy/qLa+bxEWZtTgdWtuRWuXSiXU7/biUQw7AoL81a/FT56Y3Qpf9yKX
 FVObRYnc6LOAX0WhZ5KezbgQDZrBC4EY2bVfCsepQg==
X-Google-Smtp-Source: APBJJlEnJiKi2TvvTpP52xudCEw1PqsQzWEq3Xxap/aH09T5RErSQ3nB87eNWj863g3c2q2AuSGN2rLdKwdytZMdyu4=
X-Received: by 2002:a25:a441:0:b0:c1d:6508:3083 with SMTP id
 f59-20020a25a441000000b00c1d65083083mr14025995ybi.55.1688491205391; Tue, 04
 Jul 2023 10:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230704163640.6162-1-robdclark@gmail.com>
In-Reply-To: <20230704163640.6162-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 20:19:54 +0300
Message-ID: <CAA8EJpoAZ7z2aURWHs1ouEuTzj2c0O-CypCHmocXO62EpuffsQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/adreno: Fix warn splat for
 devices without revn
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 4 Jul 2023 at 19:36, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Recently, a WARN_ON() was introduced to ensure that revn is filled before
> adreno_is_aXYZ is called. This however doesn't work very well when revn is
> 0 by design (such as for A635).
>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 65379e4824d9..ef1bcb6b624e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -149,7 +149,8 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
>
>  static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
>  {
> -       WARN_ON_ONCE(!gpu->revn);
> +       /* revn can be zero, but if not is set at same time as info */
> +       WARN_ON_ONCE(!gpu->info);
>
>         return gpu->revn == revn;
>  }
> @@ -161,14 +162,16 @@ static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
>
>  static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
>  {
> -       WARN_ON_ONCE(!gpu->revn);
> +       /* revn can be zero, but if not is set at same time as info */
> +       WARN_ON_ONCE(!gpu->info);
>
>         return (gpu->revn < 300);

This is then incorrect for a635 / a690 if they have revn at 0.

>  }
>
>  static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
>  {
> -       WARN_ON_ONCE(!gpu->revn);
> +       /* revn can be zero, but if not is set at same time as info */
> +       WARN_ON_ONCE(!gpu->info);
>
>         return (gpu->revn < 210);

And this too.

>  }
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
