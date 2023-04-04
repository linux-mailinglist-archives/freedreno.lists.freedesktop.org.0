Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F086D61EB
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 15:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD1B10E2F1;
	Tue,  4 Apr 2023 13:08:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924D910E2DB
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 13:08:39 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id s20so13447403ljp.7
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 06:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4QMmILR6+zBOxbV3dxRV8TQtCQNp43+duiF1VbsCx/M=;
 b=G4hEMLKsdJIyDl7TZT6T3aoRmN9Jcwk1beAPsjx7+aBsnGknGuB6WjfaSDWf9bC1HI
 sCqMwdhdQ/HPYVzhfZSLuH1a4MhqVK4H2LO486gYps5D5vZ5zdrw5RnQTmOgdUQyomlE
 aOMdbFbSTGgC7J84LSIcrFdVjERFygCURsYSuhi+Rbb5Hjv4vXlx5TDKe7okM9oLz7U4
 oCV2jcIiFJB4u2P4qiaMoO89EwRNvFuvjd4q1RCeRRZMsXt2RzqC2TxGFS7AWzjqWKE3
 Vylye85bK/o7zgQ/DSIUdS53t6ppNU5m23+Ogd5KnkoK9VCWgD4H/Kch34qDXz146ABb
 31ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4QMmILR6+zBOxbV3dxRV8TQtCQNp43+duiF1VbsCx/M=;
 b=zAMvjDiHNKz3iOjRaNvjsswabysA3br7bYoS1Zl0b+YlknYo9AYOy14AT9um9LyG1L
 WiBGtBdXZeRrnxeOSjYNsKHMnRuHhnNQhzhAudMhWz9GG2HLML3pp9k8SWYGZMBqz6I8
 587RZmwdqoDuPBsS+MZFCDEq6K/FjcGi9S3WAh3pT4DmIlEysl/wBJovixJyFNo/blqJ
 MHYqRocbO5857F8uPJOmVPsgULDQQFBVLaWzVI0RROhQI+Qj+/bczbKH5caSTudLSu6x
 Q0VnsCX9wNxjto6b9U3BaU8unwcIUS+NePZIPCD3/fDt/4RpZBq1kFRkn59M67geQcQj
 5hQw==
X-Gm-Message-State: AAQBX9f6zvIU0SgN8aRJAEO9P3aAmVc/HjTpLeLLprQp3lPF+9/sfVBD
 X+ByHFTdqYdEiJdzPbMIhGw8lI+7psG4q+aM4iY=
X-Google-Smtp-Source: AKy350ZWuU4Cr1Xcl5SU/ev0HBewzetwe4S/y8T939nGGYayQEsQ9UmBH7ULciZ2qBYnMlYVAZlfnA==
X-Received: by 2002:a2e:8753:0:b0:2a2:54e8:1037 with SMTP id
 q19-20020a2e8753000000b002a254e81037mr857429ljj.38.1680613719135; 
 Tue, 04 Apr 2023 06:08:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:08:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  4 Apr 2023 16:05:45 +0300
Message-Id: <20230404130622.509628-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 05/42] drm/msm/dpu: mark remaining pp data as
 const
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

Fix several leftover _pp strutures and mark them as const, making all hw
catalog fit into the rodata section.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2dbd4783a57b..69ea713405bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1659,12 +1659,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
 };
 
-static struct dpu_pingpong_cfg sc7180_pp[] = {
+static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
 };
 
-static struct dpu_pingpong_cfg sc8280xp_pp[] = {
+static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
@@ -1728,7 +1728,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
 };
 
-static struct dpu_pingpong_cfg qcm2290_pp[] = {
+static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-- 
2.39.2

