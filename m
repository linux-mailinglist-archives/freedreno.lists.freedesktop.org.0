Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CAB37FC3C
	for <lists+freedreno@lfdr.de>; Thu, 13 May 2021 19:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CDA6ED84;
	Thu, 13 May 2021 17:17:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378426ED91
 for <freedreno@lists.freedesktop.org>; Thu, 13 May 2021 17:17:30 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id k19so873187qta.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 May 2021 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aQWQ2eSbCWjaDmjGhi3u40pp1LlF3mF4wAzWbmvdU88=;
 b=U2LT0FzDjK/xMUpUok6rSRmC6sln8a9nq/xG/GL6wWaMq+utmx9QWM8EjSOd4yAB9W
 D73Rb2yb9eNTDyBOnFP1gcEEvygZTYKBABEQkTkPLbbA+V923ocPaA9AOLWD63m39uWh
 2AcKeCnkKFdxFPTwEGwbN/NMQwWv+XuQ8VFBFK8mBggX1zYm/BDFM1P6YgiAzuEboE00
 FIn1P08oi2blVdk+ZtXb1RTt2yVMxCuFestLIVv/4b+JnUmkMCwD2Rl/PRyFjXOgvBka
 4pvVK9nzzPK/uoUqGA9o+VLjWUpWbgw2M6EAxvi4kRaro0Q2q3Cl+24gAxIXJibquQou
 Moww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aQWQ2eSbCWjaDmjGhi3u40pp1LlF3mF4wAzWbmvdU88=;
 b=MOoqe5kXyf+//ieEooNfoZA4UfkD21355WXzdiE9FLMJ6JiLjWLQFoasgVt041iqjJ
 z0D2m5RWPzMA8WJB+Nke/3FFwqSPaMHqdTAU+E0C2nAn/AqK6AcXlxDKRYi5nzXTJU6g
 6o8D9XQQGyRtJKLp6H8krXPYsDIHpv7ICIx4w8s3lXm5JurQcaPw+s1m34mN3wEQflyw
 Xtj0BXDY/wZuyLZ7b4kyd2bM+kY3irYEPQUr/OybfAGODLLJI569JFt0qj+rphAKwd3I
 Ekv7/Zu1GfVAYlLMJo3s9Ga5dra1bpkukVI5r9+r1rVBUydV56tj2jdk5LsCH9jRyhjb
 UUlw==
X-Gm-Message-State: AOAM532vVegPogR3jXNnSeAU7HOFYccjI3jhxxi0BziMS5LsX/c2oLI4
 uyfmozVnEciel/nJXAN8ITe1loIx6cZ7YJe2K5I=
X-Google-Smtp-Source: ABdhPJy4jdPxUmPm2TaTkkMlXn2NLBuaDEPii3ErnXusughMxa4RFDdL6KRXs9VmvmjLX71N+V28tQ==
X-Received: by 2002:ac8:4641:: with SMTP id f1mr39171708qto.107.1620926249104; 
 Thu, 13 May 2021 10:17:29 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id f132sm2971117qke.104.2021.05.13.10.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 10:17:28 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Thu, 13 May 2021 13:13:55 -0400
Message-Id: <20210513171431.18632-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 0/8] drm/msm/a6xx: add support for Adreno 660
 GPU
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Shawn Guo <shawn.guo@linaro.org>, kbuild test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for Adreno 660 to the drm/msm driver. Very similar to A650
on the kernel side.

v2:
 - added AOP PDC path for a650 and use it for a660 too
 - fix UBWC config for a650 (also affects a660)
 - add CP_PROTECT update, and corresponding a660 settings in A660 patch

Jonathan Marek (8):
  drm/msm: remove unused icc_path/ocmem_icc_path
  drm/msm/a6xx: use AOP-initialized PDC for a650
  drm/msm/a6xx: fix incorrectly set uavflagprd_inv field for A650
  drm/msm/a6xx: update/fix CP_PROTECT initialization
  drm/msm/a6xx: avoid shadow NULL reference in failure path
  drm/msm/a6xx: add support for Adreno 660 GPU
  drm/msm/a6xx: update a6xx_ucode_check_version for a660
  drm/msm/a6xx: add a660 hwcg table

 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |   4 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  51 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 309 ++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  33 +++
 drivers/gpu/drm/msm/adreno/adreno_device.c |  13 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  14 +-
 drivers/gpu/drm/msm/msm_gpu.h              |   9 -
 9 files changed, 350 insertions(+), 90 deletions(-)

-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
