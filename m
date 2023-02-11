Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4B7693518
	for <lists+freedreno@lfdr.de>; Sun, 12 Feb 2023 00:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C0910E403;
	Sat, 11 Feb 2023 23:13:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E907510E3F4
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:40 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id fj20so8622143edb.1
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qe8rVCHG/b1Lvwa2nv85/t2Q0g5G/UidRqSlfbx2gLg=;
 b=jQ0uVyZyuYYaQSo0S0Nxi+se8xg/Mp0cHDyx7xOH36xXTnv5fIekXoQsqvvKN4//id
 jHZdMZ+KS5UgZcmy/DMr+bhVAIo8GToa63ugewX20SzJ122mDlXUJ12VqyKxZhHsqAqm
 ishpZdwtCNVZOO11uGOpXbBZTXxiwQkHUfKkUHDTSzSkea6vpdN9YElcIAvbitO7C0ED
 J+1e40h6db9cn+zRONMkc6mWehjwbAef2/UmQImMLNop/r8T9YhvY+set83QdznfJkoy
 XTOUzAB1oKM0nIrIonyB4OP5yuf5Xil/Ms0/CYkIH5dEupJ74vg4ISSUW9wnGmCGtTA7
 VQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qe8rVCHG/b1Lvwa2nv85/t2Q0g5G/UidRqSlfbx2gLg=;
 b=ySHW0MH0//YxoOBUfMznGAwbKTAeO0qOFyDIw3ea6nC6IBmmyrd3wHqZRelWTz5FZI
 QQ/302yCrq3CHHVZTIFTMaAmmYakJ8lZiJM+U1HpsBDuCbZIFyAikhU75NE5W9AHZSV4
 ldkV1TCeTLiF36enUyf5V1fa+7+am10hRjhAeem/vZnROPoQtXVK0IYVEonOwVpDBOQI
 xW+gb8/3M/X2WXPJzC1LKAC4/zCAXAKXI8ux2+ksUHCU3yqxl9IQLIAXmnZZNXIaP0gw
 VgGFqD5oNJFCFxukgsiH2rnTZrbmg+DFG7Nu9ChPvv4lKZP70wH5o/vEZbBY3w9wwJdV
 /12g==
X-Gm-Message-State: AO0yUKUls4x3B3s0W+hGYRFnP+seubDjfXUI5PaIfxmLBhu22xLT/2Bj
 XaELDtf0zJAAXz0QpolrFu3Mew==
X-Google-Smtp-Source: AK7set/K/wj+ZcPJ2JI+tM9o5aEEQG+uPXHygDitJEWGEfr3mH8pfIrdj46Jx2Y7XxkXuj8+Nc/KBQ==
X-Received: by 2002:a50:f68e:0:b0:4ac:b2cb:14d4 with SMTP id
 d14-20020a50f68e000000b004acb2cb14d4mr4924178edn.15.1676157219451; 
 Sat, 11 Feb 2023 15:13:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 12 Feb 2023 01:12:41 +0200
Message-Id: <20230211231259.1308718-33-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 32/50] drm/msm/dpu: duplicate sc7180 catalog
 entries
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

Duplicate some of sc7180 catalog entries to remove dependencies between
DPU major generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 8977878890f1..3117bb358117 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -82,6 +82,11 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
+static const struct dpu_dspp_cfg sc7280_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sc7180_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk, -1, -1),
 	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk, -1, -1),
@@ -132,8 +137,8 @@ static const struct dpu_mdss_cfg sc7280_dpu_cfg = {
 	.ctl = sc7280_ctl,
 	.sspp_count = ARRAY_SIZE(sc7280_sspp),
 	.sspp = sc7280_sspp,
-	.dspp_count = ARRAY_SIZE(sc7180_dspp),
-	.dspp = sc7180_dspp,
+	.dspp_count = ARRAY_SIZE(sc7280_dspp),
+	.dspp = sc7280_dspp,
 	.mixer_count = ARRAY_SIZE(sc7280_lm),
 	.mixer = sc7280_lm,
 	.pingpong_count = ARRAY_SIZE(sc7280_pp),
-- 
2.39.1

