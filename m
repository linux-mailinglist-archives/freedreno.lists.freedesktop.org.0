Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2964C7CB060
	for <lists+freedreno@lfdr.de>; Mon, 16 Oct 2023 18:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FE210E22C;
	Mon, 16 Oct 2023 16:54:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6978810E22A
 for <freedreno@lists.freedesktop.org>; Mon, 16 Oct 2023 16:54:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40776b200e5so26430405e9.2
 for <freedreno@lists.freedesktop.org>; Mon, 16 Oct 2023 09:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697475242; x=1698080042; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4YcpFsN2TSMs34leTZQIhhDmmY5p8SAeysdXXfcQJY=;
 b=AHXclUCufmyqBG9zld6n+XXn0fA5S7UPoB4A3djOcPqi6/EM0tlbThXeiEuYNNY18q
 PR0mdxu2PHHS6CDeJv6gVF9NPPTZZFl/d6R9ewI/Mib0D7rOlS6SqazZIjKP5hKJECn4
 MxoA6OaaQRNIp1QcqileJfGQICvS+aWJhNePtbX5GitQ7lB/j09EzoraqfihPrB5u4Yk
 t+8uw8ymgMcmCQ1Jf2t3YV2QjF1QOih8cYMSWcYr+vb8xEwJo28dCZ3F6lJBpRfUI2j7
 4vAr4pgSEgYnI9YM7QtfctLjMI1dSbKHXp+sxvM65jkOvKPOO9SnP+0HiIeR7pPFJJC2
 ljhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697475242; x=1698080042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4YcpFsN2TSMs34leTZQIhhDmmY5p8SAeysdXXfcQJY=;
 b=Nb6H9C0dneS7SSHRFiXuEm7FWyrkwmZx/wdDUn84zfTElTeWcvk9VsnKCF7bS3Ep6N
 k8cPLvkfUGU7wbGwIJWeUZoJW/eQEnCYrr8SNLeVX2lKdeUFXq3XmDZXBLQNqlfMLgDW
 rKYIRjX9l83pResLuBB0jU97uV+HlgyPY3a8LWfQxjNF1yhAeMTrzFacABOkMDblpF+k
 8jgXKk0QttKrBzM3rdOF0a+qrKkAgiQiLQCqt+oknQ8TRchrBC9zvp9NmCE8ih+u87BW
 ARv/G9Yg2tjGpqv3BUUvT8Jfnvtf6uJuqt5HBhw1JCgR8vbwN/HkHzD8v2CUz79/Aoeu
 /EqA==
X-Gm-Message-State: AOJu0Yz9bEi2FBIeCNJz5xUytutMrdzwdknoz8HacmcdmcTqEs7NU2+P
 3L2nF9JH1g8P5HXggu5OZJ5cCg==
X-Google-Smtp-Source: AGHT+IG9ptuOZK2qMMs221TBvhrKBhc0p1PMjKU8/S3TkYk4xU7qgakeBAb/XsiPpTTx7XzPxsCcZA==
X-Received: by 2002:a7b:c394:0:b0:403:31a:77b9 with SMTP id
 s20-20020a7bc394000000b00403031a77b9mr30584923wmj.37.1697475241822; 
 Mon, 16 Oct 2023 09:54:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 09:54:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Oct 2023 19:53:47 +0300
Message-ID: <20231016165355.1327217-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 02/10] drm/mipi-dsi: document DSI hosts
 limitations
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
Cc: Marek Vasut <marex@denx.de>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Document the known limititations of the DSI hosts vs commands transfers
in LP mode. For the details see sun6i_dsi_encoder_enable().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_mipi_dsi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index c9df0407980c..167742e579e3 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -85,6 +85,10 @@ int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
  * host is in. Drivers that need the underlying device to be powered to
  * perform these operations will first need to make sure it's been
  * properly enabled.
+ *
+ * Note: some hosts (sunxi) can not send LP commands between HS video
+ * packets. Thus all DSI transfers sent in LP mode should be limited to the
+ * drm_bridge_funcs::pre_enable() and drm_panel_funcs::prepare() callbacks.
  */
 struct mipi_dsi_host_ops {
 	int (*attach)(struct mipi_dsi_host *host,
-- 
2.42.0

