Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18619736A86
	for <lists+freedreno@lfdr.de>; Tue, 20 Jun 2023 13:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EDF10E2C9;
	Tue, 20 Jun 2023 11:10:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C6C10E2C8
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 11:10:48 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f8777caaa1so1597988e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 04:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259447; x=1689851447;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uceOjOeFYW3YrOQKTUQY3Yfirv5mMIrxQprXiD+0ONY=;
 b=ztMM6FNqBkOpSwDiWJL2e7rSNq6VWJS8i56x3Kg1UAKPk0mqK5tp4Z1Yhfj5wkK3lN
 deZ21ZkowskLeiZHgh7zmp7/Lhfuj/Cg9mLEwp6mbEpH5ubKPgFBqZ8zu30Av1kh3Vnd
 VeAmnCDWoFAGVeG0iMCJ5B+MIi4+xOFb86cf62GiET18fIvyiejPMzBZ9Sy2VB7fDrbW
 3Gm9yidK2o2UX1cdMyJMGrSsQ58BFD88ZMrhvX/K9nXFV/grqVT1Vp+mf559E/JD9Dnm
 uFuc/WLqEaUi+hZmZPcLjl3Bq7AHXEwLwxiuccTkDcj9OAGRRXCEHfWucy1MMWyIeDT8
 gzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259447; x=1689851447;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uceOjOeFYW3YrOQKTUQY3Yfirv5mMIrxQprXiD+0ONY=;
 b=IItbL2fh3nwdoNfxvt9ebO49WQIb3zlYjtP3emJom82LOsUvkpx+mc6Vh5qRF3Trh0
 Zkedxg0EF4AGxxxHHCYuQo/1Al81J9mT/MUeGczNXI2PHqWKHtRzxCzjCtTiCuIoadmZ
 faa1iqTxuCMfCTOt+Fg/80h+3WMVVkhzgEBzy/gMaUBcFFv8XhEq7DLxu0K9s/1dE6iz
 JaO13SKxUiaFyVR010ou5wdpHwW7t1qskMnr2t1IVIyZyrKdAhyA38TKb92k1e7xf1kX
 WBRimoN48A/YwGRqTjvJJvRrey2cTOXIkMsGuC4Fz3YSg0r2WgwUOR7cyNiK/+guU8Hx
 7hJQ==
X-Gm-Message-State: AC+VfDz+riOE5k63wM2a6zQczmeGyBpu55pnYx98vnPWUDMOUJDXQWDb
 Ox/xS04PxvcP2qn9ZckIPnXd3w==
X-Google-Smtp-Source: ACHHUZ5GoUelrBI2jBp22Cnk9kJgAaRVAYUKGa+bVYNEbPWpkYGNAg7M/qz9AWyd4yy10AZApldGGg==
X-Received: by 2002:a05:6512:47c:b0:4eb:3fb2:c56d with SMTP id
 x28-20020a056512047c00b004eb3fb2c56dmr6884482lfd.12.1687259446701; 
 Tue, 20 Jun 2023 04:10:46 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a056512041a00b004f764716afdsm314395lfk.257.2023.06.20.04.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:10:46 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 20 Jun 2023 13:10:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v4-5-b16f273a91d4@linaro.org>
References: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v4-0-b16f273a91d4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687259438; l=999;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=HgL0AdZtJqxx0twaid3jHnuqKqCDcBlTAxb3JHJlxVw=;
 b=6OUxqP1UratNBHaIvk/AXKzEsNL/3F8JlTdQ9lFpHEpyOPk+LGEI4QiHbJ5NtMR/bxi4Su24H
 3Szj+ZmchkmAR44vkHol0KW08DCQRUASJZGxokA55rQj2A3CcjObSQ4
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 5/6] drm/msm/a6xx: Improve GMU force shutdown
 sequence
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

The GMU force shutdown sequence involves some additional register cleanup
which was not implemented previously. Do so.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9929ff187368..55b12a8066ee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -893,6 +893,13 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Make sure there are no outstanding RPMh votes */
 	a6xx_gmu_rpmh_off(gmu);
 
+	/* Clear the WRITEDROPPED fields and put fence into allow mode */
+	gmu_write(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS_CLR, 0x7);
+	gmu_write(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+
+	/* Make sure the above writes go through */
+	wmb();
+
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 

-- 
2.41.0

