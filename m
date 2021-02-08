Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBFF313E40
	for <lists+freedreno@lfdr.de>; Mon,  8 Feb 2021 19:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44E56E9B8;
	Mon,  8 Feb 2021 18:58:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8E86E9B8
 for <freedreno@lists.freedesktop.org>; Mon,  8 Feb 2021 18:58:57 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id o193so5994955qke.11
 for <freedreno@lists.freedesktop.org>; Mon, 08 Feb 2021 10:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jYhNq9J4eUCsJQlyB7QDTAg4cfCspRt25Vic1ErfLYE=;
 b=CqixGP/PzRiRbv/LMmJxXg2aPCD6CwmtfGrFoOzBjw9hlC5/BWTQOqPnvOpotAcnS/
 qXTtdYim1pxsFkV3KMZKQG8c5zzT5l8dW4xStkWHis3v+ns1X9EaSMMKNOzTI3olEM3S
 w9rtyQr8aPUaE6v7HLgx6M2k/vEehnm72uJrtIpKmYLYQ17cuR5otqxyWvVu5a/y1Q2f
 UKTVMzJHsGHS2wL0+LSW3kMHdRf7rDD7BlDzyBWit9fMnibCKJ2FJKIRe95FYMnL6YDK
 lcR1L5fRH+ZFPR2yQ5LDS5BNm/kHIOAwej4FsofoTQYA92bgZM4yyY5NJBalUZK1Am9q
 JI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jYhNq9J4eUCsJQlyB7QDTAg4cfCspRt25Vic1ErfLYE=;
 b=JiULK5b0SZHPhdnVElZTkM8M9d8rws7uJR84y9z220ZOOex7FwF2wy7N8ZxzxQnx2x
 PSo+vBj4jUfeFQGqOEpKQJujDJMpxl02qCGfeUDN8cCd2WTaOS8y7/MS5t4fKX60UTMF
 O9YkZMJKC3gb4X/4tP0G56Oru4w0QcCzrF3JJ7eJRhVhkEAUTbWlkoAmtbrEiX2dH4MV
 IK5WysbpcSFJ8xQayGZ2Lmx2fgfDXOJ6iUXMaD8l1EUgun1aB+qKva4blNLjDaw5HoaP
 ghLhMwz0g5izXakJQRGtdBX3Fj5Vb6k6V/35xknVfCvYljh2jlkdF98g7C+j/Zmw3vZg
 orJA==
X-Gm-Message-State: AOAM53342DVzxAnoZ7kpe55Ii8IFdzlRZ08k7HqoNntR4Bp1CudicsV5
 F0Q6hCIoWujnlBz7gtgQEiWEgO60SrNU2ZhG
X-Google-Smtp-Source: ABdhPJxBgoyARebzLux0sy3rxY2UD6jbjWyAv34vrESk8EiNTwfqkD/P/dRw1REVGzbBLj/BH/aj3w==
X-Received: by 2002:a37:a7c3:: with SMTP id q186mr4972322qke.475.1612810736317; 
 Mon, 08 Feb 2021 10:58:56 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id o46sm4069218qtb.76.2021.02.08.10.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:58:55 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon,  8 Feb 2021 13:55:54 -0500
Message-Id: <20210208185557.15703-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: fix a6xx_gmu_clear_oob
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The cleanup patch broke a6xx_gmu_clear_oob, fix it by adding the missing
bitshift operation.

Fixes: 555c50a4a19b ("drm/msm: Clean up GMU OOB set/clear handling")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 71c917f909af..91cf46f84025 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -339,7 +339,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 	else
 		bit = a6xx_gmu_oob_bits[state].ack_new;
 
-	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, bit);
+	gmu_write(gmu, REG_A6XX_GMU_HOST2GMU_INTR_SET, 1 << bit);
 }
 
 /* Enable CPU control of SPTP power power collapse */
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
