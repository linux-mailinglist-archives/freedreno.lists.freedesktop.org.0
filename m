Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D26696BC1
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 18:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5FF10E0ED;
	Tue, 14 Feb 2023 17:33:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9873910E0ED
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 17:33:14 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a3so7920047ejb.3
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 09:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:to:content-language
 :references:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hO1MJp+/jqfWHP5l1OlMio7NroHUlq+O9mjXjVHXt7M=;
 b=piSkBPQVmsjS22ljajTLlzb8di8lP4VjdL5g9Yl2Cyth13aRPTk7lMTfsbRkDcCA8v
 5YPK5tsRm//jQYKPRtrXH5s9lRIjo/6Qr9WGfuGOz5ynE5nI/TmiveMTb54bW7mFyRBH
 GunGXUhxU7aeqFf7t9XgwCrHeuM2IGwFa4RNMv1ZLteAsJbRm8UMny6OKq7sG/RU+1YI
 lDdusk+wTC8lTA+Yb0TO/oY97xAX7XL/FLGvnGoiIE0nPniIwK1yAb+HjNSoOL15bFzt
 Yz41hnpFChuOF8rbHAFAkryGQmSYiyJ7dUr+F00j3zLY3CTS2BT0+7cbIhvI09NQf9o8
 Fqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:to:content-language
 :references:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hO1MJp+/jqfWHP5l1OlMio7NroHUlq+O9mjXjVHXt7M=;
 b=WqxvktWe1elLO+xcMKa6OFweh9oehEq+zsXAQPcafjv8krr/Iq5MArhlQK6sSdW42l
 oZQyChw3OGKcZ/UJyTaIgKP6YOVXbX8mNmtC41sVUuOQT20+AeSv+CvNyAwLZjAicgv/
 tUNNbrvPGZ8/P+QHU9BF+cBxal63uqGFRCuoP6B9Qk1wSgXDGr1kns62CbCwP20I0gaK
 5uVUzf1lsJk2Dm9d2ho28PotiQ/ZsC86bGrB+BO1eYG3NpeZcZK8rjK5Pro2Mln25kSH
 kr02vbKX9U6NROKXnayOyw0bD3mgAIqAr8KuIEShQgv3laGC1ouFspT//vHXEyKNUcEf
 wV2g==
X-Gm-Message-State: AO0yUKUW9HD1ueLnFWZzGC1Qh7no2ethSeMYGv28ZIrB+2pZ5Bhim7yN
 QvJFQqlvE+jTF/wSoW+3TIX8+Rhq9JzWPmtV
X-Google-Smtp-Source: AK7set9IfCCmEhV3+n+57LR6MSISo7WzeflORk5/BW+eMS6vl6qQoEcX6CJcZZaIA1tUJH7i1xfRoA==
X-Received: by 2002:a17:906:ecbc:b0:88d:697d:a3d2 with SMTP id
 qh28-20020a170906ecbc00b0088d697da3d2mr3384562ejb.54.1676395992783; 
 Tue, 14 Feb 2023 09:33:12 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a170906271000b0073d796a1043sm8416516ejc.123.2023.02.14.09.33.12
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 09:33:12 -0800 (PST)
Message-ID: <0d3a60e7-5c5f-0816-3f68-4ac28a2d228c@linaro.org>
Date: Tue, 14 Feb 2023 18:33:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
Content-Language: en-US
To: freedreno@lists.freedesktop.org
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
X-Forwarded-Message-Id: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: [Freedreno] [PATCH v2 00/14] GMU-less A6xx support (A610, A619_holi)
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

Subject: [PATCH v2 00/14] GMU-less A6xx support (A610, A619_holi)
Date: Tue, 14 Feb 2023 18:31:31 +0100
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
CC: marijn.suijten@somainline.org, Konrad Dybcio <konrad.dybcio@linaro.org>

v1 -> v2:
- Fix A630 values in [2/14]
- Fix [6/14] for GMU-equipped GPUs

Link to v1: https://lore.kernel.org/linux-arm-msm/20230126151618.225127-1-konrad.dybcio@linaro.org/

This series concludes my couple-weeks-long suffering of figuring out
the ins and outs of the "non-standard" A6xx GPUs which feature no GMU.

The GMU functionality is essentially emulated by parting out a
"GMU wrapper" region, which is essentially just a register space
within the GPU. It's modeled to be as similar to the actual GMU
as possible while staying as unnecessary as we can make it - there's
no IRQs, communicating with a microcontroller, no RPMh communication
etc. etc. I tried to reuse as much code as possible without making
a mess where every even line is used for GMU and every odd line is
used for GMU wrapper..

This series contains:
- plumbing for non-GMU operation, if-ing out GMU calls based on
  GMU presence
- GMU wrapper support
- A610 support (w/ speedbin)
- A619 support (w/ speedbin)
- couple of minor fixes and improvements
- VDDCX/VDDGX scaling fix for non-GMU GPUs (concerns more than just
  A6xx)
- Enablement of opp interconnect properties

A619_holi works perfectly fine using the already-present A619 support
in mesa. A610 needs more work on that front, but can already replay
command traces captures on downstream.

NOTE: the "drm/msm/a6xx: Add support for A619_holi" patch contains
two occurences of 0x18 used in place of a register #define, as it's
supposed to be RBBM_GPR0_CNTL, but that will only be present after
mesa-side changes are merged and headers are synced from there.

Speedbin patches depend on:
https://lore.kernel.org/linux-arm-msm/20230120172233.1905761-1-konrad.dybcio@linaro.org/


Konrad Dybcio (14):
  drm/msm/a6xx: De-staticize sptprac en/disable functions
  drm/msm/a6xx: Extend UBWC config
  drm/msm/a6xx: Introduce GMU wrapper support
  drm/msm/a6xx: Remove both GBIF and RBBM GBIF halt on hw init
  drm/msm/adreno: Disable has_cached_coherent for A610/A619_holi
  drm/msm/gpu: Use dev_pm_opp_set_rate for non-GMU GPUs
  drm/msm/a6xx: Add support for A619_holi
  drm/msm/a6xx: Add A610 support
  drm/msm/a6xx: Fix some A619 tunables
  drm/msm/a6xx: Fix up A6XX protected registers
  drm/msm/a6xx: Enable optional icc voting from OPP tables
  drm/msm/a6xx: Use "else if" in GPU speedbin rev matching
  drm/msm/a6xx: Add A619_holi speedbin support
  drm/msm/a6xx: Add A610 speedbin support

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       |  55 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h       |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 427 +++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  14 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |  34 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |   4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  19 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       |   2 +-
 9 files changed, 492 insertions(+), 66 deletions(-)

-- 
2.39.1

