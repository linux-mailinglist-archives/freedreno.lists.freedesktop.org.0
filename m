Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE3FA385C0
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 15:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C87210E4E5;
	Mon, 17 Feb 2025 14:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q03VNUok";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D699D10E4E5
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 14:17:03 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22104c4de96so30995705ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801823; x=1740406623; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AgZb9vFHqGbbrUhX0AClGPorEmPUShOdtzPqIURbFyI=;
 b=q03VNUokGZtUHUwFYlxzUC0EhQNQczeCvnE5h7ypMH7xwSana5QmwEaDAdDTZi4m5i
 Aw5Cl7afQhcndgTref+cqmbF4ThL6TGJaxnEcqYQ/YhzDBxnUeuB6g39uZ/mSC6FhGOi
 4YPJX2lqWZCD8u3+Y+UaWhZlO55gjO98WJSl3F81+W0VSufwzq/rE56Uzisu4In8TX1k
 Yo6A1F2Cmq48CPOyVdBQg9gTz9AfTh1iEgsZMy4DbDrv8r5le/s8dGA5tAM9TG2/OVnF
 qptT5GfMVaMRiGFMvQHqtzY5SS0egda/7w3H/egYQ2zgvION/TJl3f/OBrtCX+E/gQbW
 yFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801823; x=1740406623;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AgZb9vFHqGbbrUhX0AClGPorEmPUShOdtzPqIURbFyI=;
 b=nkCmcBitGCw5KufRrZWklna4o9vUO5oBYmwmyOcOzvYW5BcFrUb0EGFBzTMVRVG7uP
 gqtSA6/jfybOPqUsT1re14KVkS21Gj09zPHckw9hPQAWySiVjEJdxvLiavXmLQCMfL4f
 zqdFXonNBBonvZbiY35pV/gkZoCPzDAj105RDzn9oDQ5OhCJ7snHioW3eWIoyFI7dcHm
 BwqHxYtBQYNeeAFRT7Bl28uvJ+LclcAvm6xeXkPS0YoGtrwQBOQ3aaS9iEjE5AS8ayFA
 hu3Ae5l6JImJnFuSCa98p/4Q6aG8bkZP0QnpSvBeiB6F5czcSJ38K8wfurdUdmFRDmXY
 RkGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXirPsdYWId5o20AE+gZYpT9Cqp4MvlB39GweQesqWIY7hm2qs5UpoOkJAAFYk7t9ZjQd6IuSYiM6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzisgvcUiVrBkb7bD772uLWMMxRKTyNfM0Su9GJn5ryuPb8RgH
 AJqpr2lt0djspfswNCEmH7rgIdOvdUneLuNJjNHDAOHSN0nP+ofGMYUA+OGSau0=
X-Gm-Gg: ASbGnctjHGi1ik8h2oXJe4Jf3/xl1HQEkSyVsoqv98Z2YMv/tfcGlJ/5yYrtLg50DmM
 nFVysn6sPkqHx/zewduaSEWfCEKDtSBHAc/nOSWfIRHXHcaZZplFumm3YDt4k4WkzUZaSxgI2yi
 NlXmstLg2UHaeZYgmG86WNajcmHOhXOznS+AwVsy1b7L8fNapSWqzSFngLRPURkp1PC91VGVkZk
 fcSgraQcik/64nkghs0EXmGxoFg51x0Z2mGSffg8FbPktXt6mwCG2hprqRNqLJDoFBWu4WXTYKq
 YTEmTPsTtP9T
X-Google-Smtp-Source: AGHT+IFeltiqYZ01XeVBukpD9aotaPbVJK+H+9lmaQXByPgl7WgVurkIerWDOUdc5+qfs9Bzr9iwVw==
X-Received: by 2002:a17:902:d502:b0:21f:3e2d:7d42 with SMTP id
 d9443c01a7336-221040620a5mr151503565ad.23.1739801823386; 
 Mon, 17 Feb 2025 06:17:03 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:17:03 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:53 +0800
Subject: [PATCH v6 04/15] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-4-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=2259;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=aJOtxV7p2hzo+78dTS+V6QD+6d00i3eKRY4QZgmhCkQ=;
 b=IDE1Zdpu5jFx+kMQo1OdjkeN0YD3cohBgglvXImn3/+XiN2uPyTRmcdz8y2Y28SIQ/cyuUHqr
 5tEYBuNeq+BDREy7yr5nkqDHi2QzYdzRe5eXBuxeMWhgOeSeLWJndDW
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

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index a67ad58acd99f5c14b9ec34806b83c7a58b71e16..24e085437039e677e0fb4bbd755a8cb3852300a4 100644
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

