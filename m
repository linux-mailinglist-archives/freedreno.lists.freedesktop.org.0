Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0F7B18477
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 17:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A88610E8A4;
	Fri,  1 Aug 2025 15:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ip2oZSJn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE6010E16E
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 15:08:00 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2406fe901c4so13232675ad.1
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 08:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754060880; x=1754665680; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
 b=ip2oZSJnMipqtoy1LE99G1tyUpsUi9IAlHIdQDOiNwFOzIxutsOEnCgCRiCoMnxYH5
 Q+o7Zc9rNy7cbw5vXU+dgmv+E+/MRJWbhDN5v8U6gVFObXXOt2riL8owtRs+bhBQGe6/
 67NxP0LE63zb7nKuJjBa6vdD7VTHVFOzW/ic4d5B6dQYwrsPauAziNtBTV/J19Bz/P5b
 WkxFPk/WGJmlsbkEtTapG/EU+Mphh+4AW97ujK6phDcbZ1bjzAAd9qNjzLP9/Vk5jIR9
 K5Nxk13Ao1Dp0bCvW0HkRRvP39VIrEfogoMh0meTiXMAYU2YdMpRwxDklWm9lkSBNbgM
 vn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060880; x=1754665680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
 b=VVadb3QAAQWM7JSjgC3Do9/OCAgSByp0TS9mRzVcMUbWRQanUB6sInwXMIV9pceGFE
 FOhxiFjtBt4adPlk8TJ03/MK5thDZrSVB6FLh6hGC36HyUDGlBRW1PsYX+VhQw0qVHUt
 XA9MKc2czzy9RI4W8ebIhNMjGYnMtLqhxJ6iKPclaRfdSwkQDUaDoCbqSHA9DgoitsVm
 iA4xXXUUjyVcOeIrLuYTnnpjA7A9amHb29qkp86yT29hNQbbRlWd8dq0JLD0+b++Axdz
 NDmgYuxQyJG9eVoVsjBpzyCSxagWe43HtACHs11AsVkG7h5c0MhPSti7CbU343tE7wW+
 E9Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCNkzndQyXyX2eyqSjmbTCycUhah5SyJdmP80IXPge0y3AozuVtAjEY5FhK+4mc69HPvgBvZT+/zk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhAmqp55l9ejFo010ritNI6giCe+6cv3NRWs/cn0+rvNJ7YB36
 17eFZ1yLBnfcvSm1xhwej0WNNve7omG5/52u37xmZqqGLngznZwWou3vFGiIDH6lOYk=
X-Gm-Gg: ASbGncs65cGRZzX9J+YvwtAX29q8Xu8UTn6Ea+0Ea+ll7YSJcg6F+3yHt78p4dPhWGa
 jY7XImDytlmUsAngkvXuVa9HkBSfnjnWbyhO3yMN6IqXyeCVk9JZeAOBnSqFtlwoWRvmij4Xp6M
 l/cgjBw8rAH+LPOMAOe2kIxBtFjVl/ddtQ9LpuL9zl+wI33RodECSHdyMbCyyrVtz0ryZkg26bH
 4SrgeAjhMLPS4JQceQ120bQs2+P05s0cO5oQCoUHBTo+DVpMKZbynRBE4Ucv789UZlh+r4I2z+r
 Vw8MxdZOiBmz65g2Rg0gi1nNUaatar2ynq6/p/xeTXuepU/JrpziB2VHo7+suALLMGqaG6dce3K
 /+64t/b26O1HbBGJmCQ==
X-Google-Smtp-Source: AGHT+IH3qH1C2C/DUvH+RVcCZ2KshGNz0QCudBxgmDLP9cSlPWRBKjVKTxVWslYj7VJGc7sAdPEqKQ==
X-Received: by 2002:a17:903:2351:b0:234:f580:a11 with SMTP id
 d9443c01a7336-2422a44b2efmr47017025ad.19.1754060880024; 
 Fri, 01 Aug 2025 08:08:00 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:07:59 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:26 +0800
Subject: [PATCH v14 02/13] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-2-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
 b=uf55jKKnEF2lP7JtE+vnAiUK5b0V6GRdSs6zOt8Wg4FWSYO07vZYpVojDvT59dzvoc6lrnj5W
 14tQZKfsvBtD+dC47ohiCQYc9/Y7qa6qnvsoojWR2ih1yZn1HVbdN8/
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 25382120cb1a4f2b68b0c6573371f75fb8d489ea..2c77c74fac0fda649da8ce19b7b3c6cb32b9535c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -865,6 +865,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
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
@@ -946,13 +961,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		}
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to crtc %d\n",
-				  blks_size, crtc_id);
+			DPU_ERROR("More than %d %s assigned to crtc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
-				  type, crtc_id);
+			DPU_ERROR("%s unavailable to assign to crtc %d\n",
+				  dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

