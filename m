Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDolBmQIrGkWjQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 12:13:40 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBDC22B608
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 12:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A85010E354;
	Sat,  7 Mar 2026 11:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U+oOPbng";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30CD10E354
 for <freedreno@lists.freedesktop.org>; Sat,  7 Mar 2026 11:13:36 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2ae4988e039so45388035ad.1
 for <freedreno@lists.freedesktop.org>; Sat, 07 Mar 2026 03:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772882016; x=1773486816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RfZvykbj+Munv01zyroOwx0N1ICA5mAYoReNuZjedZg=;
 b=U+oOPbngC1sFiQwPwBR6ghgqctUS7IO9IQXEUwGgteTmk1QNh/g8cRj02RAM5xU2nv
 WbN5C87tirBeN2abnmK80+OYxiOfORpox532LUmSPPXAlvUn95zSpfOwiUNmdfuTqdfE
 QnuEXLoVVNcrWxfQph8jGF5G4KDC4hvAvH/7exSK5DIokuE7GTE1grYsSOAY4HRRSKZH
 hK64Jf2mTHJyXSXxD1DiCnLIjv0K0EfF+e7KaI29mHnWj7OHuCOBjDLuQRgLgOhfeTBu
 rNYeRw6y9tlYXcAzh6rFKB5/Gf9oIsfQNNKLhNtrYHjWvWTLhYc1xSlV5nrM25JdSVH8
 J2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772882016; x=1773486816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RfZvykbj+Munv01zyroOwx0N1ICA5mAYoReNuZjedZg=;
 b=wDdiFprtWu+X+DfXtmhShIDSft2iQKhvDOz0WFkAygxpOqZ5XTUA55N9L5MwL6fZYO
 d5wY/hXhZY4ZI4xhpY/4QWdmJfGnhRUfXORIM79rjCGq67u5sGXj5MkHY+WZz74OepKq
 HPVHUIQ9bZVKka1/z+Yoh6hl/EOZxAKqTzE3kqsc5uHEvNokvdlEv2siiBXgBffOd7BN
 Nfaxwv5D2KfXjElaqtTm64Nmv4nWRtKphgkd4Q0/4gUSVDiaYVBSyqwfzfNrcF3vpyEd
 /fgeXR8jo30GYUOI3stUH772OJU7Eq+R6cirqVc0sJ1zAJs0yZFEaXCz5MdL9qfnjVbv
 ImXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg7dJyZL6CgPT9RI3BrAmFouTmp2klSOT36IgiQfdeLNLmihCcaX0Tc3D3M/MjjEecuixsGtipGEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKm7A7lA8X0PTIP6r2NdkSYVtvqL/PTKppqVL5TTD86gqVSXKl
 R09qpzHjFca9xO7jJHxECeqRM8lvFxDs16UkDvzKIihItfh0UwFKsBQ6
X-Gm-Gg: ATEYQzzemsEAb+wKzFQ/7uURIvstJd/PNf/VG3uSXfcXmG3sP9Sb6Fqux9Sy7/CiiuZ
 a0CLheh69xq9od/2PskPKM2wOZHtfwYvN9BEuu9Y3YXZxlkpIs3bf3MnFNS9KxSX3dWDbmaA7YC
 lSNb93ND14wZWDjYxM4BkJyoFedNKhckovafUipIxrriUKYMhNzMMkTXTCUngesXH2HCog4e5IB
 HIqRTSn2lvsbGEv1GukEu7PBCmg2zWxLj8t2+Z5G9+A1sxiipecbjKAr3zbpv7h+jYWYYZffaFM
 Nfkp4wKnhXKbH0PDc3ynflYK1tIJgg2eoo4McNtiCZAC2VC+EnV+3zilB2CKkZ9VhBOPbwq/0W6
 SJzqiczspbGLpR1jMLscEElTkY476DslDx7LCbr7suC7d48hjQeOwTnBQhS7+dTLP/QWQAVqMwR
 iHYdg+0y3OzHgfmKTrxQ==
X-Received: by 2002:a17:903:1a07:b0:2ae:5d90:9d95 with SMTP id
 d9443c01a7336-2ae829cdecbmr51388105ad.14.1772882016362; 
 Sat, 07 Mar 2026 03:13:36 -0800 (PST)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f74e7bsm47350265ad.46.2026.03.07.03.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 03:13:35 -0800 (PST)
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
Subject: [PATCH 2/2] drm/msm/dsi: fix hdisplay calculation for CMD mode panel
Date: Sat,  7 Mar 2026 19:12:49 +0800
Message-ID: <20260307111250.105772-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307111250.105772-1-mitltlatltl@gmail.com>
References: <20260307111250.105772-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: BFBDC22B608
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

ac47870fd795 incorrecly broke hdisplay calculation for CMD mode, fix
it.

Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programming dsi registers")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 7c16216e8b..f63165c7ce 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1016,8 +1016,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		/*
 		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
 		 * enabled, MDP always sends out 48-bit compressed data per
-		 * pclk and on average, DSI consumes an amount of compressed
-		 * data equivalent to the uncompressed pixel depth per pclk.
+		 * pclk and on average, for video mode, DSI consumes only an
+		 * amount of compressed data equivalent to the uncompressed
+		 * pixel depth per pclk.
 		 *
 		 * Calculate the number of pclks needed to transmit one line of
 		 * the compressed data.
@@ -1029,10 +1030,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 * unused anyway.
 		 */
 		h_total -= hdisplay;
-		if (wide_bus_enabled)
-			bits_per_pclk = dsc->bits_per_component * 3;
-		else
+		if (wide_bus_enabled) {
+			if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
+				bits_per_pclk = dsc->bits_per_component * 3;
+			else
+				bits_per_pclk = 48;
+		} else {
 			bits_per_pclk = 24;
+		}
 
 		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc) * 8, bits_per_pclk);
 
-- 
2.53.0

