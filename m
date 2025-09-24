Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE31B9A787
	for <lists+freedreno@lfdr.de>; Wed, 24 Sep 2025 17:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDE810E74F;
	Wed, 24 Sep 2025 15:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DApzcVC8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA5110E74F
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 15:08:42 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b5507d3ccd8so6321159a12.0
 for <freedreno@lists.freedesktop.org>; Wed, 24 Sep 2025 08:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758726522; x=1759331322; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q9im2oqF4utRrC8rBpdrGYdBctIiIANDtE89j7rUJb8=;
 b=DApzcVC8xRMh7uYaeePjSd+o/CSonhV0M7tb9G+7T8QmJPmi41vCJBFHQG9ukMggTx
 PVwBmnjn8uDO9JIZecZr0quE0qsctxbFivzYdBByqchnBAQ5WDez3MGRsoXpopavE8VW
 nwXJ7JkVJvGYFnFCkuC89coZeDkxaNCyDR9rDXr1yk9XQ4ULqapDefpDLFPu+2ULE5uF
 vbwJOadzsgT95DT3Gly0QzDGovc21crG0Q6oF4B/xsl4Ojsv7UJ6ouGl4jIkfvcgDgRd
 ToFS5zmqySIDl1JdcIlSdFWliWz7mQ8Hbf20wIz3OBcxOc45KliRlOUo+JHXHvm2JFAL
 SGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758726522; x=1759331322;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q9im2oqF4utRrC8rBpdrGYdBctIiIANDtE89j7rUJb8=;
 b=lNWYs8a2GUYRrq+3tnzQgcH1hMPTkJz2bwXUR6IZr+ah1v2kPEQdSrMi2idvTkCzvj
 zh9KLpIFlhET3BVtrW+yJ+RijjCac8eA7GETrxuK1wDw+ehVphUK9WJ4ejXhLH5Dd0Jc
 fEVJHn/oQm9kV2r31eAtxLmT8gF9W5PsCHVR2BLnnm1UJCMcouosevuu+lemLFq3oyBy
 tGjEWDFBdDmGn95jnpYYjVYtgJZspUnzFsVtEuF5ic/xnJr4ztdRO+wijweHLTu8tB7y
 86BXjpOqMO/aG/Hw0MB1gOegW84U2jhk7qqi/bs9GNuNzo59PgwlQ8z9xDNdrGgiKRkC
 n6fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq2zwnCaxuNwQSnXlH4fkC+Zipvwj1QAHwvegs0Kn3SeBqsBMhEqVXsj5u3ndA7N85DK734U/Z69g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5b3cPAFAMiq0H/2fjL+Y0IHGXS9S8aOQE2nPCmeq8Y8sUWtA1
 8IeiXWJ5kNkYl2KOhFyEc4vigbAq6jVuqVJ2SHBT3XqcjW1rgg3XO3epg6RbRIndIzg=
X-Gm-Gg: ASbGncuUnu5+eDz6bOJmjWRyzhFtZnHIQ619AVyBV7rhilFD2tEc5MW7vQVdnpR8Xd/
 P9nNj4e4KtDv8bkOVmBkbdkp8/pv/LEoDQf+jG425AoQ8JLQUC2LNRDiOoKpUYbFjzTKBDAHry5
 xmGuVAybIOBuDQX7fqNq8d8WCPq8unzS0Nn3T+Wia5d7m6zt0Z5aJL6KyKXkMbOj2IQ5xtAX7dS
 krjyJl+0OKIRnlIqG60gfNEZUWyApIR14pjnw2YldTf9rwi/vfxQa6a25MottTcxUQaltHRZrvW
 tFRPyGZGuG/q7M1rcjpJ+XYonbKmWmkuydEPqFlu6d3GkeW358qlcQpX2TsDyKImTclG2EiUybw
 ZV9nPRzIIJeM/ro87
X-Google-Smtp-Source: AGHT+IGCHLd3pnmTwxyL4D3bJHLTKcwCMZ56M/ra999jlI6cfFbIZbbFFt5flDomb9K12MnR6LGiYQ==
X-Received: by 2002:a17:902:e88d:b0:267:b0e4:314e with SMTP id
 d9443c01a7336-27ed49df055mr820305ad.23.1758726522301; 
 Wed, 24 Sep 2025 08:08:42 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26b59d6538bsm158717445ad.82.2025.09.24.08.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 08:08:41 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 24 Sep 2025 23:08:11 +0800
Subject: [PATCH v3 2/3] drm/mipi-dsi: Add flag to support dual-panel
 configurations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-dsi-dual-panel-upstream-v3-2-6927284f1098@linaro.org>
References: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
In-Reply-To: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726499; l=1401;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=aqMS0Jn1TNh3mlyytrjaZuPheLrmPmhjXnM4Dd4ZxXA=;
 b=6HLYqVGBQbEyuiZQevtXQREU6fOO4xIxqwSNXpTmZaJF78+kLnDym2AXLAFumXiRTuz5lKPBq
 Bn0Cs8FpfNoAOUh5922IfWiIiiZraGlaBvn+PXp5YEZTERAfDDDR7Ws
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Some devices treat two independent physical DSI panels as a single
logical panel from the CRTC's perspective. However, two separate DSI
hosts are still required to drive the panels individually.

Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
allows a panel driver to inform the DSI host that it is part of a
dual-panel setup, enabling the host to coordinate both physical
displays as one.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 5a85ba01f402a3866b70828391bb417bb8dd5956..0faff285d9ffeb19e4523cdc7bf21c1ec20e6eff 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -170,6 +170,7 @@ struct mipi_dsi_device_info {
  * @host: DSI host for this peripheral
  * @dev: driver model device node for this peripheral
  * @attached: the DSI device has been successfully attached
+ * @dual_panel: the DSI device is one instance of dual panel
  * @name: DSI peripheral chip type
  * @channel: virtual channel assigned to the peripheral
  * @format: pixel format for video mode
@@ -188,6 +189,7 @@ struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
 	struct device dev;
 	bool attached;
+	bool dual_panel;
 
 	char name[DSI_DEV_NAME_SIZE];
 	unsigned int channel;

-- 
2.34.1

