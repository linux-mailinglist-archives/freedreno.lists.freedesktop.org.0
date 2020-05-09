Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A267C1CC15A
	for <lists+freedreno@lfdr.de>; Sat,  9 May 2020 14:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5533F6E340;
	Sat,  9 May 2020 12:39:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEBA6E33F
 for <freedreno@lists.freedesktop.org>; Sat,  9 May 2020 12:39:09 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id x10so1908455plr.4
 for <freedreno@lists.freedesktop.org>; Sat, 09 May 2020 05:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=zz6Bha52VCZ61VoetFX6PmuaWb+O9/LCwGgsnXFAyiY=;
 b=Zhr8xkcT/iFzof+8Lq/M9MZn7g26C7RBMOmnVug1qXGSTBCXQnz/ChHs/kf5zBhZxS
 CUO45SVfyihUDzPPrW3YtxnkKJrULl2FOTQI6VDNEsK41/hpPXFB1COOP7fM24ckQmST
 a9dmXLIC2HllaOujQVp3/Q0s9f9oxatHZ/LjUGqDdNpF8EK1NvnPtwyZQ22B8IsIp9Sl
 HHY91TRuYwk9GHNIeg5zdUtQ6fmeV1PgGFeYiEYQH6uqVf/yLFFeXjUVsEjaX4iCdUOY
 Sd0RATJf9q/HYxWiBXznULNGDlcfwfkgt+XcLZsyp5CwSAeYbkpsFpTIAKZ+Ow+VIHdP
 njWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zz6Bha52VCZ61VoetFX6PmuaWb+O9/LCwGgsnXFAyiY=;
 b=cFw4FqdwEGWYw0leT904WpM/Mw4Aq0o9FmxaPwSLSOSoAE2+/AYPJkYoj8qFf8Ct6c
 NthdNo0v4RvcNTNQVK7/sGmNwhvxbgjmBCuFx/UJVvZt1D8UoL1AmowwQtkqFu/C5Gyh
 thyZmpnrszNZHWMB4fCnUVmSQmGiex/2k/kVKPSdqb8NCFgI1j67SX8WyjEl8FMf/xLY
 DzuWx4S0wjLhIueKBHmrKyix9xd+pCvvkygQ8Hm4A/1aCh070HWdnnJuSGNQLxfTC0NF
 rkQaLKVX96SroaPV1HNGCDjFyOHP/13nsVSPZC0yhq+yFQ3b9EbIi/AcDQiWmkYxZTtu
 4u9w==
X-Gm-Message-State: AGi0Pub3IShuLu7uOJRCNDTeNWO7ZLzeoFs1HnjLusTwIia+OZsUubzU
 EuejhnSKD9O/eqSrbztIYFT3QA==
X-Google-Smtp-Source: APiQypIDp6M2kg12boFEgMkHohjl3ZCmHkBzrqrA40GcGuCiJCUfA199wQAB34aIsB+rp94t27z9ag==
X-Received: by 2002:a17:90a:a012:: with SMTP id
 q18mr10307037pjp.220.1589027949364; 
 Sat, 09 May 2020 05:39:09 -0700 (PDT)
Received: from localhost.localdomain ([80.251.214.228])
 by smtp.gmail.com with ESMTPSA id o6sm4447828pfp.172.2020.05.09.05.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 05:39:08 -0700 (PDT)
From: Shawn Guo <shawn.guo@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Sat,  9 May 2020 20:38:44 +0800
Message-Id: <20200509123846.27932-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [Freedreno] [PATCH 0/2] Add adreno a405 GPU support
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
Cc: Jordan Crouse <jcrouse@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>,
 Konrad Dybcio <konradybcio@gmail.com>, Brian Masney <masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The series adds support for adreno a405 found on MSM8936/MSM8939 and APQ
variants.

Shawn Guo (2):
  drm/msm/a4xx: add adreno a405 support
  drm/msm/a4xx: add a405_registers for a405 device

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      | 82 ++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 ++
 4 files changed, 84 insertions(+), 16 deletions(-)

-- 
2.17.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
