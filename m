Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEhGANcBq2msZQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:33:27 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D50224F3E
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 17:33:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BB210ED84;
	Fri,  6 Mar 2026 16:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EkUsr5QC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C16410ED84
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 16:33:23 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-829ac8d56c5so341325b3a.3
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 08:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772814803; x=1773419603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fniX8oUV8n9EE4oHisFRFMjU1mIvUBscUL0mED7CFfk=;
 b=EkUsr5QCICm7FwhOL4zryKWxHqaNqFpduDy/dVjZQU2SE1cvoYjPJq36ZWsm20FXSv
 t81+dJ6uwI7BYi9rBJ3rOOxScd7qPZqzfgsxPO2MP6djyBPLnleTp8zZaUZEUnU2NMew
 CJkwZv6FxbWn8iSIPThaSnzdSpduYFbEOrZ3oSrhUzoQt0K8dQe7gQ3MH1us7SB1qMpL
 amZE8FzmGip3X2yK7AwLRaVjQX7xacsDVIixMJt4zAM7S67SspYC9v6LJQhIF7La3/Zz
 SLufsxYbjtcJ4e7d+hgeJf4t98cg6RqeINqMK3S8/N6bkzaLtCAKUElsHD9ddJYnVFNV
 QkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772814803; x=1773419603;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fniX8oUV8n9EE4oHisFRFMjU1mIvUBscUL0mED7CFfk=;
 b=gYQisC9D8hJ6/8vTDrkQ/RDkMX+QqK6/h6P5to7fgx7RpS/3UnKHC0O7w13/bL6He4
 4xbzcGnccy4Z8NTcP1cl6v7K8oV115LCvfFJBE9f7VlmMo6AHgspJiBIOy5VqdHUYQyS
 EUvJkP11hsquUinWBHW3QDo6sP3YVVSyhmmbmjL9Iii8Kxph9pIUhyhjV6eJSO2BKfWN
 9cN6d31O6rQ/6a8hfa3l05n3TiVNolOT0/1AWpzBdFt4sONSUMHKgSY1Yc5wJf0j8GTH
 BpLqtO1GILSgpDvJ3Io7iG/lX4mRi+eIW66LITSslMuvikGEZ3RX+EqndSfdF8raYT7n
 8QhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVODTotRDa1RLFaLioQjPb9rMwKmhOPiPsGA/bo+Lh8ZIJXHbrzTWmkNon09PDZJxgSmad3xCwR4YY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz321L4cY/IBThs6ZNx84EkUrLiIIgYZMhW1Pi0jXw/OVf01xdW
 1QhPR1aB+S7r96EYOqbahHa5C4dVqHm46wg93Pjs0tpL4tZ/jLaCpGpD
X-Gm-Gg: ATEYQzw3LY6L8Ibt4FQGPcCkbqK9s7hXamOcMrTdmMYsHTWJto3sA/piOlRRSlG226b
 do0Nz9YTNkk8KSNnJQPW3tXdo79hs7cqv74uHkyRRreL4egku5N4SmlI2UFGTP/vjD0DHHzNJa+
 AdktFSY0jCNFF0zTnl5sVbhR9mDnsWyBc0jZ/30aaBQG0GHKpurNmTRz+EFnp7j/kdvGsVAMUBY
 Yks/EpaTGBf++f7SAiEsVNbmZwXgr+r5bcu30D8nm1TEpkHSW53+98Z49u7vvxhgneu6tTYNYAp
 vZMzIwhznzX88ytMZ8pmz0kffczMRNay7DgklQkxGxfIgPN7d7OQyBg91XZ5bE9CSM61lFe966+
 lfxmEhnuEND767mW50ChTvcaDvJyKeayMvzYBdWi7sbYCKx2Ac1US0AwlY4dmwqskPZYZg/6l33
 lN9BIUxj58l1GwP/sY9g==
X-Received: by 2002:a05:6a00:1408:b0:824:93e4:2de1 with SMTP id
 d2e1a72fcca58-829a2eaed31mr2478705b3a.30.1772814802771; 
 Fri, 06 Mar 2026 08:33:22 -0800 (PST)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a4676187sm2786788b3a.27.2026.03.06.08.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:22 -0800 (PST)
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
Subject: [PATCH] drm/msm/dsi: fix pclk rate calculation for bonded dsi
Date: Sat,  7 Mar 2026 00:32:38 +0800
Message-ID: <20260306163255.215456-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 33D50224F3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Recently, we round up new_hdisplay once at most, for bonded dsi, we
may need twice, since they are independent links, we should round up
each half separately. This also aligns with the hdisplay we program
later in dsi_timing_setup()

Example:
	full_hdisplay = 1904, dsc_bpp = 8, bpc = 8
	new_full_hdisplay = DIV_ROUND_UP(1904 * 8, 8 * 3) = 635

if we use half display
	new_half_hdisplay = DIV_ROUND_UP(952 * 8, 8 * 3) = 318
	new_full_display = 636

Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e8e83ee61..db6da9937 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -584,13 +584,30 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
  *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
  *  transfer time and data overhead as a starting point of the calculations.
  */
-static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
-		const struct drm_dsc_config *dsc)
+static unsigned long
+dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
+				const struct drm_dsc_config *dsc,
+				bool is_bonded_dsi)
 {
-	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
-			dsc->bits_per_component * 3);
+	int hdisplay, new_hdisplay, new_htotal;
 
-	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
+	/*
+	 * For bonded DSI, split hdisplay across two links and round up each
+	 * half separately, passing the full hdisplay would only round up once.
+	 * This also aligns with the hdisplay we program later in
+	 * dsi_timing_setup()
+	 */
+	hdisplay = mode->hdisplay;
+	if (is_bonded_dsi)
+		hdisplay /= 2;
+
+	new_hdisplay = DIV_ROUND_UP(hdisplay * drm_dsc_get_bpp_int(dsc),
+				    dsc->bits_per_component * 3);
+
+	if (is_bonded_dsi)
+		new_hdisplay *= 2;
+
+	new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
 
 	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
 }
@@ -603,7 +620,7 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
 	pclk_rate = mode->clock * 1000u;
 
 	if (dsc)
-		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc);
+		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc, is_bonded_dsi);
 
 	/*
 	 * For bonded DSI mode, the current DRM mode has the complete width of the
-- 
2.53.0

