Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD69E9EC73A
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 09:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B8B10EABB;
	Wed, 11 Dec 2024 08:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I3DCDu40";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876A810EAB2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 08:30:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso68521565e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 00:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733905803; x=1734510603; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lNypXtc4nIg+qb7sUPhcVsJhL4eqdZ8B/Tfk40MaJXk=;
 b=I3DCDu40rD27OwedFoMmCuY5Iea3qGvAbrMxVRThtWrs/jx3Hq3fqdBLO5C/zvIjs1
 C+SI/uzTNYi+RW2qVVCjUQgKWiNdBLioVuGBktH4natpBkB3m/rR7xB+zTKvbC+32cYY
 TjVEeFPW6+aw6IC8hRMvy5wUHvuDfDYbuKje/tDUhnDUUPxtYI2pAa73yrAVYoJqt1X3
 nQPs9Fw0O87Ay8DrNWO8nxWdF6wCxUYqJLYxRKIni6Na+tQ4iHMMTp+VsvcxUg1MrWXM
 7S4ilcvtRhyepS5bSAjo8y5JLw9smjlN1vP0WdYTMrzdDA4+SCZyDpTp4T3oQUw9Imvt
 cpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733905803; x=1734510603;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lNypXtc4nIg+qb7sUPhcVsJhL4eqdZ8B/Tfk40MaJXk=;
 b=oZPgnUBVLEKvLmtLiFdGhn9Qiw8LFd0BZk3BayJCftg2uoMVJvgf4okOcEZ06d2jjj
 X+PyDti5HzKGex8R6M2m6tbVM8/M4GBJohCExt3HoCupoYAu8Y+2e+gmBrMfxqfvP7JS
 rZYNexwL25Cl/cXMhGpQVSTot7Ugm/HzvWrm6LYNN54gNZ+A5MCvL43I1O1X+NMNN7bO
 fl+ke1m1wGGSQQeyVcy63PLrsiTHVRP8MTsPYVn6TRuPSpPDm5F9CNvt+SHdRgH8X+l+
 vqCNMPxhMEqYb6EG/rdVPiuATozQkEeURNGysE+WjMJ8K8U3ahMBrXxOg7q8x1rdV+gC
 tFcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt3X8aqrfAL8ig9rxoKQBPYW77lNpSyiK/FFPHmJiBO1xjCLVMcidkTJHW7UsIxj8iJKIWJJArMD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz27PPmyyXrPw/r2xrpK1umb5++vqdBvAu5stPN8Pst6ntrvS0K
 hqvhkkZ284uRC0W+wuN7QXTcBtBGn0sxXFu4Qy5QnPw37Xa0xHcGta56YPSVq04=
X-Gm-Gg: ASbGncur5zlDcRuBwohO+UKrgYxEl6OcDf+7t3tSmcY905tf3TYXlJnEn6doyYv/dKJ
 gUk7VHH6NjMihWv+S/ycQbWM/cQwhti0t7NSj+FiG7wf9fkJ3FD1Q4RD3Gl2JUq+WKzMxGV1weX
 yR+nwOwZzm3GwoZTacRsQ3aNg/wfdxJ93LqdyHEulhoM+LOrMTG93YjX5hpX5wtTnjYB7HN8/rB
 1AEUYrnxbT7kNaQtH6u9eVUoMR4mqwVzNdimWR0ImyWmYJ5dXtM+1GcYccbDvvHPEpbS9kJDt4=
X-Google-Smtp-Source: AGHT+IH6+vEX2WfNXNJ2nAc7kKUYdmLrBTuQoYVlYpfObom8aKcXHzrfp+P4XyYInweEJtk1gSrx/w==
X-Received: by 2002:a05:600c:c11:b0:434:f7ea:fb44 with SMTP id
 5b1f17b1804b1-4361c3acb65mr13968775e9.14.1733905802821; 
 Wed, 11 Dec 2024 00:30:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:30:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:29:53 +0100
