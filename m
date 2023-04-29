Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 248BA6F2273
	for <lists+freedreno@lfdr.de>; Sat, 29 Apr 2023 04:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D803510E1AE;
	Sat, 29 Apr 2023 02:42:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7574210E10C
 for <freedreno@lists.freedesktop.org>; Sat, 29 Apr 2023 02:42:45 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f19ab99540so3463435e9.2
 for <freedreno@lists.freedesktop.org>; Fri, 28 Apr 2023 19:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682736163; x=1685328163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5z0j9caTAK+t1Y50Hn33TpAq9vT8mZ8FHh0G4wESvXw=;
 b=rNNhV/bQkbMsukKkYsJX1r5ywXKd+uJCgUnnhPitTcYUBiXG9DwUaO8gW+VzgOBRtO
 rfro0ivS50rB1x6/4rIVC01AyuR1HHPusnZhKsVEnzRmsli+1ARdXGTBZ9vk+QGPE4LJ
 xHMR+LxL4/9UH/6Ag/mJCAujoGrWXnfNJfLZ9Q0YivLb97xeIHvdYTfcTVnWbjSvsprW
 bDi08XqzX2ZT5MeKWOzaF+kmLFOjPC+dBuceLUpcRiggZlZnTwNQ4sWiFU2mVtKGGfzP
 FzmjYktixZEWvD9Ur9zX/j1oDHk17BfvI8EJR5jRw0J6YjCEIFAZQUgP+6WQfge0dI33
 2aAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682736163; x=1685328163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5z0j9caTAK+t1Y50Hn33TpAq9vT8mZ8FHh0G4wESvXw=;
 b=FLsNAbaRzUN9iSjVgx3I906msGR8tGRNAW91cagzH1MRG0wcKdX+GfeXRTvq4bp6pd
 jPrEH5JmpkSHpt4l/vFTrc8If7RtyHNjitobE9lRiAUmbbm7VCMsy4bnetKD44tDAup5
 sgLvd0vjSXHP2ud9VOITtTrBW+/+757ImaA6OGEmYIrV7qerEQLUsrvWpzvqVSBkNuNK
 poAOpNyebm6ju6Kuj3TTmMkLlnq+xMB5lHEZ7ojvC5vtHLlk/zD/fUBTPUp9NmwhLzO6
 kalf5Z6MFIBlMhShc3VWA7CVO7Z/I2mT8aOE0quxqEU133jK+QT9xgbgd4P83sGqYLk+
 zD2g==
X-Gm-Message-State: AC+VfDztl4o4wMqTWqG05tz6chz09rsSxhWiDSYCIWYC4oAuuqLnIvD2
 vlkCrCNmsDJ0llek8RSIUK+PIQ==
X-Google-Smtp-Source: ACHHUZ7mXx8ocQsamoMmD+wEHGo+Nr/9Lx40yplpDfClfBEbl9Lpw7Ug3RYLL8b5JfvqAMunOGv/+g==
X-Received: by 2002:a05:600c:281:b0:3f0:9fef:1028 with SMTP id
 1-20020a05600c028100b003f09fef1028mr5017684wmk.17.1682736163649; 
 Fri, 28 Apr 2023 19:42:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([81.145.206.52])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c1d0900b003f17eded97bsm29827071wms.19.2023.04.28.19.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 19:42:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 29 Apr 2023 05:42:42 +0300
Message-Id: <20230429024242.2613957-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: drop unused SSPP sub-block
 information
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

The driver  doesn't support hsic/memcolor, pcc and igc SSPP subblocks.
Drop corresponding definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3e92c2c66716..db6488a6929d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -384,10 +384,6 @@ struct dpu_caps {
  * @qseed_ver: qseed version
  * @scaler_blk:
  * @csc_blk:
- * @hsic:
- * @memcolor:
- * @pcc_blk:
- * @igc_blk:
  * @format_list: Pointer to list of supported formats
  * @num_formats: Number of supported formats
  * @virt_format_list: Pointer to list of supported formats for virtual planes
@@ -404,10 +400,6 @@ struct dpu_sspp_sub_blks {
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
 	struct dpu_pp_blk csc_blk;
-	struct dpu_pp_blk hsic_blk;
-	struct dpu_pp_blk memcolor_blk;
-	struct dpu_pp_blk pcc_blk;
-	struct dpu_pp_blk igc_blk;
 
 	const u32 *format_list;
 	u32 num_formats;
-- 
2.39.2

