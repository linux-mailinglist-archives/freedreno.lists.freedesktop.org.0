Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D138CC8B85F
	for <lists+freedreno@lfdr.de>; Wed, 26 Nov 2025 20:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF0310E6E6;
	Wed, 26 Nov 2025 19:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vwhcj+aE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBA910E6EA
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 19:06:43 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so21753866b.3
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 11:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764184002; x=1764788802; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=stckSta45RSO4GKvqssT9Kpz23idPNbtjVdz9ZGQhAQ=;
 b=Vwhcj+aEab5rtf23NovA5tQ9ArDhplA5CV9jkgcgZHLX/lE98NQRtY2aR7KFzooNGz
 vawZgHtKOJxAS4qHCk2/I4vZquW7GSLitx1/MY+BStQDTEhFRgP6oOU1xGC/K4tdNnvZ
 CWfgbBwc0hRgohoPbd0sGp2nSfn0d+ijcQiUpmI6aH5HzMqIIfSIqwh+VFhCgis1eTJg
 rFPI7/CrZgJ8YjZ1op+sUdmcF+b/U6Z9Z7273OvChTTHGl8Kai6W9TaFaI3ClyQQ5mYy
 WP+gLNZaLbf3WS66tsysbHQhyqbky1u6qIQ3FmUIX8C1S7a1clBPmhslUkwNsCBjoDsT
 /Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764184002; x=1764788802;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=stckSta45RSO4GKvqssT9Kpz23idPNbtjVdz9ZGQhAQ=;
 b=SRxV9ajcBdLh8DWd8XGXrCnKi2l3Agj+beqkS9+wUVw7sb8so68UO8l8aFhCVQoF7b
 B2ln4rzs3EUbMZ9/IETmxMuwbweHPrGnDwFuAgjAdQGR4ldCjpF6pMzROe8GbtQOeQ1I
 TisUu5P2wzjUKjXqUs8DUZROnn/WnbN8HoklGis5zee4tSv8ynHLc7d922wQYmt3X6IW
 qfTVULjD47XvpgdbaUJE3WAGYTnLEPtRNF/IKarmdnh8ZgIvduHhK2TVdTBvQHjJvl2W
 6dLPfP2oVyD1YFu50wyIa8ta9PrXLEtxPfPaK0BqWt7DE3rQdFrB/z74cNqk28I8Qlvn
 3YKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5qgl+F7+lUH44yvCkPq9vJAFKsWf7qaiBZoSDtxj3wy5r8LNzBVEu2MDzWwO8SXQvl0sTXXyVjKE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEy2EYTVet7F/CDqeIXp2oqMcpVK4ZHx3z3aaorUv7FHmvEqCF
 wgZv+vRKfkCkgPITaYN1XA8+dxY9dFCWoB/bw2vKApQmOC6W3PE3bc8=
X-Gm-Gg: ASbGncvejh6u7nJ3kt/9c+ti1u6YLNjDkxZIGyKV5Nh+uQ6s3KeSxwFc0kLB1NN/vvi
 KPDFPTM5qUAo1OEjnRz2HHDk2N9v9NAfj1B+AyuF/O74Mrqr4uilqkzEXV1J/XCt074IvhT+OPH
 8labBTwb/f/R/289mx+F0PJZrQ3iyxUpop7tYe0hpz0kgl3gMk2VPStdeephF9xZTx9U4IYj1Jv
 dAtYbAhZrwUH/cDe2bR9CAa3Ru7MmUrGGpSgObWsP/9prOoAyQz4PLXZ2k+sBPw8s+3O0FWUEpH
 lAVC0wY7MPVQU7ZuPVcYrlvtJDN2GvOb0mftEM64kCpKQvA/8ZkV699r7GtgNQ0X+psS9YK3e7t
 popwy+Yj2ctPVnc1JrRD+I4BsTLbNtdhphHXYuzroylhv27Lq5r+IxAeORbmtL6H38GQZwMP69p
 6IGY7cdjtBumtN89+0JCdLvuBbt3J/tq+nFa6tnOO0w44q6pCAVlwub6ZbH/mplA7IRTFi5/No9
 A==
X-Google-Smtp-Source: AGHT+IEO55xzsXA+ZlrZjP+KV22ag55rRi9OAgB0Mc9+QCEFL9ug5YnYdS/m8CJD3vtIPmo5let39w==
X-Received: by 2002:a17:907:7286:b0:b3d:73e1:d809 with SMTP id
 a640c23a62f3a-b767173270emr2633206566b.48.1764184001521; 
 Wed, 26 Nov 2025 11:06:41 -0800 (PST)
Received: from [192.168.1.17] (host-87-16-172-206.retail.telecomitalia.it.
 [87.16.172.206]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cdab19sm2062564266b.10.2025.11.26.11.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 11:06:41 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Wed, 26 Nov 2025 20:06:23 +0100
Subject: [PATCH] drm/msm: add PERFCTR_CNTL to ifpc_reglist
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK5PJ2kC/x3MQQqAIBBA0avIrBNywoiuEhFiY81GRSsC8e5Jy
 7f4v0CmxJRhFgUSPZw5+AbVCbCn8QdJ3psBe9RK4SjZRbvZcPuLUpY07XpwZkCNBK2JiRy//29
 Za/0AckzexV8AAAA=
X-Change-ID: 20251126-ifpc_counters-e8d53fa3252e
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764183999; l=994;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=gXWVyG9h24Agp604ZvSh2BkWdNVoab+cVEPp20+0P/o=;
 b=NTVIfrsDGcRjmRgOu+Y2IQYIb8F+JTr+P+HhY2BNIwGMi92QWwDh2DrCZ6O7rLd21GBVLZyOJ
 Z3IhujLoQZSDyjn7zVrUOdnNwZP9xRPDPR0PqIJO+NdBnzwPvwUoGn7
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Previously this register would become 0 after IFPC took place which
broke all usages of counters.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 29107b362346..b731491dc522 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1392,6 +1392,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
+	REG_A6XX_RBBM_PERFCTR_CNTL,
 	REG_A6XX_TPL1_NC_MODE_CNTL,
 	REG_A6XX_SP_NC_MODE_CNTL,
 	REG_A6XX_CP_DBG_ECO_CNTL,

---
base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
change-id: 20251126-ifpc_counters-e8d53fa3252e

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

