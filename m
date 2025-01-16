Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33236A133CE
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 08:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE8A10E8CE;
	Thu, 16 Jan 2025 07:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zVapURhr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D321510E8C4
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 07:27:30 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-21634338cfdso13224375ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2025 23:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012390; x=1737617190; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YoErTj5R/6bDpkTGboi+2J+mxLFw/UBtFH5HLA2mCCY=;
 b=zVapURhrbe+xwQao2lLIViu6R8xcEvAp/QOc/Pd5muH1AArmWylbQtLy7P+Up1Cntb
 QRCRGOxkSunEue5fJRFGFKrKZBLEqdT+UpilrDA0anHSX5m0+XwcSfjfI42rqkuEBgZN
 k0uLtyZyAB+q1NPwMUhgn4Mzj6nF+qv9DHuv+q+Q9mms+qqIo3jO72GVEw+dhcivrsbh
 mI5VBr/qdnus+A+EY5px92Gny2XIiLr3qbCYn5FsyDaXlyFrvyIVfqP+V154RkCIpgcj
 9659tejGAxwKHKVYDe/CgD0Yikxayk12VsiKeBxYgkibZXZ7CnHU3d2ggFKkS3L4BG6B
 eOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012390; x=1737617190;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YoErTj5R/6bDpkTGboi+2J+mxLFw/UBtFH5HLA2mCCY=;
 b=VpDW4hw8RDrs4ugNZmGahI5KffOEpOr2QJxQYEP4D0TiH2W+eh/WDkPQjYyCgWHaWb
 eBPYkw4Wu0uBJC6AVo78uz3nLLQfj5IJ+VArQJEcghDYYjhwIcybC5nA5Y5XmhlxAd6/
 6wXx9WtLrsqE7c7CeNjEQI8Nb8LMlfkKHwE4/MCHHPDeaSc/90ikLexCYodVAm8u1FNX
 pNg50UpmaU6Dhcojw8AqROjUG3wCTxgvQ9qZhFa2HDRLvwlu4b15xSjvl/i/2FkQcpJ0
 X9JyNFBoftTEJGVJ7igX7edw+EL99EupoTYki54q0N7/hRQf6fUHg60hLFgJfmUJsXtw
 EftQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUspkH5cBAxhUtrGCFYlFhkBjqOpCh4rB96XqsC8tDem4TkhX30k14WO+ckvRWsW2uvWRRR76+BzaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaXYS1KX04DBrh1CFnOGGRO4xNcq0MzmA7yXlauTjka2/mcIC2
 gKR9frfYkXouk8WozKPdC2tChgKqpgvIcDcEkH3UCY2NNMQa+eG/BrAZyX+u4LA=
X-Gm-Gg: ASbGncuCEO3OLTBqJDEBIJwbeT3swi+1TXycpOjWNlbBRW2KV6J3Si9OfFVQCnOQxqf
 6ujnHcDvv8pODnyK/uOunQr6X+9msPXQ1G9cnPMPyjXssd7sqxIzSxQTQ1GVUaHe4xLxvmr6Hmp
 rU4czycWKdOD17KoAZgJuu+qrSvo54bGWSPO+eF41DSgXfQJQeua+UyRIAk5W8EHlJ8seY+8iHM
 vMoNrN4WX6IFB3Re7bLAPttrQ34t2yB3QRS/q9ugVE8xTHigq012w==
X-Google-Smtp-Source: AGHT+IEEyBRAhj+yuGi93sK/+BkUn+itWY/3PcfWMBSR1VeRwy1zquY8/MSur6Q37Svz6ElMecHztA==
X-Received: by 2002:a05:6a21:8cc4:b0:1e2:5c9:65e0 with SMTP id
 adf61e73a8af0-1e88d2ec106mr53738358637.32.1737012390585; 
 Wed, 15 Jan 2025 23:26:30 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:26:30 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:53 +0800
Subject: [PATCH v4 04/16] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-4-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1960;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OIStHp3vqvhCacoNrcsrSybMaAkAUq1kz8KBDHS8J0s=;
 b=rwgQXNy+2oms/4wk72QbrJ2tiXoOO9ioI4wGoHth9IcABkkGbeVTKQ5oUk77DozsBcc/Y1JHZ
 hUFpVz+6JBpAZMlXPjS+fKBTgkhFs75VsPOWOmfKzrh0GJMkarXpjsZ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Add resource type info on allocation failure to ease debug. Because
more resources are required in new usage cases, such as quad-pipe case.
It is more likely that resource allocation may fail than existing usage
cases.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a67ad58acd99f..24e085437039e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -802,6 +802,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -862,13 +877,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to enc %d\n",
-				  blks_size, enc_id);
+			DPU_ERROR("More than %d %s assigned to enc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
-				  type, enc_id);
+			DPU_ERROR("%s unavailable to assign to enc %d\n",
+				  dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

