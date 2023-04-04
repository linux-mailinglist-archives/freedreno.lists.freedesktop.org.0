Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2772E6D61D6
	for <lists+freedreno@lfdr.de>; Tue,  4 Apr 2023 15:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1104210E2CE;
	Tue,  4 Apr 2023 13:08:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EBA10E2D2
 for <freedreno@lists.freedesktop.org>; Tue,  4 Apr 2023 13:08:35 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id a11so33761951lji.6
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680613714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qlq2CcjX+64dAVi3fffS9Y0yWKzAzk7GtHyqF7vlWXk=;
 b=fKCCwitSRRxnTyCs7cpdRwFRQ2T/QGHzCYi3wn1vhRZOeyO8YFyGQeKo4dTjqKPXfO
 ss1eN0XFNOl1m7oQvqkW2Wvo9EbB+FTRqzay6uS/QosVMK+xBVaivQUCF8zY7C/i2Ue3
 S7UwX4SGCoSZvaySYeOLIqm6sxr2F1EXbn3CoOzp+MwFyAHObDutkp0H9HOexXWki424
 r+RzHL0kz2E21FLOGZThmg9bo9ji24JB9k4J2G4NpFaOBxrPb7pybUYfBhi5wI6rCc9Q
 5ZFLrUbQClakBBMPR+YXKwSepnGV3kXriI3jEZyMtxIS9STArpkWCRf6dz5cz2HTL/6j
 0Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680613714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qlq2CcjX+64dAVi3fffS9Y0yWKzAzk7GtHyqF7vlWXk=;
 b=zmC4OsDFeHHMmKYDrSFUbmWFGScXBBjS39ogZgaQ7OdKEqvShYJ0BN9mPzhcxjk57H
 TGC36O1naIuqcX8lw0/ZmeQfEOXc8300G13no2CuVT5LaRl3yqgIR3T/T9Et/rj/fASl
 cb2yMhUIDhUf/NQPG8FuUTv3smYjuEFjBEXKYPsp4G5ooqA4C8g2ignsLZo7ogrWIZh5
 oNsXkIohJlPS4MDvcFOHPpo1Ube8jnR/6qWqwAHXy68EXs7zLwLDm00B4F/YNSJRhPre
 Ses4AC55lN+pQmyM1I46QH/oe1zbX5I9D8k2Oh26aEs7hHJhuq/Qjvj2j3OLDYF6Sc+l
 9vVg==
X-Gm-Message-State: AAQBX9eAYunYJv1dJkZbQ9qRm3OQYDTHyxwo41Q7IcWHdbORXBbN2XEK
 dRLvL5Btzr13nikzm4HZwPXP1w==
X-Google-Smtp-Source: AKy350ayL0RRNHo4rc1WzTq3/p1G+DcUwn+FLVGXrZOBvZkh/V/B6aweawTDIV8xQvh72HKvl9AxEw==
X-Received: by 2002:a2e:b0c5:0:b0:298:a7a7:47e with SMTP id
 g5-20020a2eb0c5000000b00298a7a7047emr987406ljl.19.1680613713797; 
 Tue, 04 Apr 2023 06:08:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 06:08:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  4 Apr 2023 16:05:41 +0300
Message-Id: <20230404130622.509628-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 01/42] drm/msm/dpu: use CTL_SC7280_MASK for
 sm8450's ctl_0
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

On sm8450 platform the CTL_0 doesn't differ from the rest of CTL blocks,
so switch it to CTL_SC7280_MASK too.

Some background: original commit 100d7ef6995d ("drm/msm/dpu: add support
for SM8450") had all (relevant at that time) bit spelled individually.
Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
despite being a mismerge, correctly changed all other CTL entries to use
CTL_SC7280_MASK, except CTL_0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6840b22a4159..83f8f83e2b29 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -975,7 +975,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
-- 
2.39.2

