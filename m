Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 178E47DD5DC
	for <lists+freedreno@lfdr.de>; Tue, 31 Oct 2023 19:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1262710E5AC;
	Tue, 31 Oct 2023 18:13:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61ED10E5AC
 for <freedreno@lists.freedesktop.org>; Tue, 31 Oct 2023 18:13:10 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54394328f65so61398a12.3
 for <freedreno@lists.freedesktop.org>; Tue, 31 Oct 2023 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kali.org; s=google; t=1698775989; x=1699380789; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8+bea9ITYj3fJA+5jITbAwFJxHRR8ST9gfKocB/HsD0=;
 b=NA/nSmIYVSDFzfl60VvtpLIlhT6c+JNGXBydZU7Rnux+1UFwyAiDsoO/km1xEnIImx
 0YWqEF5BY3f0Vvo3tyFufKSJQOrFIKdBAWcqobH1K1+X1JPA/yxXalzlMDuvDeKUvHds
 20kDCW2ohPTElOWWsCGQQMG9rEnU5vm/RRDi0z6e/Fw4bnOy4rjNAVFQvSHAm0RdLOQ3
 d1fpgwUfmvqC4o1byX2d5yi0AWiHtUV4xZGNRyAjS1onLgSK3kns7Oz8G+3/zG30IGAm
 b5WZjrTHSUaMlvjSYxlIHBHiMNkMXdQrFi4CIUc0X8zoD2AtWeG2+upldIaWwYTZCml6
 HD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698775989; x=1699380789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8+bea9ITYj3fJA+5jITbAwFJxHRR8ST9gfKocB/HsD0=;
 b=p7Bg5HV7gTJNWhkjYE51REPBKh0kuv0cMybuGxrtPR/+qQqpYCDv5bqAy6ZK3HxkCJ
 y5bONWuZ0dP2k2vQw+nz/XfIR2hH0yVG9xtVHtlFogoJJrVou1hzvf1AaIM37kMwVrRg
 KZ/K7A/Q0FtPCk/MC0nd1vFLSdeUTTDGGnTwymWeAxSQahlX4gh69W419ZeZOB9t7HBA
 cQpOKAekQFNYKvH41rhZlbgxWreGAPhuR9Q0UqEEL6B/r1L02jzI7NmcatemQ8iZe9cs
 DIFPEOfQjMkROgDuolkrRFjCHDSixPar87WuCcKFcpAgY781bw7u0RyKLGpGMUcb+J3t
 50JA==
X-Gm-Message-State: AOJu0YwBxWNcwMMDKjnK9dYaIH6aG8kxDYl4uC8HiWKYt4DoYxjTB16p
 e8OQHR1ztQ1o9zstoSqc6MCLG1BZUvPcd08Zq6UHug==
X-Google-Smtp-Source: AGHT+IHOErAN6Yr+37GaYVtwYv6CCUvnz472fiM/ktmi4ZHD8GdEwbhKFuq6ML6dHXHRBNlRuocIcZl449adkK5ZjGw=
X-Received: by 2002:aa7:d156:0:b0:533:c55f:5830 with SMTP id
 r22-20020aa7d156000000b00533c55f5830mr10614603edo.28.1698775988981; Tue, 31
 Oct 2023 11:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com>
In-Reply-To: <20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Tue, 31 Oct 2023 13:12:57 -0500
Message-ID: <CAKXuJqhrjUwhqb6SK65zAd3nfLTOm8_zfoYNKU5EMbWnPjPQ-Q@mail.gmail.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in
 sc8280xp catalog
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
 Doug Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 stable@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Johan Hovold <johan@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Oct 30, 2023 at 6:23=E2=80=AFPM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> During USB transfers on the SC8280XP __arm_smmu_tlb_sync() is seen to
> typically take 1-2ms to complete. As expected this results in poor
> performance, something that has been mitigated by proposing running the
> iommu in non-strict mode (boot with iommu.strict=3D0).
>
> This turns out to be related to the SAFE logic, and programming the QOS
> SAFE values in the DPU (per suggestion from Rob and Doug) reduces the
> TLB sync time to below 10us, which means significant less time spent
> with interrupts disabled and a significant boost in throughput.
>
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Cc: stable@vger.kernel.org
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/d=
rivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 1ccd1edd693c..4c0528794e7a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -406,6 +406,7 @@ static const struct dpu_perf_cfg sc8280xp_perf_data =
=3D {
>         .min_llcc_ib =3D 0,
>         .min_dram_ib =3D 800000,
>         .danger_lut_tbl =3D {0xf, 0xffff, 0x0},
> +       .safe_lut_tbl =3D {0xfe00, 0xfe00, 0xffff},
>         .qos_lut_tbl =3D {
>                 {.nentry =3D ARRAY_SIZE(sc8180x_qos_linear),
>                 .entries =3D sc8180x_qos_linear
>
> ---
> base-commit: c503e3eec382ac708ee7adf874add37b77c5d312
> change-id: 20231030-sc8280xp-dpu-safe-lut-9769027b8452
>
> Best regards,
> --
> Bjorn Andersson <quic_bjorande@quicinc.com>
>

Tested-by: Steev Klimaszewski <steev@kali.org>
