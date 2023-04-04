Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0985E6D6252
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 15:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAE810E6AE;
	Tue,  4 Apr 2023 13:09:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C124410E68C
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 13:09:37 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id y7so1341969ljp.2
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 06:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mg71u/7TiS0yeZEc+ean62kiFm+Wj1LDeVN5x0ynJuQ=;
 b=waUZvSBCntuvftxrsrVSq+s6qkirXzhd1JgVDFdgzkskmeeSIc6CLCBdvSbR8fMYMI
 KNFu3YI++Gj6luwLTJiy4Yb2wD3pPX9dIvy+8ZbHRNSJIiwXnS7GdhFtpWaAdFv5rD6v
 /Hg8YxGSkbz9fUw06Anj+D1BkiRX53pV+B+fSCXj9QWdwrTJ0xeTOReR/ANEgSM+9Fmt
 lDg+svsYaxyL68/R4hTpEtwA8W080stUhbVNE0VrOwXycDQg0bWxy0Er0A/v4Aoazmn/
 5wKbB7PbK9gQXuiqo6mNQDJTZJ6qMdqyivCqXS1lKeHucb5Ga8lXoCAuVvu9nu/QmAAz
 FZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mg71u/7TiS0yeZEc+ean62kiFm+Wj1LDeVN5x0ynJuQ=;
 b=idf9rSpZpmbNIFcM+Ivg/IX4TnDz8Ef8Mo6PnyYHpJMzsrFntS6tkDm0Qd6wH07k25
 1tTgIsLzfJG9wZskG4vC54XPHN9kMWbzX8GijGMbkFmH8tS3q3oRHttZUZbxzIcU2TFl
 DVfoQCD83RZHbwrkwRkCzzmuZc3vIZ71cHP8ULDMq831kF4P7OCN2Bifwk7NJJXeeWuz
 3M/ZwEjGz2yoiWFnumkZqF91fr0wugBMZt/iCpHzMkUW3aTioUk1sakspNMyjhL3WOxu
 CGAeIX3loVxdq7IEg0eBCw22H1a98WeHcfupogCe8WeygOPDKRtuJOVGO8wwX9OixGQ/
 ew5A==
X-Gm-Message-State: AAQBX9e2CSvGt5oTKA6eK8BGycKXaY0LSihJIrWrxx90lDLoDU/qKnb3
 lmqGAjElpQofbsmR87E+1fo7cw==
X-Google-Smtp-Source: AKy350ZaG9FURFchBp7M4Jb+8kCkBHL1Worr6nxNj1hYj+hGT4pxzmqgiQ+onvd8GiQ+HA+VtBG0xg==
X-Received: by 2002:a2e:90d3:0:b0:298:aa76:34db with SMTP id
 o19-20020a2e90d3000000b00298aa7634dbmr787595ljg.13.1680613777284; 
 Tue, 04 Apr 2023 06:09:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:09:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  4 Apr 2023 16:06:20 +0300
Message-Id: <20230404130622.509628-41-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 40/42] drm/msm/dpu: rename MERGE_3D_foo_MASK
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

