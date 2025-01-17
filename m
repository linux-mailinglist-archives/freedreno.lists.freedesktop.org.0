Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AA7A14B92
	for <lists+freedreno@lfdr.de>; Fri, 17 Jan 2025 09:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD5310EAB2;
	Fri, 17 Jan 2025 08:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ytB8T2v9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E052A10EAB2
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 08:56:58 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-303548a933aso16173831fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 00:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737104217; x=1737709017; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2BRQ6lNkfp8bS79Vg2bjfdOdsHUWBBgAxpLUiozXV7I=;
 b=ytB8T2v9XwjEhBMDdMzv0JSRbYsQQxD17KL8b9DT41cPNRg1DvHlNEB2mJE+L/20qL
 uyY9Lx+GEd7v6mvcHsBd7P//ABdoOXPD7hxP57PI65PgKcV0nmIJ2vSLUaJdgOgpn08i
 A0QjtdBtsuJ4CAXZzHIkj9VZ3s534vRJ0rijyHHaPWSxJT7RlDNevQXDcdTEcujo+EAM
 b1R0ABakeMJcUf3SPovwvQBVDrHuZe/E/AS4PdoNj1xDImoi2qwvaCmGUAspT9YTniaf
 yqpzmK73+cKpu/bBl0zkFf2YugW4eyJkKGptQmJ1GMG7gp+NfUrPKlPIKsHihVQxgYUS
 I+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104217; x=1737709017;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2BRQ6lNkfp8bS79Vg2bjfdOdsHUWBBgAxpLUiozXV7I=;
 b=g5IDcndSpiE03F8aF7BkHdho+gPn/xR41xZFe6DAxfwVZj61wWGxgRQueLAHq8GOMp
 9NMBdmlxJywlRKrNsxtk+Y5ok1e2U8Prs/sn8b8BJdtF4/5XI3c1cgC3HxD3/G7mNnzW
 /rrKup7kIRpbtvcD05gXQrgi5cgrwVjC2Ysvx7lztnLwvQnyzQlsph9lJ2gaX/ENqxqH
 QjI2VHpJeUaLofbEZv6njTXNR5jzC1W1KJr6izNa0ls52v4UN2UT7/qeWujvdL08fwyz
 HAIJu34KF+7GPNwSMkEdLumyn+lOIX0Ngul6UCjdRahQ46C+erh/u14kNreVmTjELGDu
 O10Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX02NkMUuFtPE/ZJx8hOpeEguJBrQmmN+NYQQ21NYipbTMvMAb/2zCeaVxO6X0AWi6HGIjf04LUVWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlofDqK4zD5eXV16N1EeafxCu3f44nBkgzRH9nQm2BwbqeBi8q
 Bp0rSv1RauAJwNV3VHRoTEdORWsyZbrjgfZWdsI1AwPQsiDb8UnEQxPiItDhWNs=
X-Gm-Gg: ASbGncs6ZNZnqj1/vOsGEsTWgNOFUHX8Pc8UC2FtGmQ39PqMvUogrpFm3CeiGqctQKK
 NJ2PGQLa4cY7endYjTizwfkEzHCyqdFZuuwcFx+33YkAO5v/2pPQti+kC9tSg+wxnuq2+HhV5sD
 pdaFk33B6Df0n2SLe+ik/eoGrxl5FI7pigQafnQtUfg9EM5dAvm/kzc5i2xQBOasFx1WmNivaed
 FUFfZ1F0f4r1O+t04W76socbKmGKcGjvLmFKNv7CqCuGj8jPRX4ZS1U5zIJN/PF
X-Google-Smtp-Source: AGHT+IGJKew3iWflBqoi5/eBNb71qdJHpWzyjt6BMF62fH7cdxIvx8zhS7YOn1v6IRPYf1vezlY6Mg==
X-Received: by 2002:a2e:a883:0:b0:306:188f:c0b3 with SMTP id
 38308e7fff4ca-3072cb3cf7amr5794901fa.35.1737104217192; 
 Fri, 17 Jan 2025 00:56:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 00:56:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 10:56:42 +0200
