Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2716D1306
	for <lists+freedreno@lfdr.de>; Fri, 31 Mar 2023 01:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14FD10F0B7;
	Thu, 30 Mar 2023 23:25:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB5910F0A6
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 23:25:27 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g17so26675642lfv.4
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 16:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680218727;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ulzx50nltdBvd14PSoi/AyrNNr9j/GqEsVc35iPrtqQ=;
 b=fXwrEbMbQSuULOzCc5FZSh9TsU7bIewyQVd/hNko2e/PZ9uLzQFtEK4cteKOKdLJFr
 gz7li7VW+2/OqqGK9gQNMpo4O9tesae0ieOoZQ9A3gPHBZq8JAgCg3StWwEonmit2USw
 UKoshL2RIFAOt0WH66nmGuBuNtlu//r4tERWzle7CxBvRswTx1QTE8kOsXkIHAbU3IDe
 dO72/BYpDBJtrYoreys9/NF7dG4eTkcVJOW396PrZnQgMUrk2RvAirmYbLm6LOQ17/7q
 4yiduTUaAM0zmowThTcJlY2Xk7NHGhYnmIee6NQFuO8yJMoYJi2mrrWtlLcD6paqXi36
 0hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680218727;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ulzx50nltdBvd14PSoi/AyrNNr9j/GqEsVc35iPrtqQ=;
 b=QoaECDf3mdhQ0lv4UcO9msNeRJE9Lu345KpUAavh0z1OOI+z/sWjNyGzLkZ4U1287J
 34I8qil2NJ3+svSsBR5iqryoRzZL3SHVN+w8hjvbxEK2iDbzVVDFFuI8X/nisKlYSjWl
 QIra/FYo3uEMHBpG+CleKAfrCwERcX6SU8EYvJdJ08+zC6/RSGFD1jecKcVXWs6Nvzu9
 bM/Z+unmyx7MEGRrmYhPXqOYgzs0a7HnyACG4L4Rpx32sBDUTO7LA3Eqno2zUnJXFSLI
 FgIkh1R6R+OPR5tzhBKb6bpwoQYVUvZpxmOICWbEIcMmK59TO9sORdlpZC4LfmpzUFNw
 FdQg==
X-Gm-Message-State: AAQBX9exIoG2WdRypqxTB3qLB7jGagUoxxPbTtQaONSUg+WFDC+sjg5U
 l9pv93oub7zQ8ytDhONO/u9uCw==
X-Google-Smtp-Source: AKy350Y4nvhrHuYbh1yWan15j/HtffFl0NiGPKhIhdyxhJQg/LugZsvI+5L4MzjOXhMaB0mUHyZvTg==
X-Received: by 2002:ac2:5e88:0:b0:4eb:c4e:bd87 with SMTP id
 b8-20020ac25e88000000b004eb0c4ebd87mr5700090lfq.58.1680218727463; 
 Thu, 30 Mar 2023 16:25:27 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 16:25:27 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 01:25:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-4-bf774b9a902a@linaro.org>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ve7dkZrYc5cSSMu89e01MZzyBYTeqWaeZyy4JZy7U0w=;
 b=Zke1xsMS3dnkdn+JdDDFWbcG6ov48tbnXWiZVfSJvfbVaMPHjiPK8ibVyXKOALdcGohtiQUDjEq3
 +dAI+2q3B3cF8Ol2RVrRAj48FIvuMTM7CAjlyLWuwULoocsKuaOI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v5 04/15] drm/msm/a6xx: Remove static keyword
 from sptprac en/disable functions
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These two will be reused by at least A619_holi in the non-gmu
paths. Turn them non-static them to make it possible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index ba6b8ea27c71..1514b3ed0fcf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 }
 
 /* Enable CPU control of SPTP power power collapse */
-static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
@@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 }
 
 /* Disable CPU control of SPTP power power collapse */
-static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
 {
 	u32 val;
 	int ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0bc3eb443fec..7ee5b606bc47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -193,5 +193,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif

-- 
2.40.0

