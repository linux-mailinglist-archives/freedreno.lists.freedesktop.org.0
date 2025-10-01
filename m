Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CCCBB513A
	for <lists+freedreno@lfdr.de>; Thu, 02 Oct 2025 22:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC9D10E38D;
	Thu,  2 Oct 2025 20:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PB3En4Ti";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F1110E0F5
 for <freedreno@lists.freedesktop.org>; Wed,  1 Oct 2025 14:01:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-46e6771c523so2136995e9.1
 for <freedreno@lists.freedesktop.org>; Wed, 01 Oct 2025 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759327276; x=1759932076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r88bVkU6R3YFAsO3wz4+pTX+MHJI0oI//rtTqu0aO6E=;
 b=PB3En4TiViFK3GzAXTcC3909KjynmfX82bV2u8QRP9BJQwjXz5Y+umDtLpi5+52bc3
 VzAKCOJXVsbVpfSj0gVZ6IVil9sao8nAa30vexZWWqroh8dKW/9PzLnJMeqxLlUJ4iDz
 gfL2wFipAfaPmJvg7OHTKBFKxtQhhbASSnIv7bZISCMM1CF1wHp6KzeDhsL1D5EJtvsC
 KPby9NGXpX9m+QSvyJQkJaxp9n2DbJgoTQ4Fdczl7e1iGqKdcJlGhCz2zfXpOR3iMokM
 DYrxkWgq4BW9NksP/JmMEHKf/JxlT/9AxYiD+V4piI5NWxTsYP3VvWCdtqJisH9O8EFM
 fV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759327276; x=1759932076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r88bVkU6R3YFAsO3wz4+pTX+MHJI0oI//rtTqu0aO6E=;
 b=NvpfHg0Vj/DRrVfKeGVMccq2qMl5IBZa4ujCMr04Nby3FLUZgP6rTS89vkabkJCzUd
 c0kdpINGVUMwN+wtaxXiQERnzF7bZcauw2vwUTgMoEoosKXJWYgf9iPxXY7b4R92IoXT
 kAArTbQ10Hoa8GuVIvU1kuwgOC0pKKJ7WDhqUfKGWc15cgy/N5je1JQe2a2jJLuZmEtH
 5xzZugD4VtmB/QevX5mU7tvIaba6mRUHWVd8QemFBrDjdCR7ADSkb45JRRMJe+SSkPiO
 ZCuGNOwHHyQjdx2zWt+Dy+NWLDpBRAuaIuDMS9Pf3z2xvAd8SAFbKkTtJcJauQVJ47ef
 vYWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBOIDtMw06qNxw5ZWX3ttN4cQ0hu+p8rBFIyu1u0mhR908E0xcr1iyOWuQ9QXgaeuAPZENqiDWEe4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzP0ppSxOu9i6y0JQ9ffRrW4TXedwNarmBDMofdlaQuDWPy3xfd
 erghdeWafw+qHsgHL4uAWWFE4RwqHKc2YXBFOB5GbOV1e603myad0mFO
X-Gm-Gg: ASbGncv4UkLPhkYY6pHWZOT5DUkNCbHgwAd9x1Ut2AVrTRbdeHlV+Dsd+eX6njNCmuz
 wIoyKNeo9VrNI4cm1j8NYGsu847QoSwYpGmbxOie6rxsRW1yZjOLJFLvahSEmJa4lqHc62D/87a
 zsuErnli2lgxCvUGdhR0pjJPyyyTJdrZbgzFe8m1FrjfCDbxCwLyDUNz5ZbOutaZDexlsmgLWXF
 6/esAD6FfveU6EzqcR7gb9Enxqq0BLhk33b/E0vwY2xBYRS6bhWFGOnzLQM2DRQ8JEohF4fRlbp
 1cTpGrdw1KOiJmuQDSBndnHmPsVj79wA8UoMrSqeYpyIFZ3ew+dQvRCoGam1Rrkn4VK/Zv7jJEU
 j53w0gJvjmGl9XJIdCLwkZH/HgGdnQJ7lElwx/CdAp388zyxi+AwlDF4j2tRjSBXg0AbXPxPCw8
 IrDHQanJwiqOAweXhQNFYhrlyRq4+HJi+0kadqq8+RKW3Fzg7Ct9G2oA==
