Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7055276587B
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 18:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA9B10E5C4;
	Thu, 27 Jul 2023 16:21:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D3C10E5C3
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 16:21:10 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-522382c4840so1519502a12.2
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 09:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690474868; x=1691079668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hss43lOMtTWZaP6PSxJpTqk3ynxiZmBIfWetPiB5OU4=;
 b=y/qEf/U9N0vmnlPM4Sya0OVBl059hMk+Q/cFoYuhWfv7iNuWhWX9al27Jh7m1iEGcp
 XzPkjf3d77I2S35ixUHETdxtTZaV27QHBAjhtUFg8hvF2XDtmFqMjHPbzdqD1y0Jcn/b
 P9mI7k6RADgTimuohuHwIPtN04cSmf8yYWYtr+4AtCmU0Mvn+FdwXX5U/XrQqyTGalUS
 //FZtyv0mXrKK4mccZn50MK1ui1Xb1/3kp7WtmsDXJGpT2JTCmrE7c1Znw+f1eeAW53w
 UCsqldfFCzco3puoaBzcyAdfA/OdIRocAClRWdDHbHgoKkvquv0TlwyiNAj0e3UAUnim
 179w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690474868; x=1691079668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hss43lOMtTWZaP6PSxJpTqk3ynxiZmBIfWetPiB5OU4=;
 b=EBuKYL9dAOyxXIx4HZqBJPdnj4qZxuUxk0cHYDQ3D3Nj0kPTsrPYuoVJpPzwqiVzYu
 amczvW99gTPSs8pppstiaLOaz4bzyViZl1fz798e4459F1YiV42W0Uio4ButuSrBjFLr
 kB4AcKyvXEGlbeGFZgayN0gdadzNtCmy6L1W08cNcp4JoHhsmMs/63JEuYD/+tL0W/Xh
 FLn25eWvcMiJVIiC2IapUGJe/ioDHT8glynDFGDy+riZ5qtxeXNfqtBbKKAGM4Q+v45C
 qhHI0kFaStGJ3coR4Cjpjic4LkjsH28PIZGvQOoZ46sck1zqcrro/g3dsbSVEIwY9Z+W
 v0oQ==
X-Gm-Message-State: ABy/qLbwkPSJYMuPupjWXcM6Bt+cTPBxIgzUL9ua/I0vhaIcmyeUo5DQ
 eL7Y4zeChiqnS5kJwl67R/8DdQ==
X-Google-Smtp-Source: APBJJlH/fIxEZ729kMD+e6bMyn267HlAYoWAPHkICnfabMa1VE0mlPeQcN1xXdi7j7obwrk87PK3Uw==
X-Received: by 2002:aa7:c68f:0:b0:522:3ef1:b10 with SMTP id
 n15-20020aa7c68f000000b005223ef10b10mr2113757edq.6.1690474868671; 
 Thu, 27 Jul 2023 09:21:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:21:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Jul 2023 19:20:59 +0300
Message-Id: <20230727162104.1497483-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/7] drm/msm/dpu: drop the DPU_PINGPONG_TE flag
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

The DPU_PINGPONG_TE flag became unused, we can drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3ff07d7cbf4b..c19dc70d4456 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -79,7 +79,7 @@
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 945b88c5ab58..a6f8eee58b92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -136,7 +136,6 @@ enum {
 
 /**
  * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE         Tear check block
  * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
@@ -145,8 +144,7 @@ enum {
  * @DPU_PINGPONG_MAX
  */
 enum {
-	DPU_PINGPONG_TE = 0x1,
-	DPU_PINGPONG_TE2,
+	DPU_PINGPONG_TE2 = 0x1,
 	DPU_PINGPONG_SPLIT,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
-- 
2.39.2

