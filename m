Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBF927990D
	for <lists+freedreno@lfdr.de>; Sat, 26 Sep 2020 14:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090ED6E1E0;
	Sat, 26 Sep 2020 12:51:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751926E07F
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 12:51:56 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w2so1943087wmi.1
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WtnGFz89R34zMewLz4xKY9RsBgKhUDP7y7BnbgJVIuk=;
 b=RbjddDmEq2v1dCLPsdcA1GlQymeCxffB55PzVyb6bDVA+C7qnVykp3AfY4/uvWhfu8
 nHD4oQR1bMSE6FUzeckQnT+VzZT3tEO1w3q/RosnrURt3SDmrQdoN+v9VcBaIr/V8hUj
 BQCOVymTMNacNO+hdE5GKTGbJHSF1Ojz7Vxk94vPMe0TGUouJxYppjsQXDshMybVdYMt
 1AlZpH5tMmWt8P2vTZxkBEUx4xzaSAAErXSxehvwqi+6LxBrY483/gZYfei8MpKOOPxn
 Q9lHdfGf44okhdLfNWQznOZIykrsKn2s2hHvXfdbUZMa4CzzQjjljo8Sgl3ygzTYTNmT
 DfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WtnGFz89R34zMewLz4xKY9RsBgKhUDP7y7BnbgJVIuk=;
 b=IwInP4/ThKH5ThP2GmHLoa+lQ1NpZKQUXK4BdTJIMKxI8TQwFVLyy9l+kg8NQw8ScH
 hMusRtvGK726+NFqm95ZejAubowVHXt+hoSxjyvzuDOj4doq5Qf+GRmZ9a2Wfl+b/BvV
 hXkJngtANSDoo1Z9Yp7Wlh5NM3baMaTHsHSqTictWjQ3/TtdKJov4RhOAG1VXnLz+3Pk
 nJijl+v//zwJ7oNo7js+XF18n8GE515Tr+PvjK5UrOE5aQAjAHLUUs8eb88zra4fHQf9
 y5JJaHqkfT0PcNeuehI2m123wQFLX3a0AqvgQCOkk7Z/Z5cc4MZ2Di4CPwWkZULzKDOF
 7bkg==
X-Gm-Message-State: AOAM531Ubj9Z81nnwjg5YixVFJgYLNQQ75lHbMsl8TH6E934QDlNZRh7
 6b+97L2mu49Yr8r+q4Ufvf0=
X-Google-Smtp-Source: ABdhPJztqPYuaxUqhiJHnlgspPDWDKt+SSYEyAxLwzTILjR/AIFGICR1CkT656KMnZk6HY1AdKTS0g==
X-Received: by 2002:a1c:6254:: with SMTP id w81mr2444847wmb.94.1601124714991; 
 Sat, 26 Sep 2020 05:51:54 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 05:51:54 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Sat, 26 Sep 2020 14:51:40 +0200
Message-Id: <20200926125146.12859-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/7] drm/msm/a5xx: Remove overwriting
 A5XX_PC_DBG_ECO_CNTL register
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
Cc: freedreno@lists.freedesktop.org, marijns95@gmail.com,
 phone-devel@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 konradybcio@gmail.com, linux-kernel@vger.kernel.org, martin.botka1@gmail.com,
 jcrouse@codeaurora.org, daniel@ffwll.ch, kholk11@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The PC_DBG_ECO_CNTL register on the Adreno A5xx family gets
programmed to some different values on a per-model basis.
At least, this is what we intend to do here;

Unfortunately, though, this register is being overwritten with a
static magic number, right after applying the GPU-specific
configuration (including the GPU-specific quirks) and that is
effectively nullifying the efforts.

Let's remove the redundant and wrong write to the PC_DBG_ECO_CNTL
register in order to retain the wanted configuration for the
target GPU.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 91726da82ed6..6262603e6e2e 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -594,8 +594,6 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
 		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
 
-	gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0xc0200100);
-
 	/* Enable USE_RETENTION_FLOPS */
 	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
 
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
