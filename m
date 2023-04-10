Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F31A6DCD96
	for <lists+freedreno@lfdr.de>; Tue, 11 Apr 2023 00:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8252310E43B;
	Mon, 10 Apr 2023 22:40:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4BE10E43B
 for <freedreno@lists.freedesktop.org>; Mon, 10 Apr 2023 22:40:38 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id e20so6444899lji.6
 for <freedreno@lists.freedesktop.org>; Mon, 10 Apr 2023 15:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681166436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ExpMxaiAsYSC/kxMJmZJo/lYKKpscHCMufENOoO0Jss=;
 b=LQtBg78Rc3RIjK/NZdxj45la/WmU3KKsbqGoThwHmVhqr3sy6wHRVnWkYRDTAvL1gj
 A2QPJYb0iISeYpolqz32lfMnFZD/beoqQMmWmbFbG7qE2qZCv+23MhSJwlY3i3nkd+FW
 JW7nTn8cza7x6vw/Rw8fOH/gM97LocbXHoy91RAP7ewNzl7zhNHjIupJbPT3yhi6jwbc
 jQjCtBOZ7GK4ODk6HkE1XaL27zXdUCOA4T0iI5sCn1hXsWa0SvbpPg6glS7ou/9QTrHR
 YW32M0rBskdbBsueG1Ba+I6KTSG1jJaFNxErCLgEvFOjO2KSn9OoBmkTcJQ6YAvJ4Oa/
 yXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681166436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ExpMxaiAsYSC/kxMJmZJo/lYKKpscHCMufENOoO0Jss=;
 b=MzuBVTVBuS4PdLB4PSc3FcItYfjp5PuvwemT1lr6733SIn4CdvqHgXSdHp2qug+GEJ
 oVhmTZR1F/gTFytfP0nkdXNib9MiKufkecODFEcL+s/TftMFncD0Dt5KjcwNzwgPWa2G
 31wlCkIHsN086uPoycQ01ilNRyDWKmHS7JkFVvJbmtgsUX/MDdLYsezE0QLxRbMeyLLv
 WorwcsabexIeIEeWB4qv+Ww76c+aVcxxh+h2HoRKoLe18n5wZK+e3rqt8+npG5rXRXqc
 qBagyHXwiPwXx4ypEG6xwzTFqslikj5oZqWhyuR5k7Xc11ODda5/6JivB2BOqWMl3jH2
 1Ejw==
X-Gm-Message-State: AAQBX9evvdETgn8k8Jbbdiz00kYpFPQb2tP6RXLMSfWZBZYFtBgq0spM
 cB2AQGM4+Dp1Vtw/cOZKI28pMw==
X-Google-Smtp-Source: AKy350aZM/Dm9IAVjkzrpnrNGKkAnyaxL3kEvMMKkv5S1Zqvl3B8sQgi0Z5WHmQ0jjUxAcOa5vxccg==
X-Received: by 2002:a2e:9d08:0:b0:29a:1f7d:38b1 with SMTP id
 t8-20020a2e9d08000000b0029a1f7d38b1mr3633969lji.28.1681166435783; 
 Mon, 10 Apr 2023 15:40:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a2e95c4000000b002a77e01c3a0sm518102ljh.23.2023.04.10.15.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 15:40:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 11 Apr 2023 01:40:34 +0300
Message-Id: <20230410224034.443210-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm/adreno: fix sparse warnings in a6xx
 code
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
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Sparse reports plenty of warnings against the a6xx code because of
a6xx_gmu::mmio and a6xx_gmu::rscc members. For some reason they were
defined as __iomem pointers rather than pointers to __iomem memory.
Correct the __iomem attribute.

Fixes: 02ef80c54e7c ("drm/msm/a6xx: update pdc/rscc GMU registers for A640/A650")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304070550.NrbhJCvP-lkp@intel.com/
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1: removed whispace after the star (Stephen)

---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0bc3eb443fec..4759a8ce51e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -51,8 +51,8 @@ struct a6xx_gmu {
 
 	struct msm_gem_address_space *aspace;
 
-	void * __iomem mmio;
-	void * __iomem rscc;
+	void __iomem *mmio;
+	void __iomem *rscc;
 
 	int hfi_irq;
 	int gmu_irq;
-- 
2.30.2