Subject: [PATCH v5 3/7] drm/msm: adreno: dynamically generate GMU bw table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-3-6112f9f785ec@linaro.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3622;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=yovwygK3S8pu26HzluofMUYGeWNAA5KC7l+8jvZOelI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2D/mNj+S561qPZ/Vd9Rzw1cSUKaTGzvfXwgVkA
 QS3aNyqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNgwAKCRB33NvayMhJ0agxEA
 C+A9ezN6FpehfMIejE/kwgdHMeDDhFA6t0KwsN/26Mi/YL0grjbDM5ahRuQ89HQ2nu9RXW/A3s7hkC
 ABtUbGsL5+ltQ7s+OSVAO8AOcSDEig5sNc6TuUTybS39C31rnVVdJtOCpVak5rw2dFWvBSAGX46fJG
 HMu4/UprRHYitqxhGOIhnA6O8OOWb/dff3ZbJ879AhsRnt/SSZK99ZrUjALeSBP50RcLgT0ulmm5tm
 586MuPgiAWTlol9VL1vovc+4dIz9NMnHywnqSBEme1ZUEUD1fw1JDUPaVlL5CBZ3n4KEIwDpnbPCEd
 /rNlt30YQ9ZLFxCEwEWIf/1rgMUhAB/V86RIFJX3UaH8jFkGTaXvFSt7vyFLw4gZ0QmRtWcCPghY1K
 6UtX59fg1BEBY0CyUMZ0VffC1kriWkCvYp3E9FWkRbMaf7Ij1s/d1/OJ+koJXOHr2ugy36ApYpYY+H
 B84m2/sFreBaRYe0ZzyiHWyO8NqaLVK2XafTNzQzcgKkArR65IYyjcVr+xKOQb/lr/c4qvgLN/qvX5
 wnuLhoapLyKY5Q/hRg9+PHmtcDt8ltdyZBu85AEKsX0QfZIqIClvD5z4c6G/uGhyBSKTPLnuocUeD+
 8g+dTvwRLe6WvTOGmfHKS5hyPOH9Nz9p98KbfvfcFnRBUxOqdhZWuQ71xPUQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Adreno GPU Management Unit (GMU) can also scale the ddr
bandwidth along the frequency and power domain level, but for
now we statically fill the bw_table with values from the
downstream driver.

Only the first entry is used, which is a disable vote, so we
currently rely on scaling via the linux interconnect paths.

Let's dynamically generate the bw_table with the vote values
previously calculated from the OPPs.

Those entries will then be used by the GMU when passing the
appropriate bandwidth level while voting for a gpu frequency.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 48 ++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index cb8844ed46b29c4569d05eb7a24f7b27e173190f..995526620d678cd05020315f771213e4a6943bec 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -6,6 +6,7 @@
 #include <linux/list.h>
 
 #include <soc/qcom/cmd-db.h>
+#include <soc/qcom/tcs.h>
 
 #include "a6xx_gmu.h"
 #include "a6xx_gmu.xml.h"
@@ -259,6 +260,48 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
+static void a6xx_generate_bw_table(const struct a6xx_info *info, struct a6xx_gmu *gmu,
+				   struct a6xx_hfi_msg_bw_table *msg)
+{
+	unsigned int i, j;
+
+	for (i = 0; i < GMU_MAX_BCMS; i++) {
+		if (!info->bcms[i].name)
+			break;
+		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcms[i].name);
+	}
+	msg->ddr_cmds_num = i;
+
+	for (i = 0; i < gmu->nr_gpu_bws; ++i)
+		for (j = 0; j < msg->ddr_cmds_num; j++)
+			msg->ddr_cmds_data[i][j] = gmu->gpu_ib_votes[i][j];
+	msg->bw_level_num = gmu->nr_gpu_bws;
+
+	/* Compute the wait bitmask with each BCM having the commit bit */
+	msg->ddr_wait_bitmask = 0;
+	for (j = 0; j < msg->ddr_cmds_num; j++)
+		if (msg->ddr_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
+			msg->ddr_wait_bitmask |= BIT(j);
+
+	/*
+	 * These are the CX (CNOC) votes - these are used by the GMU
+	 * The 'CN0' BCM is used on all targets, and votes are basically
+	 * 'off' and 'on' states with first bit to enable the path.
+	 */
+
+	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
+	msg->cnoc_cmds_num = 1;
+
+	msg->cnoc_cmds_data[0][0] = BCM_TCS_CMD(true, false, 0, 0);
+	msg->cnoc_cmds_data[1][0] = BCM_TCS_CMD(true, true, 0, BIT(0));
+
+	/* Compute the wait bitmask with each BCM having the commit bit */
+	msg->cnoc_wait_bitmask = 0;
+	for (j = 0; j < msg->cnoc_cmds_num; j++)
+		if (msg->cnoc_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
+			msg->cnoc_wait_bitmask |= BIT(j);
+}
+
 static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/* Send a single "off" entry since the 618 GMU doesn't do bus scaling */
@@ -664,6 +707,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 	struct a6xx_hfi_msg_bw_table *msg;
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 
 	if (gmu->bw_table)
 		goto send;
@@ -672,7 +716,9 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 	if (!msg)
 		return -ENOMEM;
 
-	if (adreno_is_a618(adreno_gpu))
+	if (info->bcms && gmu->nr_gpu_bws > 1)
+		a6xx_generate_bw_table(info, gmu, msg);
+	else if (adreno_is_a618(adreno_gpu))
 		a618_build_bw_table(msg);
 	else if (adreno_is_a619(adreno_gpu))
 		a619_build_bw_table(msg);

-- 
2.34.1

