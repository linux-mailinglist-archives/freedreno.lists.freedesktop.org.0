Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F412D58188E
	for <lists+freedreno@lfdr.de>; Tue, 26 Jul 2022 19:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D2E95F24;
	Tue, 26 Jul 2022 17:38:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2539495F08
 for <freedreno@lists.freedesktop.org>; Tue, 26 Jul 2022 17:38:45 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so13943605pjf.2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Jul 2022 10:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nfROAXY/moJLzNsb5FMhoMcqb29l4Ohc3eBLspjd7i8=;
 b=CdKkn2TAJXxhAQ0zVV/bxvv+NtJ21HCRpY2zDxPmR+AKTLuroLHcxjjFP3IX++SaAY
 r4web3polSC0tU3jg59fs/V956n/OI3RrS6OndczV+r94MEKeyJyRNkG6Cc0DEM66YY7
 BIeGKM4svzgyhiOM6KEphErb3pwFkbUp8wUFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nfROAXY/moJLzNsb5FMhoMcqb29l4Ohc3eBLspjd7i8=;
 b=CtnWek0P9Y+LBFt7UDj27Ds/Ix/yMFMv4BT7yOeSutPP9exb4rA+GjQc+70VkM+rLG
 qZ8MD3uLhgN9PKMPpP9CwCkiBbIOpAUwJoye1IT+P5FA9hg2nVuqNTwczlXcsmFPEsDG
 WJ6RDgJ14QcE3Hw3rf4NVOg8SauMK1w89WBb39owx2lWjJhXjWeLrVp/hFwsVCWOTR/z
 hbQMPqraRJMgCDY8teWyqAoMSt1d4Litp+3s8Ssw0OGQ1gAAN0M4fxLp+SbmhaG9yqiG
 JFsTebyohiDsfAqjWZovKdCP+NSaAZ/Fzt1hO8xXG6llYQFqXZRK0+5cDzDvmguM4V5N
 xAmQ==
X-Gm-Message-State: AJIora/nN/YVeE113DS/tgAd2Iye+nJoDuqt1aSZmKW4lkCu7BB5MmfB
 WI+jIfK52jWnIJRmvb1PqptjFg==
X-Google-Smtp-Source: AGRyM1v4Qxmej3AUYLBc4E4fc1Qdq3OKx2v7JS9BtYZRthjbwBf3uE93fWlt0LAQ9pq0KRrfZkzpTA==
X-Received: by 2002:a17:90b:2407:b0:1ec:dd93:511a with SMTP id
 nr7-20020a17090b240700b001ecdd93511amr300477pjb.212.1658857124631; 
 Tue, 26 Jul 2022 10:38:44 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8693:e9aa:75c0:5134])
 by smtp.gmail.com with ESMTPSA id
 ik29-20020a170902ab1d00b0016d9ecd71f4sm245884plb.77.2022.07.26.10.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:38:43 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mark Brown <broonie@kernel.org>
Date: Tue, 26 Jul 2022 10:38:19 -0700
Message-Id: <20220726103631.v2.2.I94b3c3e412b7c208061349f05659e126483171b1@changeid>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220726173824.1166873-1-dianders@chromium.org>
References: <20220726173824.1166873-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/7] drm/msm/dsi: Fix number of regulators
 for SDM660
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
Cc: Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

1 regulators is specified listed but the number 2 is specified. This
presumably means we try to get a regulator with no name. Fix it.

Fixes: 033f47f7f121 ("drm/msm/dsi: Add DSI configuration for SDM660")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Fix number of regulators for SDM660") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 02000a7b7a18..72c018e26f47 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -148,7 +148,7 @@ static const char * const dsi_sdm660_bus_clk_names[] = {
 static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 2,
+		.num = 1,
 		.regs = {
 			{"vdda", 12560, 4 },	/* 1.2 V */
 		},
-- 
2.37.1.359.gd136c6c3e2-goog

