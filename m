Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 526B339FDA5
	for <lists+freedreno@lfdr.de>; Tue,  8 Jun 2021 19:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D514E6E563;
	Tue,  8 Jun 2021 17:30:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F8F6E563
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 17:30:08 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id a15so1654175qtx.13
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44vYfbOIABvco8eG2D1gJ7pjRjWLhtG/LxGeHPBuoFg=;
 b=WNcrPqJZFDhR+GppnUt/Ho4z1lo+ghVk453OcuFG5EQ3WnHh9c+La3faogb8M3azO4
 nXtNGyofwd3/qykvUd59kHRlqyBkkndn9eycBzewLxOmTtwf5u+typeymWhqxXDSOVoe
 ORiuJSpzNXZ8A9bmR1/oc28wh78BHn4O7WNyS5xa1rtiSb6xJBcA//ZRZjhTsoEt2Shi
 g/dyG0dOD9JUBO17UAp1H2HQKhDLocuMPzPmfSq5461oZ9back2M7EvfDT0O35LzXGCY
 NGm/YM1xDFwbKZPiULzPFNJQuTXUjXa8dJTfiA5F0C0R8Kv6QmZCPzGtCMuchHZ6bx2E
 gd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=44vYfbOIABvco8eG2D1gJ7pjRjWLhtG/LxGeHPBuoFg=;
 b=GHN+x6k0CHJKPR63IkfurY9NmGF+PBQUhECUdvpW+fjsgx4eEnFZHmk6IG83txS26p
 iH5J5vWMWef/18IEGKwwGnDMBFztl5VxyCLsahTM4lcn8a0EDTgNInxwYAAEoQyQoMZB
 jkpjIFRPIv8L4GdMJMOgZgTxoV+KPqorGGVVbTcr6IaZwOPIL7TbgTIczfrmwkuqaK96
 EiQI8OA9u2QsK2aWJ6oA1JmErSIrJ8ElrmLEtiDBOutxsKq9nungDYLq6NNyO11m/z4D
 E6/WCc2jYN7xlSPAP9Hrzfkb8H+86GFh1nOv37LQokgtnED9UE5jvQZwwd077Kuln5US
 Kaww==
X-Gm-Message-State: AOAM5305rBr2maQYmkrfUKDnyzwqfgWxz6LhHbohPUtZ6UfUcIGk95zI
 JlkLR3uGsbN6BeAtEVrpQEzEczC/dCIX9kpcZoE=
X-Google-Smtp-Source: ABdhPJzVrQjUH6buawo7b+mb3MemRseIkztNJFsIWxhwVUPVhBOzmMCnvGoQNBKu1a1p2MLKJVSdEg==
X-Received: by 2002:a05:622a:1751:: with SMTP id
 l17mr8131811qtk.35.1623173407491; 
 Tue, 08 Jun 2021 10:30:07 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id d10sm9482983qke.47.2021.06.08.10.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 10:30:07 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Tue,  8 Jun 2021 13:27:46 -0400
Message-Id: <20210608172808.11803-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608172808.11803-1-jonathan@marek.ca>
References: <20210608172808.11803-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 3/5] drm/msm/a6xx: add
 GMU_CX_GMU_CX_FALNEXT_INTF write for a650
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
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

downstream msm-5.14 kernel added a write to this register, so match that.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 4 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index c1ee02d6371d..0f3390eab55e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -751,8 +751,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	int ret;
 	u32 chipid;
 
-	if (adreno_is_a650(adreno_gpu))
+	if (adreno_is_a650(adreno_gpu)) {
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, 1);
 		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF, 1);
+	}
 
 	if (state == GMU_WARM_BOOT) {
 		ret = a6xx_rpmh_start(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index 5a43d3090b0c..eeef3d6d89b8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -292,6 +292,8 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
 
+#define REF_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF    		0x000050f1
+
 #define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG			0x00005100
 
 #define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP			0x00005101
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
