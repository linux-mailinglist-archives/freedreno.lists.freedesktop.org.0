Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BE745E468
	for <lists+freedreno@lfdr.de>; Fri, 26 Nov 2021 03:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8C46E44C;
	Fri, 26 Nov 2021 02:26:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EB86E435
 for <freedreno@lists.freedesktop.org>; Fri, 26 Nov 2021 02:26:47 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b1so20385888lfs.13
 for <freedreno@lists.freedesktop.org>; Thu, 25 Nov 2021 18:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I1rm/Jq26oF750hAIzAZnETPbyjuEDPSRcantqm5hzk=;
 b=p3RbkfySYS15f3JktRp/ICFfXKUEOE5t/hoQQfLNrILJRnMKLNFPkAEEmHNa96vkhM
 L9BJgNowHwb/YT3zzXQRMNvZG5vlIHPIepPKJtDDYRDaFV/n7gXAiT+7T2rsGimtFqdO
 raV3Fb9/j+MPXqHOJNUXwq7xhevUdGooQWk+2PlCWIK5mejiJi3mwOyBhJVyrRfILXL4
 mmcOKeah7zguMf+7nbzsFsdHcTpaLr4EER+D4FFJh12mMyZ/F9hlPg/R5IBGe9rg0Nmc
 QWr6KtjS4pDNjxWg9zuJTZ1MpqfVM5qiikfhhC6Cg1buA6fP15eBpCYQ6paQ4/5zgueP
 NJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I1rm/Jq26oF750hAIzAZnETPbyjuEDPSRcantqm5hzk=;
 b=bG3MRkGBRxd8ZDFwRnqFyIiqxSTTdBWgYCsdyg/EOUJVDda5OmMJrn39aukfnyM3I9
 Yu0qJE6+3b/E/zjUWP6TQQ4WvKLiHcbZXNdxQZAdUN/BNu4WqvK5+R5eQhGvXCFnFBbA
 Ndqr8BsXMB5xEhqXeZLwKxQg49/qf/qebMVB/yb39NSbg9iBB1r8NoFaSHmy+jdEvxns
 1RWZnsWuBWCcRt0IQSq9YT+C2ShHX5baarVAnVpkfgPa8esEGRUdWLUe9aS29276lm37
 PFLp7AQT0Ze4klkkzqaQp5CdxgIjK2koYPpmiF2UP6W6UJEueqPU1O/gtzfEsWq7AzXn
 HKXQ==
X-Gm-Message-State: AOAM530kL6Bhi8gtsbwDkyCpzf9VsydcXLywrsHCxuZivoVjCozuZ9em
 nqMxYnhvempnVouGNO1L0mdPoPy52V7epQ==
X-Google-Smtp-Source: ABdhPJywAUF2danCuEaYc5z8GfRLwOTylEft3KFvbxaoEikJOX/LViWl+3h38NiLwTp0vQTjHAVwSA==
X-Received: by 2002:a05:6512:1289:: with SMTP id
 u9mr27603853lfs.273.1637893605421; 
 Thu, 25 Nov 2021 18:26:45 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x6sm388764lff.125.2021.11.25.18.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 18:26:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Fri, 26 Nov 2021 05:26:40 +0300
Message-Id: <20211126022642.1105979-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126022642.1105979-1-dmitry.baryshkov@linaro.org>
References: <20211126022642.1105979-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/3] drm/msm/dpu: consistently index
 dpu_kms->hw_vbif
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Always use vbif_idx to index VBIFs in the dpu_kms->hw_vbif.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a15b26428280..8e2236fe5039 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1057,7 +1057,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
 		u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
 
-		dpu_kms->hw_vbif[i] = dpu_hw_vbif_init(vbif_idx,
+		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
 				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
 		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
 			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 21d20373eb8b..bd328b5c6306 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -152,14 +152,12 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	struct dpu_hw_mdp *mdp;
 	bool forced_on = false;
 	u32 ot_lim;
-	int ret, i;
+	int ret;
 
 	mdp = dpu_kms->hw_mdp;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		if (dpu_kms->hw_vbif[i] &&
-				dpu_kms->hw_vbif[i]->idx == params->vbif_idx)
-			vbif = dpu_kms->hw_vbif[i];
+	if (params->vbif_idx < VBIF_MAX) {
+		vbif = dpu_kms->hw_vbif[params->vbif_idx];
 	}
 
 	if (!vbif || !mdp) {
-- 
2.33.0

