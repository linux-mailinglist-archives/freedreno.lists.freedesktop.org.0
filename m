Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B407BAC07
	for <lists+freedreno@lfdr.de>; Thu,  5 Oct 2023 23:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16F710E4B0;
	Thu,  5 Oct 2023 21:27:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D3A10E4A5
 for <freedreno@lists.freedesktop.org>; Thu,  5 Oct 2023 21:27:10 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c012232792so17820151fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Oct 2023 14:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696541229; x=1697146029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hPtVzzZO9pBznL56T6VYtPDn+5rPWC88sELbHece2w=;
 b=wNHAAUiJd/yel9N12KGmUftqttSeG4QK2cw5iJb1yK5bCHv/0K7Eg/H8ArmSj1UQu9
 W41JIGape6ko5S19nJk1Gry1Tf+n1N/eePaKWq+lRC8j+78ong6AEtTqYUinCjk8HrcS
 IPHU8dxHqw3vxJs8E5f/kcWhxirY5slysW9bRk9q2dEUW3PJzQTj+xqfpVHERyQY2Qv4
 f2IQqBN3sd82r8uhZFUL4hRGMHNFS7pTFQIqGKSuBDqynslc6yCrT51FKqCTv+2+JmwE
 ztq844bd+YWVJjL2gBXjgej1qsYOLJdTd+TIdORbalsiWT2W2tq6wSH9hnnywVV0XR3o
 hgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696541229; x=1697146029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hPtVzzZO9pBznL56T6VYtPDn+5rPWC88sELbHece2w=;
 b=mhdOge6cJcy48deJk2tqtSHrt89DpTLMfflL3Bouy0nMRp5t8fhxHkzlaYXpM7/vfE
 Xh66GEkOjKzhkgzZjcRNYJPbkgDMYuisV0cs9g6xxeO181udN1XgX8zTZvUbI+u15Goq
 YFjFf6uWggtquoNNIvlEadUW7RtLTd11AGLwGys3GS5kbMO2HZDe2Wa/LbnEUfXDPh+P
 JuT2PiX4g3z+2G9LtAzF4UyDrmjPn/Nji2Lp5wgLhDkKCRCIzxtJvfo0+AdaFpTIq/De
 Rx0fnR7vIZa4zDpLEomM8bFMBzFvBFGR6RZVdz3y0LiWDTSGLk2kwAC6TmZyGc96k+ou
 7P5A==
X-Gm-Message-State: AOJu0Yx4D0XwQk8x7nJi5SwWOwt2GdF/Ow67FzE2PIGlF9QhNFWSkmKB
 g0vJecpDuYrMe4F/NdX/qldcpw==
X-Google-Smtp-Source: AGHT+IHyWaHI/ccMpMsiZJmgLT39m4mhrH8iEHE1/oJOIFRMc9jb/U/tw82wSvsr5Nrd2WpxJ9ZDFQ==
X-Received: by 2002:a19:910d:0:b0:501:ba04:f34b with SMTP id
 t13-20020a19910d000000b00501ba04f34bmr5308420lfd.44.1696541229128; 
 Thu, 05 Oct 2023 14:27:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a19f806000000b00500b3157ec6sm8435lff.143.2023.10.05.14.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 14:27:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  6 Oct 2023 00:27:00 +0300
Message-Id: <20231005212703.2400237-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
References: <20231005212703.2400237-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 07/10] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO
 macro
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 40 ++++++++++---------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 19ab36ae6765..fc5027b0123a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -252,49 +252,51 @@ enum {
 	u32 len; \
 	unsigned long features
 
-/**
- * MACRO DPU_HW_SUBBLK_INFO - information of HW sub-block inside DPU
- * @name:              string name for debug purposes
- * @base:              offset of this sub-block relative to the block
- *                     offset
- * @len                register block length of this sub-block
- */
-#define DPU_HW_SUBBLK_INFO \
-	char name[DPU_HW_BLK_NAME_LEN]; \
-	u32 base; \
-	u32 len
-
 /**
  * struct dpu_scaler_blk: Scaler information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: qseed block revision, on QSEED3+ platforms this is the value of
  *           scaler_blk.base + QSEED3_HW_VERSION registers.
  */
 struct dpu_scaler_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 struct dpu_csc_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 };
 
 /**
  * struct dpu_pp_blk : Pixel processing sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  * @version: HW Algorithm version
  */
 struct dpu_pp_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 	u32 version;
 };
 
 /**
  * struct dpu_dsc_blk - DSC Encoder sub-blk information
- * @info:   HW register and features supported by this sub-blk
+ * @name: string name for debug purposes
+ * @base: offset of this sub-block relative to the block offset
+ * @len: register block length of this sub-block
  */
 struct dpu_dsc_blk {
-	DPU_HW_SUBBLK_INFO;
+	char name[DPU_HW_BLK_NAME_LEN];
+	u32 base;
+	u32 len;
 };
 
 /**
-- 
2.39.2

