Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3987F7BF273
	for <lists+freedreno@lfdr.de>; Tue, 10 Oct 2023 07:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664FB10E1A8;
	Tue, 10 Oct 2023 05:49:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C53A10E1A8
 for <freedreno@lists.freedesktop.org>; Tue, 10 Oct 2023 05:49:24 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c124adf469so59716651fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 22:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696916962; x=1697521762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CFbHOAgZVXSg1kKOflBZaq1B31YfZJPkEFEvk9ENnLs=;
 b=rJeJA/UNIRaRkR1+DNYfe5cm39Hs1ObLsC1Po1xohqggxSzNVd4kopqkClzSazB1Rf
 ElgST5msdj2VCuvgnfLB+6p45Ji2IZFOMhWxi6Cs0WSEBw12NM5koVsNgCAQ3ZVn5t/6
 lNnRbHRjaz9HBhADvbyGMolyoxEZy8gmYbE4j1yiE070/EkLaNURUgMeRWmm0++DECTo
 CWN6arnEkgyPSQl3aQeFXuxeRKZLfqjFpktNO1qHsmjfV20k+rfe0OWhadU9umBApkFA
 2KwrxgGs9bUee4vhOCOja6VpbNYj4SomBABTNGS5S9Agf4wS1l5PrnvodWgEksRDbPA6
 xNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696916962; x=1697521762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CFbHOAgZVXSg1kKOflBZaq1B31YfZJPkEFEvk9ENnLs=;
 b=gLItGr846AGzZzkNxKFhscVWeLvfOxd+8OQr8NC/BgP92XGLzaxz3lpXxqN44wrJb5
 8p559U4Qsej6kcc44CIaF35DoWZCfsmEBzf08hBUhpGMWM+UYuCZY/3WVWfg4hMtCODD
 SrbVwkrz36568qnbvBK/iXd1RtmL7covaqYqoOkWU9iFMdmytOSOSPJIGDN8CNrjBkRR
 QljD7fc8Lj6HGfJE9hiyColFK+EG3uGOjeURYkLZzLWsSUu8X4l65QDFMtervkqv9ygb
 S0T0UnV2tqE9mbJKAEHnx3zjhxJeop5TJ7k9/1MNgUQcoD9IgeMAzsahOQFZqaFgE7B5
 DukA==
X-Gm-Message-State: AOJu0YyppVixy+vaK53NHPoBQjnDKUpM33Q/HRcguuAj559J96m3ID6m
 VUqB5o3rJCq/whVKR2i6paHwgw==
X-Google-Smtp-Source: AGHT+IFJ0hwFexb/Jn2jlVn3hI6Fio1n0bEXN8vdVrCP2YpJpdTs8EeiniK6yetHCXyfssGsOUG1oA==
X-Received: by 2002:a2e:7310:0:b0:2bc:fd50:573a with SMTP id
 o16-20020a2e7310000000b002bcfd50573amr14953125ljc.6.1696916962099; 
 Mon, 09 Oct 2023 22:49:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a2e8216000000b002bba9a4f715sm2280398ljg.11.2023.10.09.22.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 22:49:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 10 Oct 2023 08:49:20 +0300
Message-Id: <20231010054920.2821140-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm: fix fault injection support
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Readd the header that was erroneously dropped during KMS code
refactoring.

Fixes: 506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310100836.6E6zjEcE-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 93c026d79aea..2aae7d107f33 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <linux/fault-inject.h>
 #include <linux/of_address.h>
 #include <linux/uaccess.h>
 
-- 
2.39.2

