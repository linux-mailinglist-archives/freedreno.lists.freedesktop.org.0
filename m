Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913F173B944
	for <lists+freedreno@lfdr.de>; Fri, 23 Jun 2023 15:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AF610E646;
	Fri, 23 Jun 2023 13:58:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED2310E642
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 13:58:53 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b4619ef079so11482011fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 06:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687528731; x=1690120731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhJIZTLErgvAhaIGFl7Dh3Wm2X94gZ/UjmbS2NE5UxU=;
 b=q+ZyBpmyhuyc25nWzqH1Dk5rVnnWe0eQx/nyNbjEOc/S+dfy5vaYogknY2DlyilbJb
 u5ipwptC2Dg9+BuU50sXgvpBLcJh+aFLwpq0pymj5ZxcRSATFrDUfKXWjiPblzescA4Z
 7z7r+z3vmIwuAHI0OCEgxxALIJAWCzkMSYoYi3vv4Q/NywTzVrHG77QiquwNXV4NAaqS
 3nldkwkp5SVipij8ulOVBjbNMT1DBznIa76PHBfJ0WZ1FSDe9qX6dNldcz1AaZ1szKYf
 +5f9iJHOSCsfu2QzC0K8GgRRBJDJXfSlTjHlmOFI2fqkWj6vL4UHhitknZ2xWN4CjzYL
 qhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687528731; x=1690120731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uhJIZTLErgvAhaIGFl7Dh3Wm2X94gZ/UjmbS2NE5UxU=;
 b=XR2LCNydzq8sWx5N7YN8/ikVCiYw3l6DuQGHJRNzITpS9LAn8dOJRvDC41alAyyPCH
 pvs1ODnoM5w1SZK7prsNeR4hXajD/TW3vabOjk3RMnIpr+uUT9XbfDJpIEHgU/7UbTsh
 xTa1ZCXNmXJw8Ejj3JQpWRhwtdwqXQCN4aO/MFtZqEiGkRvsQ4lh9Py7UiGIt1F9Rvcy
 NeBRm783i3b6Aahcs55xcNTFlXFHITArve9uLKgeyYgpwoyrZqLonKpT0RQWuU8CmwvQ
 a0ggPHgFT0xdt08TbtTRLoVjyhymObFo4LbXrZn997rGhZyDxkKTTHqvSjEbQ7de+26w
 Ay3Q==
X-Gm-Message-State: AC+VfDxlcUY4DXiB94TP0GQZ/+ch2HoA1mHNycthdtTeUIScZ3elvD4Q
 yTdpDACjmrI8eSA5C0DYFz0pog==
X-Google-Smtp-Source: ACHHUZ58IYWu7lfIl+m1ZAVDlZZMIh+cPGMjvUYIBqVFBhg0bbrQg5EqvV0R5VePLacmsorTaVXWgQ==
X-Received: by 2002:a2e:3005:0:b0:2b4:79c3:ce03 with SMTP id
 w5-20020a2e3005000000b002b479c3ce03mr10022984ljw.53.1687528731599; 
 Fri, 23 Jun 2023 06:58:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 06:58:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 23 Jun 2023 16:58:43 +0300
Message-Id: <20230623135844.1113908-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
References: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 6/7] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As the subblock info is now mostly gone, inline and drop the macro
DPU_HW_SUBBLK_INFO.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 31 +++++++++----------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 8dae416d2dc6..7cb9ef940225 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -271,46 +271,43 @@ enum {
 	u32 len; \
 	unsigned long features
 
-/**
- * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
- * @base:              offset of this sub-block relative to the block
- *                     offset
- * @len                register block length of this sub-block
- */
-#define DPU_HW_SUBBLK_INFO \
-	u32 base; \
-	u32 len
-
 /**
  * struct dpu_scaler_blk: Scaler information
- * @info:   HW register and features supported by this sub-blk
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: qseed block revision
  */
 struct dpu_scaler_blk {
-	DPU_HW_SUBBLK_INFO;
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 struct dpu_csc_blk {
-	DPU_HW_SUBBLK_INFO;
+	u32 base;
+	u32 len;
 };
 
 /**
  * struct dpu_pp_blk : Pixel processing sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: HW Algorithm version
  */
 struct dpu_pp_blk {
-	DPU_HW_SUBBLK_INFO;
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 /**
  * struct dpu_dsc_blk - DSC Encoder sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  */
 struct dpu_dsc_blk {
-	DPU_HW_SUBBLK_INFO;
+	u32 base;
+	u32 len;
 };
 
 /**
-- 
2.39.2

