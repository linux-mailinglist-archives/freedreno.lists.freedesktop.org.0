Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F05769CFC
	for <lists+freedreno@lfdr.de>; Mon, 31 Jul 2023 18:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A6E10E2D4;
	Mon, 31 Jul 2023 16:42:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB28E10E2D5
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jul 2023 16:42:48 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b95d5ee18dso70273061fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jul 2023 09:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690821767; x=1691426567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n51bPqc2FOBF1O8Pkof/cmIv3X6J8j8NcKC/rdlzbnc=;
 b=UCCLI6lYVK5fuTzhHD3N56NIKzLuA01wA85/5Q8I4Ub0cr6qqgsAAtXdP7f7Xmp0Jd
 sQK6/5iKpNoPUmH2oef4zU5tjExKgHDB6YwchfmARkClFn0UBmLD3K5CLjzLWBrb9neu
 EEsI5iD6t5rVTNISfrLokXvSTd0A8Iy2FXD434yebYtUal5CQrpQWkdWm70L6iRcdLRX
 mJAfDVrbkpJsG7hGv53EZbMuQv2+hDOhOnp9iHLuE2Xajm0WJOGUQMtBwlEuYp2Be1EZ
 bAMT9QbaPgLqoKzaYlngIi++D964Yi0YXjACBk+l8mXsLb1n9d94aYZ8Kme5PTstL40o
 HSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690821767; x=1691426567;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n51bPqc2FOBF1O8Pkof/cmIv3X6J8j8NcKC/rdlzbnc=;
 b=k9xbSjqmzJqcqDaMCdH2fsPwqXWGrlTYfU2Ux2OAgugAcllC+hOF632NR4S9ymgti1
 e0bUvAvZIWC0Ev3AYKR3lVnqx4oQHkJ1N4Q/kioUYBjWZpKX/p0XjBpccSZ5e8rkXQsS
 32QJ+8/K8eMiP42KrRTbXw1MgV9nVnc592FUfkECrPOT50gMspbrNljdxctnlA6CaeMd
 2FygTMppxjva9/PPHGGOAZL4eTEt1YBytZCwpMaQIXOSMZlW86uFHurrF9Nb3HLIhXqT
 qp0BYNsqZ0xnHWRz2NR6oYdUnPQWdF5YaQVo77nQmFpK+L2Iz278CTOjZ0AxlOFa1HtP
 /3AQ==
X-Gm-Message-State: ABy/qLYbDSz05olecVzQ3cYUnc9HjwUfnJ7IhgDq3uPqQph2KEybwTAa
 YdmY5xhwXSuzVfiLcbsLi/3mXg==
X-Google-Smtp-Source: APBJJlGnlmc0CiNX0uQgMywmw8gDWUm9ZXVzpNexqQqWwE6fS3vBXiSmuhs0v1sT3xheNqqp6aCo5A==
X-Received: by 2002:a2e:7e04:0:b0:2b6:d576:a25b with SMTP id
 z4-20020a2e7e04000000b002b6d576a25bmr376516ljc.28.1690821767059; 
 Mon, 31 Jul 2023 09:42:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e240f000000b002b70a8478ddsm2629932ljk.44.2023.07.31.09.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 09:42:46 -0700 (PDT)
Message-ID: <c68358a7-ee21-2d0a-71ab-cd1f9a3e1afe@linaro.org>
Date: Mon, 31 Jul 2023 19:42:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 00/14] A7xx support
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28/06/2023 23:35, Konrad Dybcio wrote:
> This series attempts to introduce Adreno 700 support (with A730 and A740
> found on SM8450 and SM8550 respectively), reusing much of the existing
> A6xx code. This submission largely lays the groundwork for expansion and
> more or less gives us feature parity (on the kernel side, that is) with
> existing A6xx parts.
> 
> On top of introducing a very messy set of three (!) separate and
> obfuscated deivce identifiers for each 7xx part, this generation
> introduces very sophisticated hardware multi-threading and (on some SKUs)
> hardware ray-tracing (not supported yet).
> 
> After this series, a long-overdue cleanup of drm/msm/adreno is planned
> in preparation for adding more features and removing some hardcoding.
> 
> The last patch is a hack that may or may not be necessary depending
> on your board's humour.. eh.. :/
> 
> Developed atop (and hence depends on) [1]
> 
> The corresponding devicetree patches are initially available at [2] and
> will be posted after this series gets merged. To test it, you'll also need
> firmware that you need to obtain from your board (there's none with a
> redistributable license, sorry..). Most likely it will be in one of
> these directories on your stock android installation:
> 
> * /vendor/firmware
> * /vendor/firmware_mnt
> * /system
> 
> ..but some vendors make it hard and you have to do some grepping ;)
> 
> Requires [3] to work on the userspace side. You'll almost cerainly want
> to test it alongside Zink with a lot of debug flags (early impl), like:
> 
> TU_DEBUG=sysmem,nolrz,flushall,noubwc MESA_LOADER_DRIVER_OVERRIDE=zink kmscube
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org/
> [2] https://github.com/SoMainline/linux/commits/topic/a7xx_dt
> [3] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23217
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (14):
>        dt-bindings: display/msm/gmu: Add Adreno 7[34]0 GMU
>        dt-bindings: display/msm/gmu: Allow passing QMP handle
>        dt-bindings: display/msm/gpu: Allow A7xx SKUs
>        drm/msm/a6xx: Add missing regs for A7XX
>        drm/msm/a6xx: Introduce a6xx_llc_read
>        drm/msm/a6xx: Move LLC accessors to the common header
>        drm/msm/a6xx: Bail out early if setting GPU OOB fails
>        drm/msm/a6xx: Add skeleton A7xx support
>        drm/msm/a6xx: Send ACD state to QMP at GMU resume
>        drm/msm/a6xx: Mostly implement A7xx gpu_state
>        drm/msm/a6xx: Add A730 support
>        drm/msm/a6xx: Add A740 support
>        drm/msm/a6xx: Vastly increase HFI timeout
>        [RFC] drm/msm/a6xx: Poll for GBIF unhalt status in hw_init
> 
>   .../devicetree/bindings/display/msm/gmu.yaml       |  47 +-
>   .../devicetree/bindings/display/msm/gpu.yaml       |   4 +-
>   drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   9 +
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 188 ++++--
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   3 +
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   8 +
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 658 ++++++++++++++++++---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  15 +
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  52 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  61 +-
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  90 ++-
>   drivers/gpu/drm/msm/adreno/adreno_device.c         |  26 +
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   7 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  24 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.h               |   2 +
>   15 files changed, 1070 insertions(+), 124 deletions(-)
> ---
> base-commit: 6f9b660e9cbb30669fcfec83288d527c0844717d
> change-id: 20230628-topic-a7xx_drmmsm-123f30d76cf7

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450

-- 
With best wishes
Dmitry