X-Google-Smtp-Source: AGHT+IF6jIPdEU9MFXPhCPUkqzhyaWrP5uY2bhk5OwNgz8t2vPUiheyA7QIaNPR9raR1Aa2Qrunkyg==
X-Received: by 2002:a05:600c:4e4a:b0:45b:9a46:69e9 with SMTP id
 5b1f17b1804b1-46e612de19dmr34857695e9.31.1759327274375; 
 Wed, 01 Oct 2025 07:01:14 -0700 (PDT)
Received: from LAPTOP-AMJDAUEJ.soton.ac.uk
 (globalprotect-nat-extbord.soton.ac.uk. [152.78.0.24])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89065b5sm27029828f8f.17.2025.10.01.07.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 07:01:14 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Eugene Lepshy <fekz115@gmail.com>,
 Jun Nie <jun.nie@linaro.org>
Cc: Junjie Cao <caojunjie650@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Date: Wed,  1 Oct 2025 21:59:13 +0800
Message-ID: <20251001135914.13754-3-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001135914.13754-1-caojunjie650@gmail.com>
References: <20251001135914.13754-1-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Oct 2025 20:04:12 +0000
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

From: Jun Nie <jun.nie@linaro.org>

Some panels support multiple slice to be sent in a single DSC packet. And
this feature is a must for specific panels, such as JDI LPM026M648C. Add a
dsc_slice_per_pkt member into struct mipi_dsi_device and support the
feature in msm mdss driver.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
 include/drm/drm_mipi_dsi.h         |  2 ++
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e0de545d4077..773ce8520698 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -166,6 +166,7 @@ struct msm_dsi_host {
 
 	struct drm_display_mode *mode;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 
 	/* connected device info */
 	unsigned int channel;
@@ -910,17 +911,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = dsc->slice_count;
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
-	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
+	bytes_per_pkt = dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
 
 	eol_byte_num = total_bytes_per_intf % 3;
-
-	/*
-	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
-	 *
-	 * Since the current driver only supports slice_per_pkt = 1,
-	 * pkt_per_line will be equal to slice per intf for now.
-	 */
-	pkt_per_line = slice_per_intf;
+	pkt_per_line = slice_per_intf / msm_host->dsc_slice_per_pkt;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -1069,12 +1063,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		else
 			/*
 			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
-			 * Currently, the driver only supports default value of slice_per_pkt = 1
-			 *
-			 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
-			 *       and adjust DSC math to account for slice_per_pkt.
 			 */
-			wc = msm_host->dsc->slice_chunk_size + 1;
+			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
@@ -1683,8 +1673,13 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
-	if (dsi->dsc)
+	if (dsi->dsc) {
 		msm_host->dsc = dsi->dsc;
+		msm_host->dsc_slice_per_pkt = dsi->dsc_slice_per_pkt;
+		/* for backwards compatibility, assume 1 if not set */
+		if (!msm_host->dsc_slice_per_pkt)
+			msm_host->dsc_slice_per_pkt = 1;
+	}
 
 	ret = dsi_dev_attach(msm_host->pdev);
 	if (ret)
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3aba7b380c8d..2ddec7931bd0 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -180,6 +180,7 @@ struct mipi_dsi_device_info {
  * be set to the real limits of the hardware, zero is only accepted for
  * legacy drivers
  * @dsc: panel/bridge DSC pps payload to be sent
+ * @dsc_slice_per_pkt: number of DSC slices to be sent as in a single packet
  */
 struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
@@ -194,6 +195,7 @@ struct mipi_dsi_device {
 	unsigned long hs_rate;
 	unsigned long lp_rate;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 };
 
 /**
-- 
2.48.1