Subject: [PATCH RFC 7/7] drm/display: dp-tunnel: use new DCPD access
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-drm-rework-dpcd-access-v1-7-7fc020e04dbc@linaro.org>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3991;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=W3eVsc55e3ZuouquqjNn9pJNO1JJGFNEugaVYRs9q+4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3qXtJub1UL2OoOXbhcTTBRLmuZej50sKPqoXmSaa94ZK
 xb17lWdjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjI+hIOhklzNU4FVAc5WV5y
 MzwS7eByXE656tX0UOPvT6c+/fpr1sfX1kz/OS1ZDY7WXfT3/1K7Up79QrO3zXH287zXWpzNX+h
 3zb4qNf3xjlS5xQ6uVdOPt5/e8XvlkgLPNLcGy9BUkVWKtXmnD6VaTZVQVZn7uXBdEUvX/ce9Vs
 dDcvUFeTqCX5ZKlu2qTm/qXp7YKn8qrZV5p4+CxUnPnEliJ1fv3LdKQ4p/kY2kV3r22edTzzTLx
 jwSsVZdNsdtao7QjD6jKqPEt/nhO4rYmIQDuR7LfgjLn3pp3bMWv1pfa7W7fGJiPxpslrVLKB57
 PdNl+vdD39QFcuddkzXIcmiWFD2UL/r1zlyBS6vdQnYCAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Switch drm_dp_tunnel.c to use new set of DPCD read / write helpers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 48b2df120086c9b64f7d8b732c9f1f32f7b50fbd..4ef1f20bfe4a0648a92345a80fc6658ab23c5003 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -222,7 +222,7 @@ static int read_tunnel_regs(struct drm_dp_aux *aux, struct drm_dp_tunnel_regs *r
 	while ((len = next_reg_area(&offset))) {
 		int address = DP_TUNNELING_BASE + offset;
 
-		if (drm_dp_dpcd_read(aux, address, tunnel_reg_ptr(regs, address), len) < 0)
+		if (drm_dp_dpcd_read_data(aux, address, tunnel_reg_ptr(regs, address), len) < 0)
 			return -EIO;
 
 		offset += len;
@@ -913,7 +913,7 @@ static int set_bw_alloc_mode(struct drm_dp_tunnel *tunnel, bool enable)
 	u8 mask = DP_DISPLAY_DRIVER_BW_ALLOCATION_MODE_ENABLE | DP_UNMASK_BW_ALLOCATION_IRQ;
 	u8 val;
 
-	if (drm_dp_dpcd_readb(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, &val) < 0)
+	if (drm_dp_dpcd_read_byte(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, &val) < 0)
 		goto out_err;
 
 	if (enable)
@@ -921,7 +921,7 @@ static int set_bw_alloc_mode(struct drm_dp_tunnel *tunnel, bool enable)
 	else
 		val &= ~mask;
 
-	if (drm_dp_dpcd_writeb(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, val) < 0)
+	if (drm_dp_dpcd_write_byte(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, val) < 0)
 		goto out_err;
 
 	tunnel->bw_alloc_enabled = enable;
@@ -1039,7 +1039,7 @@ static int clear_bw_req_state(struct drm_dp_aux *aux)
 {
 	u8 bw_req_mask = DP_BW_REQUEST_SUCCEEDED | DP_BW_REQUEST_FAILED;
 
-	if (drm_dp_dpcd_writeb(aux, DP_TUNNELING_STATUS, bw_req_mask) < 0)
+	if (drm_dp_dpcd_write_byte(aux, DP_TUNNELING_STATUS, bw_req_mask) < 0)
 		return -EIO;
 
 	return 0;
@@ -1052,7 +1052,7 @@ static int bw_req_complete(struct drm_dp_aux *aux, bool *status_changed)
 	u8 val;
 	int err;
 
-	if (drm_dp_dpcd_readb(aux, DP_TUNNELING_STATUS, &val) < 0)
+	if (drm_dp_dpcd_read_byte(aux, DP_TUNNELING_STATUS, &val) < 0)
 		return -EIO;
 
 	*status_changed = val & status_change_mask;
@@ -1095,7 +1095,7 @@ static int allocate_tunnel_bw(struct drm_dp_tunnel *tunnel, int bw)
 	if (err)
 		goto out;
 
-	if (drm_dp_dpcd_writeb(tunnel->aux, DP_REQUEST_BW, request_bw) < 0) {
+	if (drm_dp_dpcd_write_byte(tunnel->aux, DP_REQUEST_BW, request_bw) < 0) {
 		err = -EIO;
 		goto out;
 	}
@@ -1196,13 +1196,13 @@ static int check_and_clear_status_change(struct drm_dp_tunnel *tunnel)
 	u8 mask = DP_BW_ALLOCATION_CAPABILITY_CHANGED | DP_ESTIMATED_BW_CHANGED;
 	u8 val;
 
-	if (drm_dp_dpcd_readb(tunnel->aux, DP_TUNNELING_STATUS, &val) < 0)
+	if (drm_dp_dpcd_read_byte(tunnel->aux, DP_TUNNELING_STATUS, &val) < 0)
 		goto out_err;
 
 	val &= mask;
 
 	if (val) {
-		if (drm_dp_dpcd_writeb(tunnel->aux, DP_TUNNELING_STATUS, val) < 0)
+		if (drm_dp_dpcd_write_byte(tunnel->aux, DP_TUNNELING_STATUS, val) < 0)
 			goto out_err;
 
 		return 1;
@@ -1215,7 +1215,7 @@ static int check_and_clear_status_change(struct drm_dp_tunnel *tunnel)
 	 * Check for estimated BW changes explicitly to account for lost
 	 * BW change notifications.
 	 */
-	if (drm_dp_dpcd_readb(tunnel->aux, DP_ESTIMATED_BW, &val) < 0)
+	if (drm_dp_dpcd_read_byte(tunnel->aux, DP_ESTIMATED_BW, &val) < 0)
 		goto out_err;
 
 	if (val * tunnel->bw_granularity != tunnel->estimated_bw)
@@ -1300,7 +1300,7 @@ int drm_dp_tunnel_handle_irq(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_aux *a
 {
 	u8 val;
 
-	if (drm_dp_dpcd_readb(aux, DP_TUNNELING_STATUS, &val) < 0)
+	if (drm_dp_dpcd_read_byte(aux, DP_TUNNELING_STATUS, &val) < 0)
 		return -EIO;
 
 	if (val & (DP_BW_REQUEST_SUCCEEDED | DP_BW_REQUEST_FAILED))

-- 
2.39.5

