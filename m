Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7951E34DD95
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 03:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A8E6E7EF;
	Tue, 30 Mar 2021 01:34:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24C56E7EF
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 01:34:14 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so6837764pjv.1
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 18:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8A8If7oybmQFoEyCFbbgw0aizc2xKMTrL9mIp4UPDLA=;
 b=jitl4f2XQUctjdUPCCbZajr3dY4HcAUyftf12BZnk9gT+ExyOyrfn1aeoQJ97WZv0F
 OziPeisSf7nfUL7Vir9BOCH2pJ0XxVwB1H8xsIXQFZDnO6OkQaoxXASHwwKGvO2wAjMm
 FPgUiUBYn8zXhTWWhrZ1y2FlZIk7LUO6kXJ4vzAp+pxcg48qeGgblFHxoorxNK5OTqDa
 Ar76TxInftkgSBm46CJTsBm13wEPwKxMK42wjPYLc84bsm3TsVTGaSD88tANdPWVNzT/
 34zNyPZ5NkE8fqvKkZ/LalogOaGJB456iDWehYkIyhzq495DhRaEeJd5KxIRH928s9LT
 Cyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8A8If7oybmQFoEyCFbbgw0aizc2xKMTrL9mIp4UPDLA=;
 b=VZPXb1bQMuKKJnluC1FDpb+qLIlTjaG5jV68wukwAmxxMH0xbso5lubj4NbiQvve7f
 ZErcgfm5WHLFApRsVdsco2Ryf8x/bG/gCde5IXLRdtaEN/D7CcRm5mPizviwZ+CxRg+l
 4PcBsddicDiOc2alB+UsZ9nWVPMvIyJcQ0UmpDtdu7F6CkYNc8Qio3wHGK0/RgdnkN64
 2wfJnS++d0lXX/aFRT/CRCSdN6f/szQqmv11IHZMbHlLBKd0F6hcyxzuGJ1haaZLYwRK
 UVcJ0ufGhvxGPURDWXz7rEeTNTncy77FnBZ1lCUd9AJs+D19RoL3dUgbzNdUdb4Yk8Q/
 z2ww==
X-Gm-Message-State: AOAM5310TH/8+K1e6XhC2y8RjV/fLrnEEIeKMfRQlBPBCMXhXB8BxOBQ
 oNdDk+TimuT54+rPc6AgipnuGA==
X-Google-Smtp-Source: ABdhPJzYWn5sEsuZHqydzJcwoR+ebQ0R+EoGQlVFKwWjvoaLyMtIay73TxhsG1977KSK5uO/wF6Mig==
X-Received: by 2002:a17:90a:a603:: with SMTP id
 c3mr1821365pjq.107.1617068054533; 
 Mon, 29 Mar 2021 18:34:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 k27sm16752258pfg.95.2021.03.29.18.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 18:34:13 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Date: Tue, 30 Mar 2021 01:34:08 +0000
Message-Id: <20210330013408.2532048-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: Fix removal of valid error case when
 checking speed_bin
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
Cc: freedreno@lists.freedesktop.org, Jordan Crouse <jcrouse@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, John Stultz <john.stultz@linaro.org>,
 YongQin Liu <yongqin.liu@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Commit 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to
access outside valid memory"), reworked the nvmem reading of
"speed_bin", but in doing so dropped handling of the -ENOENT
case which was previously documented as "fine".

That change resulted in the db845c board display to fail to
start, with the following error:

adreno 5000000.gpu: [drm:a6xx_gpu_init] *ERROR* failed to read speed-bin (-2). Some OPPs may not be supported by hardware

Thus, this patch simply re-adds the ENOENT handling so the lack
of the speed_bin entry isn't fatal for display, and gets things
working on db845c.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Eric Anholt <eric@anholt.net>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: YongQin Liu <yongqin.liu@linaro.org>
Reported-by: YongQin Liu <yongqin.liu@linaro.org>
Fixes: 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to access outside valid memory")
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 690409ca8a186..cb2df8736ca85 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1406,7 +1406,13 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 	int ret;
 
 	ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
-	if (ret) {
+	/*
+	 * -ENOENT means that the platform doesn't support speedbin which is
+	 * fine
+	 */
+	if (ret == -ENOENT) {
+		return 0;
+	} else if (ret) {
 		DRM_DEV_ERROR(dev,
 			      "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
 			      ret);
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
