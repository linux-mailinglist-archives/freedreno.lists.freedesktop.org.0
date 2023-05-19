Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A1709833
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 15:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E79A10E18E;
	Fri, 19 May 2023 13:29:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE3610E0C8
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 13:29:19 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2af16426065so23686691fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 06:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684502957; x=1687094957;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=062DucJSZM1ir9uGBCKc/nlmbbSP2byuRNORA6qyTPQ=;
 b=rYoeEimKwUN9rBpJQr8NFWGMad89OMytiHuI8sGumrM21rcMl8M+faPG1j9Z60Z7C7
 cbYobtTN7dBQB0hkw8NDZ90zQAfh63LE1vIZcl2xOTSr4RCTsgf9VfrVX38Mdfm1qq+Q
 k9AKfH5YSwjWuecWVlETC0og518k1/Uxe5HHM5oPL069HALBdnGxOErxGL6ybJS90fdx
 +st2atGwTwsnCwI+zrui82GsBybMEIRDeQpu8qLzXHGBYzLvbZJW7JT3exyweV/iR6uy
 XXok+3FBpZ3RcO/wpvOPyIF3n01HLBpgAoAln98IQgwANSmu1aT25xB24u0mCeWARPJK
 O0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684502957; x=1687094957;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=062DucJSZM1ir9uGBCKc/nlmbbSP2byuRNORA6qyTPQ=;
 b=HId4tCnUhz/U+q3tETY6ZY+TzyYMullyvAelq2S2xPxePQ+fhREA++j1SwpAvLwGFP
 pkjhXrvKy1PVRb98wIwX+V3q0j7HGPf0DBgSm7XyrWI+IocuYvjpWAxSiu5AKijMl8Xh
 CrtW89RBSpX+BiuVS3XI/yjiSmMhO5a0wpL5f893FyDtwDODufHiNqtx/R8v5Ki5h0rW
 +Vb86jRTqSWvSKhdh5t024899I9gBTeLYf470WO4tCHVZo6bWBtqXpxBZ3h4uCFYM/8e
 pPiUj/Heuyc81hUNVghxI+tbSUA1EKjCbYtXAeRbzd+/PZ8Cka6plwgZmL+/vu1AzaUc
 0lrQ==
X-Gm-Message-State: AC+VfDzFJkcASavX1vZ0Q9gc/E669b5zi6o2df2OpJiCbd3HBHCMvQi5
 oxMq1j5RGVaUYsTpNOwv8Cdkuw==
X-Google-Smtp-Source: ACHHUZ4An4Zn0nCxdOQvjscIRQdVdw5YKfZDEGb/fZyIPdEtEAK+FUDxz4vkUKK6RepEB5UA97H0YA==
X-Received: by 2002:a2e:3506:0:b0:2ac:7ab1:a441 with SMTP id
 z6-20020a2e3506000000b002ac7ab1a441mr825771ljz.30.1684502957010; 
 Fri, 19 May 2023 06:29:17 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a2e9698000000b002ad92dff470sm821384lji.134.2023.05.19.06.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 06:29:16 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 15:29:05 +0200
Message-Id: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKF5Z2QC/3WNQQ6CMBBFr0K6dkypSi0r72GIKaWFSUhLpkgwh
 Ls7snf5fv7L20T2hD6LutgE+QUzpsigToVwg429B+yYhZLqIm+lhjlN6MDqdX1N5CfQd20r43Q
 nQxBstTZ7aMlGN7AX3+PIIz8Drkfm2TAPmOdEn6O6lL/1f2ApQYK2proG5Y1x6jFitJTOiXrR7
 Pv+BT8FWLHEAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684502955; l=1302;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VXBY1tMYfUryEB9oBPhxsJwm809WxNcgkNQbGylhXoM=;
 b=w+XgKEDdVaEnraLk8O2/v+j0nPDV21xxFmeq0iukvcqGuAZwNVmE577OSwHvLLPiZISgimcbj
 XpVrJ00+P6DAi9757vNDqmpxwhaH9608W8sQI60AobALER/s1YyY+b2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 0/6] Adreno QoL changes
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series brings some niceties in preparation for A7xx introduction.

It should be fully independent of the GMU wrapper series.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Drop switching to using the GMU_AO counter in timestamp
- Add a definition for REG_A6XX_GMU_AHB_FENCE_STATUS_CLR, may be subbed
  with a register sync after mesa MR22901
- Link to v1: https://lore.kernel.org/r/20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org

---
Konrad Dybcio (6):
      drm/msm/a6xx: Add REG_A6XX_GMU_AHB_FENCE_STATUS_CLR definition
      drm/msm/a6xx: Explain CP_PROTECT_CNTL writes in a6xx_set_cp_protect
      drm/msm/a6xx: Skip empty protection ranges entries
      drm/msm/a6xx: Ensure clean GMU state in a6xx_gmu_fw_start
      drm/msm/a6xx: Improve GMU force shutdown sequence
      drm/msm/a6xx: Fix up GMU region reservations

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 21 +++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 +++++++++-----
 3 files changed, 28 insertions(+), 9 deletions(-)
---
base-commit: dbd91ef4e91c1ce3a24429f5fb3876b7a0306733
change-id: 20230517-topic-a7xx_prep-787a69c7d0ff

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

