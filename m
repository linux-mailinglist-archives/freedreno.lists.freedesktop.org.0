Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664C66D1177
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 23:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BA910F07B;
	Thu, 30 Mar 2023 21:54:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF36D10F081
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:23 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x17so26406954lfu.5
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mg71u/7TiS0yeZEc+ean62kiFm+Wj1LDeVN5x0ynJuQ=;
 b=RlE3Jk2kza5Hn6wvqs8H9mJXXZ+sdzAOFGgtcnJZg4LtCra7uRcpSy+7UvgmmCa9g5
 agx0CxEhawLxeIbUZHi2wMEtvFZuaOJKcdive7Up/dSmymfpJpx4h3gw6tkPZW+hItCV
 SH0fah8/KsavNF3uTWEwCXk6mt01FGz+etcOFaEZ40gcTTIK3nMSBMlnsIhlr0aZ2YKh
 AnbfVz3yYB3cR3jwBvGLs+J495z3jhH7W7avBbrpF1Zm7IpMtNanzFeKIUotsfz2iBFo
 TyS1EZ9dT8pXURKsEq2wZkJaz8KcaySwXDs1dx7NLVRStYhN6u+8HS+Ph/mcTwlkKsWA
 BlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mg71u/7TiS0yeZEc+ean62kiFm+Wj1LDeVN5x0ynJuQ=;
 b=aoR1MoMTVivHMivRFb++cm1O2te45DM4plLHQPyHGF/n6al7ryKY71na67d8PdB46P
 mBVBOLHIQweVkvxUC3vMqBHx4pDw0SfadkLK66KC5+epnYcPsYjcVKaTZji4fjnASGNn
 w/wrzeRZeUVw29tpbezD1C+1vsoOyhvp6TH584OxceGlUHnvOihU+3GkwvXR8YhT7hDj
 ovPhAb2OcIeEAIJbNc7S0031vxCPq14P41Wdu0eKl0H486ARoXEw5UQrwB0BODI12DO1
 lAA57+rsTSwFJIFK74DBS2kX1vNnRbGtFM9/dgJGYl3okVP4XSjWdALK7L2fQNXYwCuz
 NRmA==
X-Gm-Message-State: AAQBX9eSHz6Axs8HuaK/7H5/h+u5ox0A4X0SVOK83GJcAWJMb2/y/KRa
 HgRFzGRMe47JDLKryX6Nn0W9Ng==
X-Google-Smtp-Source: AKy350Yq+zO6EudWHj9Ls+EFPMtnQ5dFAOYX4oVyujhvLt4gbmYXlKaK7Iy4Wk0zRJVvHlG1qMqGKw==
X-Received: by 2002:ac2:51ad:0:b0:4eb:c18:efae with SMTP id
 f13-20020ac251ad000000b004eb0c18efaemr5579067lfk.17.1680213263400; 
 Thu, 30 Mar 2023 14:54:23 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:54:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 31 Mar 2023 00:53:24 +0300
Message-Id: <20230330215324.1853304-39-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 38/38] drm/msm/dpu: rename MERGE_3D_foo_MASK
 to contain major DPU version
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

To ease review and reuse rename MERGE_3D feature masks to contain base
DPU version since which this mask is used.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 96c5b94264e8..d74029f163c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -88,7 +88,7 @@
 #define CTL_DPU_9_MASK (CTL_DPU_7_MASK | \
 			BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define MERGE_3D_SM8150_MASK (0)
+#define MERGE_3D_DPU_5_MASK (0)
 
 #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
 
@@ -529,7 +529,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x100, \
-	.features = MERGE_3D_SM8150_MASK, \
+	.features = MERGE_3D_DPU_5_MASK, \
 	.sblk = NULL \
 	}
 
-- 
2.39.2

