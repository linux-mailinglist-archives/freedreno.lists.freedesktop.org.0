Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5872E692D1E
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 03:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E066310EE6A;
	Sat, 11 Feb 2023 02:11:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F4210ED7E
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:17 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id c26so15413661ejz.10
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CAyHGaDbUvnZaJs/422FMQxhR1BogLL7c2eoszz5Y9M=;
 b=D6HEfRvoOpaxex9v1krQ1wp8qvPl6WuecC/NPoX8PhCzY1Gijey3uoaufuLIPUEdq4
 kytaonjp54j1o9QW6U26zr4D0huYvn8h/p6iYskmco00ldfcyv5IF1L2DGRvSOrqvilW
 28jdOD7kgHJ+CpokvHSs9qxsruNAfSTqzcyo96Z310sWReCcKYeFjJOt6XoGUyk2qdKk
 0PU2Vzbz4VKzZYNqK/5W0DjrsGsApj9SW/D1Nh1qtdPK2GybkOKxpw+b8CQ28YcO0brk
 bxIb68XX8k84E2A7nJFa1florbBDM96J+RkABjdFurIhXG8yatfj/cDlzH8NoOj+DEC0
 D+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CAyHGaDbUvnZaJs/422FMQxhR1BogLL7c2eoszz5Y9M=;
 b=pMkJabnch0eLGaU5rjeJFvZr9qxLNqAnuIq8OYnkzVlzBi94gvHwNVsUFgSx9Se6Rw
 nxMG8u1jJjqVI7cfx/+47TBi/uCjk6vFwT0CTFTQ7FZqw0xyGzrkysSp3rO0ojvsKRYI
 NYu5d4L8Mhtssjn095NJMFaoOLTqRBoTibRzhKP/co/r+bR050kKojE5DO8LzdaHUrT7
 cH5jyZl49+wQXhnRGH0ptppyaZ4TdJskhZtZLgZXhg2JFdDMgMqwlC38c4drOyrVq+K6
 IL5dSkjnAYVxyf6VF0xESB+RU1yS8CnLdVIHb4vzaq9356f8ARfMRAqGpC3jpIJhnl7e
 nr2A==
X-Gm-Message-State: AO0yUKUPjrCcP4gYD8PV0M5CMqL3a6ZBpg/a/y+uN601MrpxbeFDTT6p
 5PRR3LeRHON7ZTF2QZB+KJCCbA==
X-Google-Smtp-Source: AK7set+YBJY3WUPYQjgrE1AM1w0HOUTIsonJJBnP4aV4KjSrFm34CZFYgeX9JnM26p8ceKVd8cEEzg==
X-Received: by 2002:a17:906:68c1:b0:880:c284:8436 with SMTP id
 y1-20020a17090668c100b00880c2848436mr15898863ejr.57.1676081477172; 
 Fri, 10 Feb 2023 18:11:17 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 04:10:31 +0200
Message-Id: <20230211021053.1078648-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 21/43] drm/msm/dpu: duplicate sm8350 catalog
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

Duplicate some of sm8350 catalog entries to remove dependencies between
DPU major generations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index acc5e3789cf4..9e2724ff6b65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -136,6 +136,12 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
 };
 
+static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
+	MERGE_3D_BLK("merge_3d_0", MERGE_3D_0, 0x4e000),
+	MERGE_3D_BLK("merge_3d_1", MERGE_3D_1, 0x4f000),
+	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
+};
+
 /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
 static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
@@ -191,8 +197,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
 	.dspp = sc8280xp_dspp,
 	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
 	.pingpong = sc8280xp_pp,
-	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
-	.merge_3d = sm8350_merge_3d,
+	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
+	.merge_3d = sc8280xp_merge_3d,
 	.intf_count = ARRAY_SIZE(sc8280xp_intf),
 	.intf = sc8280xp_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
-- 
2.39.1

