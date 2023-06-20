Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3E7736A7A
	for <lists+freedreno@lfdr.de>; Tue, 20 Jun 2023 13:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E224D10E2CA;
	Tue, 20 Jun 2023 11:10:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E75010E17F
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 11:10:47 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f8467e39cfso5885159e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259445; x=1689851445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QFAqDiLltNdklyeWnFl2VhcGAm3uwoOV8Onj4m150Sc=;
 b=INJmXdEmpvVXTm7i3mjAO0uySCULJiYlAGfi0xAC/HQG0TNF6pFPNOl3lRfnOcJmLV
 YTAsarOxgMOd1VtScH9QWuJzdxutC+CQzcDTWZzAggCpPr5HFxLK8PzB2hMeth75CCsK
 TDsMWhdivHMJC9nHTOEQnQCZZ9jgdgExA6AYseO9hp02lA4+ZoEnP/PJBsARms+8+2Uf
 iblB322RwEQAfICyC2mTbMlhG0UpgCiM/jOj7kw8dbYWUrEh789B1K+iwllvIjipSm0k
 UX68ERtZsgYYR7FQTUuBw4HXtDhcELRLDaiwqcFIrVqWn/AJvfNdJNW+vD3cDjKqRomQ
 7Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259445; x=1689851445;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFAqDiLltNdklyeWnFl2VhcGAm3uwoOV8Onj4m150Sc=;
 b=GNvHRq8sE6xcxBzKVSfNK9vWPK4CR+dhda5mYsFmin1M8Tpg2dscQRQnHJLYKFXvmP
 hIipYOrmi+P8fYdxLaH1eNbZIAj5GwUrDL6Ik+Eb3VU9JUOruY6sx+qoP4i8+83OAzrr
 eUewq6/3lEo8UzqjJcY6Bu/neWqoN5azVffssw5H2kVqH2vGlTbVr1gTALV4GQRD9Z7G
 9iEIQpLSUrC/Y//pF2fdaGcTTLFocaV+xOgo18FFAoKK5zkl0wgpECiGdlcJMTsG61MH
 yt4YOFODZYY1JhzN1yJP+MluF0ZhXcW7R1NS0Z6u/8uCoG+EKN6xPZXp0mlE9ZAQHLUG
 0/YQ==
X-Gm-Message-State: AC+VfDxUsRGVipm28USuzvztfljCh0Jxwj19aq7vfLvlIb/IocsXfjBi
 vEWOcQudoJbDWIXwAIdPxacVaw==
X-Google-Smtp-Source: ACHHUZ5eqZqdWUBigkTrmkmwCMGTjarq6T+1Y4fXQLi7UIXvf2LYvX4zPoiELEETJW3uy09iyxY4DQ==
X-Received: by 2002:a19:8c18:0:b0:4f8:6ac4:84 with SMTP id
 o24-20020a198c18000000b004f86ac40084mr3396390lfd.8.1687259445484; 
 Tue, 20 Jun 2023 04:10:45 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a056512041a00b004f764716afdsm314395lfk.257.2023.06.20.04.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:10:45 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 20 Jun 2023 13:10:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v4-4-b16f273a91d4@linaro.org>
References: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687259438; l=1213;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=xLnqc6AHpOSP+ED80kyz8V2j7nuk18OJ2Jy8h13Cf1I=;
 b=QopZRc6EUyhns0KVw6SVS/mXnt2VY3dxbBXKlHwjamd0sOsHi9ILo2buRVPW4sflNOLzCCv/3
 uwALjCxRCfDCC8KElFRyXVUV2TMrXf3AA/bOjOARIuUN8DEdT/p0VHy
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 4/6] drm/msm/a6xx: Ensure clean GMU state in
 a6xx_gmu_fw_start
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

While it's not very well understood, there is some sort of a fault
handler implemented in the GMU firmware which triggers when a certain
bit is set, resulting in the M3 core not booting up the way we expect
it to.

Write a magic value to a magic register to hopefully prevent that
from happening.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 5deb79924897..9929ff187368 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -790,6 +790,12 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_RANGE_0,
 		(1 << 31) | (0xa << 18) | (0xa0));
 
+	/*
+	 * Snapshots toggle the NMI bit which will result in a jump to the NMI
+	 * handler instead of __main. Set the M3 config value to avoid that.
+	 */
+	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
+
 	chipid = adreno_gpu->rev.core << 24;
 	chipid |= adreno_gpu->rev.major << 16;
 	chipid |= adreno_gpu->rev.minor << 12;

-- 
2.41.0

