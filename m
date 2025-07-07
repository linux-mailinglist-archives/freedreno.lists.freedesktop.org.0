Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F8AAFAB91
	for <lists+freedreno@lfdr.de>; Mon,  7 Jul 2025 08:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB40E10E40F;
	Mon,  7 Jul 2025 06:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V6kTrkmm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BD610E40E
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jul 2025 06:18:15 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7490acf57b9so1882471b3a.2
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 23:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751869095; x=1752473895; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
 b=V6kTrkmm9KcPr8fFzItYd2epuFe3FlvC79liX7VKTO374xhBCtzVWi9G5Be1ULzXmp
 hFR4g34kdP8QBWfYFZRcc//F2K9T3ArhDhzbY7r5zzP5r5uhxQawQkkUYERokgsYbV1d
 F9JV72jNibeM14zHXQY7j3HIIG8ri7tLaF3qpnka0KxuJjvDni9s2v91nDyop1Ha04uN
 I20cBccOO4mnt80Xagg47hkht/QI2I6NkmOZT2oKe3Vp7gM0uhpIyFVD3/hF5ifWa+lE
 CzPPeOJ9j7KsLmjwA4tlJf7hh0iXe8A2dI1StSHojnY8cjfqa+oHSfeVS1nMNRKDJR4r
 BsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751869095; x=1752473895;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
 b=PkTj7eMIqnGI7S6trEweSHVchNxJFIKS4/85l2pD0rnwHwigNvFrQ1RHqVmE/ZqObt
 i5sarR6gtv4LN4jcG9Efbk/Ef6hwrwk/aeXp1h8f2o6MXq/lGHec9wBm1SHBry1AF/FC
 uxeWpRCw/deyNUZ+zInKo64XcGGbC+D2dt9yECRgJKcHmt4CIKx716IwEmZ+Zz6wwi4c
 cKVRiCf3h8gdfNm1qHYi1AHLElObiGkcFd96U0tT4wMrKif0QAzDtFZI+UXP8NbI1fgT
 ne0vySb6ZkmaBKx8ZOqiNadHGdhkF/Jf99tsXPZYOe6Su7ksoeww76O6665GUgBohMDo
 Qi5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIgQngNgGmTwU8R8LNUPRfBEZ5xNZJJo0k/4lxyY23GqFH0iNZNxsPLNidvXAP6wVCltGXWKNBT70=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbCjUeG10Q2yzETh8y72qxOUJ6Uky4zhm3VWzpVu0PaoSXpwxF
 eht1FkYoURTm6k4soow8rrrmP5/Mp9XbVU/sSV0fMXJRzHYYqzEVhrQ5dYbIF/QVTJE=
X-Gm-Gg: ASbGncv8tUskNyjFkGZQQZu2tRzgqgy73WRPcUB9VDAh0DyhtoT8zfdMAqBn1zDSYU5
 ob0RsiwQuR7eBjPrQFXJB8kPWmsZKAHjH6U5a0622CV7pIjmJ2JeJt55seEVhBreVV5h8D16qAO
 m25+jQ3soWgET1WS3B/rxyLoychrDBj9Z+A21wH2Qxh3JFSCufIIxocrfQEJEOO2kbt1dxvDXAA
 hTxb0StbnY9mwUj/1XW+dWqNArosTpwNb9AEJ6MgaCiBORa3wdHnZpiZCr8N06rp/ybAeJe9W96
 iwA3I5sjEdkwQButfAJd1S37y1NUBv6ZJifbQXZtbsvP5EVj385bauyUHVs=
X-Google-Smtp-Source: AGHT+IGlrhk9fPjEdOM1WLAnuyBtakJRbk69O5GldcFs1bDWoB3+lapHMv4SrrPDfzhU9/69EC3zWQ==
X-Received: by 2002:a05:6a20:6a0e:b0:21a:bfb6:1c74 with SMTP id
 adf61e73a8af0-225b9b7a787mr21297712637.34.1751869095124; 
 Sun, 06 Jul 2025 23:18:15 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:18:14 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:17:56 +0800
Subject: [PATCH v12 01/12] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-1-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
 b=5cz8/WtA4/jf2GK9NtibfYXdUpTtxBzCsxYxrYNwcSmqiOcZMWA9BuwuaemTojkEvgev9IPh5
 BBn+/NHCX2QC4+i7SQWW9oaMKioD254NH2W2pyVo/puVHtNGz324ncE
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

