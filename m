Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B491124B2BE
	for <lists+freedreno@lfdr.de>; Thu, 20 Aug 2020 11:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703266E92B;
	Thu, 20 Aug 2020 09:36:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518F96E92B
 for <freedreno@lists.freedesktop.org>; Thu, 20 Aug 2020 09:36:26 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v12so1321004ljc.10
 for <freedreno@lists.freedesktop.org>; Thu, 20 Aug 2020 02:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iyIFHI/GagIm4is2IjKR4dFCd2u6tmF485sTbdWxVbM=;
 b=MLkiiqpTIK0T8bIG8a7cw3MlTUto09mHqhVzUWPfnkk4OxAgoe4yk5RS+KzyPkc0rV
 fSzxXaaHo2Ohq+lyWw4WVH93TRgv0UhPZUicHg09AtCULq+HW79090fk/I68wSIlGQG2
 2YPoUJB+09rDM1BounEJ/4DbnRsg71ly86n0zyynHqByO23KsJ1MgRQ/VchwqV4iuXtR
 EPP+1nsst3H0kTK7jgtwccEi40dav3czNwj4Djj7S330dhKMPaA5ZW7WUY6bzUnGclve
 uVQdReKKsIlH6FcLOEOc27TBBv89loXlhqZcWAYQOMFu+5mX+RGolF/sT/kU6WzuEh1Z
 mtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iyIFHI/GagIm4is2IjKR4dFCd2u6tmF485sTbdWxVbM=;
 b=QvmvSJoQAdKJ9aqvuaso/lWSS6Sechja/xenzu9AySIYU81xUM1mRDtSS777wBEdV2
 Fk7yoUc0XfTf7Wq3aJ+Ihoi5NEGM6bFq8mVtQJLDtbFT8+MM6r759jr3urWfBCeZFf7A
 jxG0sNgzkntMH4vRlklImxc76Eqo8aaerp5HwH8tf3nQyr7IlicG127mKp+EN96VxFCG
 S4SJjHmo/hatfVLkqC0fWK+GaL0no0KUT+u6BaxBJOkQpdpfA6Gm6R/dUPQJxvkZulpB
 v+GbQIgcftKptDDe864P2SplH8D6ckZy13zq/+9E2QWtjfUQDsWCtAO04bqCFBdvnq2a
 hnRg==
X-Gm-Message-State: AOAM532T1PHXu5jWRzOme0/EZybi2cNYSCMfV2X8ms/1Ys9l6Y/B8Udl
 EFqzvRjqA5YkwOjFEIjTmNb19A==
X-Google-Smtp-Source: ABdhPJzkrJAsNCFVlqgWwzF85xdP8TGCbYUj+sMOPyxm2W8leLqPgVkA3ZiRvIiKvXe8klbPf8wjPA==
X-Received: by 2002:a2e:71a:: with SMTP id 26mr1262048ljh.198.1597916184580;
 Thu, 20 Aug 2020 02:36:24 -0700 (PDT)
Received: from eriador.lan ([188.162.65.245])
 by smtp.gmail.com with ESMTPSA id o1sm341811ljc.3.2020.08.20.02.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 02:36:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Thu, 20 Aug 2020 12:36:22 +0300
Message-Id: <20200820093622.3801751-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/a6xx: fix gmu start on newer firmware
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
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

New Qualcomm firmware has changed a way it reports back the 'started'
event. Support new register values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b67b38c8fadf..0df56292e227 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -204,6 +204,16 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
+	u32 mask, reset_val;
+
+	val = gmu_read(gmu, REG_A6XX_GMU_CM3_DTCM_START + 0xff8);
+	if (val <= 0x20010004) {
+		mask = 0xffffffff;
+		reset_val = 0xbabeface;
+	} else {
+		mask = 0x1ff;
+		reset_val = 0x100;
+	}
 
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
@@ -215,7 +225,7 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
-		val == 0xbabeface, 100, 10000);
+		(val & mask) == reset_val, 100, 10000);
 
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
