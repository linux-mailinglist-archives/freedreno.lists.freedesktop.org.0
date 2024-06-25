Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0FA91725E
	for <lists+freedreno@lfdr.de>; Tue, 25 Jun 2024 22:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461D610E277;
	Tue, 25 Jun 2024 20:18:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c5Tlwq1F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332A310E008
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 20:18:43 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-645808a3294so22479917b3.3
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 13:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719346722; x=1719951522; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hl0vn1IfpeicnMOwpEfyDxO5oFF0xIRhWfGVIKpdxKk=;
 b=c5Tlwq1F2MF1Z9PM5te/FcsZ0VWc1KDYcNJSMFUVVvKXxLzYm+h1GUhH0QfB5FtV8G
 ngd72EmQThYGq+MWw0HRvA3Cu+KdlpJSgBnFR4oh7sAcObKqjg9t0TiPDXfvvNLc3NV2
 SOBlsq1eC0gZ53nzOSZ8ygq6NEj+itdnswcNCLO6YpgmE8HelUbjf6/EE5mp4zDQQo0r
 HAEjYaCkURbTMPeuFdBs7wlS5j0nbecIGLcBUhsfPCfFUt7Uew1Xg+85+InprNm3iexN
 ZC1K4DxmA+I+88m7s453EfXz2y7c+Qr6QI+Zyn+dm1ZmJQN3FM44Hw3NWbAYmQ/dSkW9
 Ai8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719346722; x=1719951522;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hl0vn1IfpeicnMOwpEfyDxO5oFF0xIRhWfGVIKpdxKk=;
 b=iT0RTILGGe2hdaiIZkFU0UO6p0Bt+yYaLze+Bek03Qv/h4ElouZBH31fDywHwTbqPj
 SUseYFcz+1gtOvx8D5rVy25/yGhs3jX2cIPkgwREnLxF5FvEgJJ18BVpxqXbo2TgGU7n
 ebx24k+653IAJh+2rAcyP15yoLw3CPiQu0EnI5N3EMpLX9OCMJIGkZKPKMlH5d6Rm473
 JPx/y4ZMwyVjrUsplA5oecQ4rTAcJLIRDpdYD1KZPIehsUazyxcsRuwSn6XQuWR4b4Ah
 plvHjrLYfq0oQ4RWYwdF07ZAPCTxmtMDqZes8UfHQcz9xSP8HU7wMhUe6uKd61K03/73
 2l4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtnAt+JA01XTusyMbBw71xw5Oit/TsrQHHGCiHsiw+KR+dBVnreuSzXFR/c2ll1nA9EaOw8uD4N1fWJE+3KYzMK3mbRM/paZTSLIT/Vuqe
X-Gm-Message-State: AOJu0YwDdyBUueF4QNFY7TMkZjGCvJsFV9205Eqn0VCQDAPlDs/GlB2I
 A1wBAYUBy0zfPo/cDpP1Fkl1JbxKjLbLJpPtHSETu3je/lJON2GgRM6YUEDPEBDc3OebFHKFZb9
 bTwKlEtrPDP+f+R2DSR3PbnA6YQPRldspO59APg==
X-Google-Smtp-Source: AGHT+IGhh7cMGkaHnGaMvg5sqr7zzAMtsWcZCW0A35zu7AxPMIv8wJrJE/YBk35y+kSqxRG2SLUIsYgPhykOiRmUsIc=
X-Received: by 2002:a81:8547:0:b0:631:8274:1611 with SMTP id
 00721157ae682-6433dd74338mr83572967b3.20.1719346722141; Tue, 25 Jun 2024
 13:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
 <20240625-adreno_barriers-v2-2-c01f2ef4b62a@linaro.org>
In-Reply-To: <20240625-adreno_barriers-v2-2-c01f2ef4b62a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 23:18:30 +0300
Message-ID: <CAA8EJpqnFEkWx4hq_UDgQ9n5qNj=WjN-Td0+ELGh8hrDpBFjGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Revert "drm/msm/a6xx: Poll for GBIF unhalt status
 in hw_init"
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 25 Jun 2024 at 21:54, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Commit c9707bcbd0f3 ("drm/msm/adreno: De-spaghettify the use of memory

ID is not present in next

> barriers") made some fixups relating to write arrival, ensuring that
> the GPU's memory interface has *really really really* been told to come
> out of reset. That in turn rendered the hacky commit being reverted no
> longer necessary.
>
> Get rid of it.
>
> This reverts commit b77532803d11f2b03efab2ebfd8c0061cd7f8b30.

b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt status in hw_init")

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 4083d0cad782..03e23eef5126 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -867,10 +867,6 @@ static int hw_init(struct msm_gpu *gpu)
>                 gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
>         }
>
> -       /* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
> -       if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
> -               spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
> -
>         gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
>
>         if (adreno_is_a619_holi(adreno_gpu))
>
> --
> 2.45.2
>


-- 
With best wishes
Dmitry
