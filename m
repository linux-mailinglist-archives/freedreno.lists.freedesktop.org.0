Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D57D3B3212
	for <lists+freedreno@lfdr.de>; Thu, 24 Jun 2021 16:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B8B6EC3A;
	Thu, 24 Jun 2021 14:58:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A966EC23
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:52 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id u2so2882044ljo.1
 for <freedreno@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7LSD+0UwStyFklWVh+hnsHGUn+QhdxgAc/M+GEYmbyE=;
 b=QgPVQOTtH26cXlqMiPK4vS6KzVyPJcDWVVUHj7L3iv/KjvaBF5FwCpaFl/9VPlnEGQ
 sZZT3Lf952DxjZAy4AWzu3g5REwDFnBhH8G0r9w7rOYJM1HZP/EF1UfT7pMsGsOnBYbv
 f+waMK10AUUAncvmNnzalptUejc0COvBtu551LzFJUmro2pNjxATyopoClq6PgJIpHVc
 a124A2dGbhvyzkbgMGxmrV5+annKHc+epI4eBoQwzkjNwlukiOTnHS559YEmERg29V27
 fUH90KAOu04JnUWj40DCYlQ06nnewiHVA5BXumteyePNtpIOenJhCsmLnmspIXpYZfS3
 Ao1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7LSD+0UwStyFklWVh+hnsHGUn+QhdxgAc/M+GEYmbyE=;
 b=Pc+CE9vqD0N/2jq1Yh5d5oNrBjqltRPEg9gIO0fWrQvMnj543i+kzHWTS1zxRq28/3
 lFMd52QZjx6w7TL8NC8NwTDIESCqfRHdsLtN9Bk6sn7+SMEWEjetksNTG5V2kKa4BA4x
 NwB+n/4NxZFdctaFK1g7SpliWsvVnI1Syc20HojzM9pUMR0QrJNN1MOryH3u8rTbcY5t
 TO6ctlGsZCMT2D3Z6jITx5XZVXaK9VGQIPLHsTkzB54mMWkno2NCoAMtpvYx2vYuxMiM
 k21yOTpJQE5iBZ+C7cpyCaFzBJvUVph82fjTjoL3BzsZBpHBpeS50OQFMNNyKhUm+QI5
 0wQA==
X-Gm-Message-State: AOAM532AnZK2X2GknfE1fri7mCqXboPu0Kc5cFQ52cbBm2b8qzNlGNPG
 81b2+Aagg5O1137KAzhQhK8G7l+AucUnCg==
X-Google-Smtp-Source: ABdhPJwA3u1lfwhABHDdSmtduAEq/8vtdNBzloSloIzE0i7sm7viYZEwKQqjku5laUXEXohfYsAHBg==
X-Received: by 2002:a2e:9088:: with SMTP id l8mr4188125ljg.144.1624546671130; 
 Thu, 24 Jun 2021 07:57:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu, 24 Jun 2021 17:57:33 +0300
Message-Id: <20210624145733.2561992-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 17/17] drm/msm/dpu: switch into using virtual
 planes
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This is a compile time #if for now, to be converted into proper module
parameter (or dropped if there is no more need for that).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 66a1c8889cf3..08b47609a315 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -611,6 +611,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	for (i = 0; i < catalog->sspp_count; i++) {
 		enum drm_plane_type type;
 
+#if 0
 		if ((catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR))
 			&& cursor_planes_idx < max_crtc_count)
 			type = DRM_PLANE_TYPE_CURSOR;
@@ -625,6 +626,19 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 
 		plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
 				       (1UL << max_crtc_count) - 1);
+#else
+		if (primary_planes_idx < max_crtc_count)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else if (cursor_planes_idx < max_crtc_count)
+			type = DRM_PLANE_TYPE_CURSOR;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		DPU_DEBUG("Create virtual plane type %d \n", type);
+
+		plane = dpu_plane_init(dev, SSPP_NONE, type,
+				       (1UL << max_crtc_count) - 1);
+#endif
 		if (IS_ERR(plane)) {
 			DPU_ERROR("dpu_plane_init failed\n");
 			ret = PTR_ERR(plane);
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
