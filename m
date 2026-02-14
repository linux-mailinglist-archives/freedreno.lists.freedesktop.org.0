Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cZszHN1TkGmbYgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 14 Feb 2026 11:52:13 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A518813BB82
	for <lists+freedreno@lfdr.de>; Sat, 14 Feb 2026 11:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE8E10E098;
	Sat, 14 Feb 2026 10:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+90pqhF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4852610E098
 for <freedreno@lists.freedesktop.org>; Sat, 14 Feb 2026 10:52:10 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-824a3ba5222so978179b3a.2
 for <freedreno@lists.freedesktop.org>; Sat, 14 Feb 2026 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771066330; x=1771671130; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JKZRzgUme6pMax6EEp9xxfwcIn80zii3ZHbrvX9cB3c=;
 b=c+90pqhFzxaCTUWsRrtT1FRDXZght0MXoWhT/wMXvVLeEsbZbyDK7fCxlCPy1tozIY
 G7lBe92ifkOCsLOdXB8KzPfIotd/FljjtmkBSN6oYe78w5GfFvFKUuumlJBMEKYYospG
 BwuNsm7uAhGiWSL6zvhx0oZ+aNo/yWMYtng0VL9CkyKygSJmAy+G0WsQxDXcUsEs2wyn
 eR7CJxC5S9lucSHI7q6RHiuBOX2PJe5hWUX8/zk2nht2zEZ1vBI/vGCSHIeM4E4IRMoC
 LoOIS/gpTYwyfUC1Fb2qM3l8uPPRC1pqIQ7LTHU+FUus/d2j8lCymamqJ7/0Pqf+YHuv
 YTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771066330; x=1771671130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JKZRzgUme6pMax6EEp9xxfwcIn80zii3ZHbrvX9cB3c=;
 b=dYGe0JBni6kxOe6eSKabpMT359BbwaSmhkUBRCjenmTe8dtXvxBVCZvZURDITcQAXz
 Id02BjyhC547msFI782RSWYnv8PS1exoVPyB4TQ+UDOqm8tgUBQRxiyjBLFMV+Rpd1Hg
 PLy7o09nMjKWzWXcSNiw4Mft5JJOZxK5C453oNHSxx02dKnuFwFzRlawnxjhVMvKCcbC
 X1Rk8mMDilv0X7jFiXEn0PfTlvLSrorFGf82LihHYISD/dLhM/n0U6kpmISW+r1hWjeU
 7OUykDSEcNUdXLPlfaniFP+srB36Z0Q9Ic2iMrYwtte4QmH8woE3dxQe8l2ESluYHNKe
 CkxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0jr5CnAssLi2+iPKCgb4M7QF9/k+FojnJbUpwNp6kaju12yXzlbDjeBQAISXOoIRQ6B0h/HP7MMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfO2d8bifIIJzCrH6cinPlaOaroVNVq77MLt1kJ41+3nnp5HH4
 xLss3oqS6MhkdP+6fhxIgKvwc4qwFJTknvubB3CV8MfQHg0cUTvTvalp
X-Gm-Gg: AZuq6aJOt87frj7QIQYsdmbfy/lRydOQo1jW9fXkrNXJcq05HAr8Q4OoUvau9QxS8x1
 cBr6AoKmqChii/hnkJ9nLv1gdEul72UPVE22pGP0s/fvCOB7689O5lmFU6ma3FS1NESOU/UwXpy
 nyj/gEXYoXSVhIE/w7cYOBpLQaoPkofy2wAMW4GYedJp4FRgOYL5FMrxzMXRcrMxf/lV/Pa1f1E
 +JRn/rnyzxCqHzxBDtwXk+gdrBsX46N6BdbQkNJ/jeeABEOhWtABGvULjf90e6/DakCQNdH6B0G
 VpCgbCD1j2NJMdMB+7sWPh6TjHtL1yrxgB/hpacU7XBcruvYjtqCRJVHnx8HnejDue51a+H3e3O
 Yb05C+ixe05JVtYkw3tY1cYDb3uWerPUNrj+4yJnse34CJbvDkLR3f2b/3lJO0nXDwkTsGNsm3T
 tcjUkyGalYygEFIX7k
X-Received: by 2002:a05:6a21:1798:b0:35d:5d40:6d79 with SMTP id
 adf61e73a8af0-3948376c311mr2406124637.12.1771066329667; 
 Sat, 14 Feb 2026 02:52:09 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a13:29e0::c83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a6f9d34sm18436865ad.11.2026.02.14.02.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Feb 2026 02:52:09 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: fix hdisplay calculation when programming dsi
 registers
Date: Sat, 14 Feb 2026 18:51:28 +0800
Message-ID: <20260214105145.105308-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[freedreno];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: A518813BB82
X-Rspamd-Action: no action

Recently, the hdisplay calculation is working for 3:1 compressed ratio
only. If we have a video panel with DSC BPP = 8, and BPC = 10, we still
use the default bits_per_pclk = 24, then we get the wrong hdisplay. We
can draw the conclusion by cross-comparing the calculation with the
calculation in dsi_adjust_pclk_for_compression().

Since CMD mode does not use this, we can remove
!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.

Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e0de545d4..e8e83ee61 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -993,7 +993,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	if (msm_host->dsc) {
 		struct drm_dsc_config *dsc = msm_host->dsc;
-		u32 bytes_per_pclk;
+		u32 bits_per_pclk;
 
 		/* update dsc params with timing params */
 		if (!dsc || !mode->hdisplay || !mode->vdisplay) {
@@ -1015,7 +1015,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 		/*
 		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
-		 * enabled, bus width is extended to 6 bytes.
+		 * enabled, MDP always sends out 48-bit compressed data per
+		 * pclk and on average, DSI consumes an amount of compressed
+		 * data equivalent to the uncompressed pixel depth per pclk.
 		 *
 		 * Calculate the number of pclks needed to transmit one line of
 		 * the compressed data.
@@ -1027,12 +1029,12 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 * unused anyway.
 		 */
 		h_total -= hdisplay;
-		if (wide_bus_enabled && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
-			bytes_per_pclk = 6;
+		if (wide_bus_enabled)
+			bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);
 		else
-			bytes_per_pclk = 3;
+			bits_per_pclk = 24;
 
-		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
+		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc) * 8, bits_per_pclk);
 
 		h_total += hdisplay;
 		ha_end = ha_start + hdisplay;
-- 
2.53.0

