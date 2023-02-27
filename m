Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA6F6A3712
	for <lists+freedreno@lfdr.de>; Mon, 27 Feb 2023 03:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2649B10E30B;
	Mon, 27 Feb 2023 02:06:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3142B10E309;
 Mon, 27 Feb 2023 02:06:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DA684B80CBA;
 Mon, 27 Feb 2023 02:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C4FC433D2;
 Mon, 27 Feb 2023 02:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463600;
 bh=DVf1owl9PG8lHLbeynhccmcJN+TFk0IBBZSEKPXqKsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CVh8JQhAWfLvKBqYEOLncEt4AzWU/T5IfQIRWhvrEa0x5fVGEiRJeVmdBryhTDc3P
 GEmvFpF9eeCgKPoxuFH3jJ333aI/qGPJlTla5uOHM+NDo2zlbybBS8kOm57kRKaR+l
 DePyysI7ImebixlYLEiTzHM1X7Sw/8bwLvwuVd+OV1ExMS2wWQ0RtZZw9pOTSvqm17
 Cao7z0Kui3Ep6yQz4dMknQUgAyEqAS+E3DK+HzAoKU5edzclJN5KltSuU/WK7nAz3t
 xDsdIAqxE9J77yqXzQene3soVSYQpXdoaa41by2At35CLqOegMsCK7YJ2zGrGVCGOj
 cFX15UvCd0Tlg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun, 26 Feb 2023 21:04:22 -0500
Message-Id: <20230227020457.1048737-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH AUTOSEL 6.1 24/58] drm/msm/dsi: Add missing
 check for alloc_ordered_workqueue
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
Cc: Sasha Levin <sashal@kernel.org>, vkoul@kernel.org, marex@denx.de,
 linux-arm-msm@vger.kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 vladimir.lypak@gmail.com, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robdclark@gmail.com,
 daniel@ffwll.ch, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 airlied@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Jiasheng Jiang <jiasheng@iscas.ac.cn>

[ Upstream commit 115906ca7b535afb1fe7b5406c566ccd3873f82b ]

Add check for the return value of alloc_ordered_workqueue as it may return
NULL pointer and cause NULL pointer dereference.

Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/517646/
Link: https://lore.kernel.org/r/20230110021651.12770-1-jiasheng@iscas.ac.cn
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 89aadd3b3202b..f167a45f1fbdd 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1977,6 +1977,9 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	/* setup workqueue */
 	msm_host->workqueue = alloc_ordered_workqueue("dsi_drm_work", 0);
+	if (!msm_host->workqueue)
+		return -ENOMEM;
+
 	INIT_WORK(&msm_host->err_work, dsi_err_worker);
 
 	msm_dsi->id = msm_host->id;
-- 
2.39.0

