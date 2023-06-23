Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3769C73B948
	for <lists+freedreno@lfdr.de>; Fri, 23 Jun 2023 15:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B578810E64E;
	Fri, 23 Jun 2023 13:59:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F15210E639
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 13:58:54 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b45d7ec066so9325251fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 06:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687528732; x=1690120732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lIPapwS0VMu+wGq+Urug2AT2MCJbQHQnh/g0ltMMjs4=;
 b=Hak4tsYIfEepTwZkWlNigHuwL7fEFVH0RgwEi27fX3YConuf914hnwjqCm3DhGE7je
 mtzbDAlolGPQvAWTD+r06ecDBW7eHuDb18+1bCF3gy/1X/pFjlknvjQfjY6wd5w9n5qI
 j492aylTrQWBe0Yas37fxs3/lbmLLF6no160jBGhGyxEQtrlqoyW0NMOqpjChgM8ctad
 RslcK7KvpEbOfmwNcQU//dlxbux/6WxragZwUmz0i+s4Wybink/PoHsqB1nnJr9h+5mf
 DvqMcTubeyBXlfVfCcsKUysUH0UlBCpW5yzyA+MssBDQkdS5KnJy3oqfuWIkeXCV3LBI
 7ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687528732; x=1690120732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lIPapwS0VMu+wGq+Urug2AT2MCJbQHQnh/g0ltMMjs4=;
 b=avoF0zgdRUckHlrPCE7hGPeofbSnDrWImESlTzY1J9uNsaHRCCKdUkg2fQpJGe2geh
 m5BW7tgwc5Cj+B4xuz1y6vZlTdcioW6NAHij3ovR3zpu31ubJqW01VxOR36jYOQ1Xa4I
 rbUic/9dJ+ARV/KL12RMXXoy7gbJL55m+74wSGo4IiMf5hBf0/nb6udQ2lVyY477bs45
 cQw5EtbA/+LLxPUd+zLz4rqLnbszVQ+ShvZaQKHd1AsHSmgOGVcD5WsEfXpkwD558CNj
 sL46/IsfklhHHbv2UNV0p5PVj+KkN1OsO6bfO2ofYeHiPuhW+/JHTZaXVOvm8BvgcZ5V
 nBVA==
X-Gm-Message-State: AC+VfDwn0gluUn4LcoZDnnjWKmhHIy9rVTGxDQOe67BQv0fSvZ6Mpk5O
 ZO6L1/gR/osDK37hLym9hCedcA==
X-Google-Smtp-Source: ACHHUZ6HhxYzygSwvCnSTPeCfM2VScj9CICogwmsSA5qNEVnWyJGZ/ZEKnW4nAV0d6KT9mUUUZnzlg==
X-Received: by 2002:a2e:b532:0:b0:2b4:5c28:908a with SMTP id
 z18-20020a2eb532000000b002b45c28908amr7611933ljm.7.1687528732761; 
 Fri, 23 Jun 2023 06:58:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05651c008b00b002ac7b0fc473sm1756869ljq.38.2023.06.23.06.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 06:58:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 23 Jun 2023 16:58:44 +0300
Message-Id: <20230623135844.1113908-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
References: <20230623135844.1113908-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 7/7] drm/msm/dpu: merge dpu_csc_blk and
 dpu_dsc_blk into dpu_simple_blk
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

Merge struct dpu_csc_blk and struct dpu_dsc_blk into new struct
dpu_simple_blk, which contains just base and length.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 7cb9ef940225..4b3fb104c412 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -283,11 +283,6 @@ struct dpu_scaler_blk {
 	u32 version;
 };
 
-struct dpu_csc_blk {
-	u32 base;
-	u32 len;
-};
-
 /**
  * struct dpu_pp_blk : Pixel processing sub-blk information
  * @base: offset of this sub-block relative to the block offset
@@ -301,11 +296,11 @@ struct dpu_pp_blk {
 };
 
 /**
- * struct dpu_dsc_blk - DSC Encoder sub-blk information
+ * struct dpu_simple_blk - DSC Encoder sub-blk information
  * @base: offset of this sub-block relative to the block offset
  * @len: register block length of this sub-block
  */
-struct dpu_dsc_blk {
+struct dpu_simple_blk {
 	u32 base;
 	u32 len;
 };
@@ -403,7 +398,7 @@ struct dpu_sspp_sub_blks {
 	u32 max_per_pipe_bw;
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
-	struct dpu_pp_blk csc_blk;
+	struct dpu_simple_blk csc_blk;
 
 	const u32 *format_list;
 	u32 num_formats;
@@ -444,8 +439,8 @@ struct dpu_pingpong_sub_blks {
  * @ctl: DSC controller sub-block
  */
 struct dpu_dsc_sub_blks {
-	struct dpu_dsc_blk enc;
-	struct dpu_dsc_blk ctl;
+	struct dpu_simple_blk enc;
+	struct dpu_simple_blk ctl;
 };
 
 /**
-- 
2.39.2

