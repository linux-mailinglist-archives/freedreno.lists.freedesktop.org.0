Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 491061F80CA
	for <lists+freedreno@lfdr.de>; Sat, 13 Jun 2020 06:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634376E225;
	Sat, 13 Jun 2020 04:22:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04996E225
 for <freedreno@lists.freedesktop.org>; Sat, 13 Jun 2020 04:22:03 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id u5so5076035pgn.5
 for <freedreno@lists.freedesktop.org>; Fri, 12 Jun 2020 21:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=anOI65EuGWufQe95q4AY1YNBWRNaLqr1EwULyx7eqPc=;
 b=n1owtPTKXLSYWZxpOAfJLYBTnLB49amE5hE4rZuOb3sNSj3Vtf9fJSnLkcorKmdM8e
 1/WOfSp3udzaw7KbAmuaBZVnRtXTgdIJjnVwHpTveQphcOeiYFBboLV7OQ7q94XSrcZ2
 SkPvn10qiyTOizb+NS5awrsoIME5Uw3o5oxwgDL007hfH9Voi25MxOm4w9hfy749uxZ5
 9fV8ilJ5Rsd08uR1PWNXqcf9kxE+y2z/HuihWy1H00fq8vP7YB4mxKUyreThFOZcNegb
 vxYNb/t3mFbAVtygQljAVLvx5E7Jsupe6f9UO0jaTLqU7HVjQRAbC/raMfoqyTG/Kslp
 nzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=anOI65EuGWufQe95q4AY1YNBWRNaLqr1EwULyx7eqPc=;
 b=qhg533YpGzc/U5hyh6G3fQxrbPjxwB2VmSpYzdgQO2hHImhkfAn/MI7qLOEf0ojOa5
 BwOyu4u0uaLSbj/EqlZppZ06K+WH0O0OIkmBZTM79lNIajYuinngQX9CjBD7tWAoFFmu
 erkK8PllEYAReoP2CejXKLHEdpI2O6cx9OZ0accdkuiQoOivOI3F5KOUiBGzXWan9MVg
 JAI4pk3L2JuJooTgrRX7OpTxcHUhDW9yWBilaUXRSSqj2h04xeTVBe+izaFkUUOwvV0I
 Pc+8cFeYgB+5OsJXOEtq/+5EyaVng0oacryiO7U+LD2RnZDKJoNKiEMz3pnPojyARjJ5
 aIHQ==
X-Gm-Message-State: AOAM531ZsAZbuUs5eZXynSavhx7JEiO9TwsjOUOTa+7zQW1szGccZyu9
 RgVkvTIkwQn8x7Q4Z/WFmBO4Yg==
X-Google-Smtp-Source: ABdhPJzGMYCuY/za9R4qBuLeNIZHTPqJUnxWWu/ioBkOIdb8ujHo7WIYreHD+62yjKltYbY+atjfWg==
X-Received: by 2002:a62:7705:: with SMTP id s5mr14024168pfc.325.1592022123264; 
 Fri, 12 Jun 2020 21:22:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 w5sm7414719pfn.22.2020.06.12.21.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 21:22:02 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Date: Sat, 13 Jun 2020 04:21:59 +0000
Message-Id: <20200613042159.109511-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [Freedreno] [PATCH] drm/msm: Fix 0xfffflub in "Refactor address
 space initialization"
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
Cc: Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Shawn Guo <shawn.guo@linaro.org>, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This week I started seeing GPU crashes on my DragonBoard 845c
which I narrowed down to being caused by commit ccac7ce373c1
("drm/msm: Refactor address space initialization").

Looking through the patch, Jordan and I couldn't find anything
obviously wrong, so I ended up breaking that change up into a
number of smaller logical steps so I could figure out which part
was causing the trouble.

Ends up, visually counting 'f's is hard, esp across a number
of lines:
  0xfffffff != 0xffffffff

This patch corrects the end value we pass in to
msm_gem_address_space_create() in
adreno_iommu_create_address_space() so that it matches the value
used before the problematic patch landed.

With this change, I no longer see the GPU crashes that were
affecting me.

Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: freedreno@lists.freedesktop.org
Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 89673c7ed473..3d4efe684a98 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -194,7 +194,7 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	struct msm_gem_address_space *aspace;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
-		0xfffffff);
+		0xffffffff);
 
 	if (IS_ERR(aspace) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
-- 
2.17.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
