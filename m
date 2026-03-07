Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NGuCOl8IrGkYjQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 12:13:35 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A422B5E8
	for <lists+freedreno@lfdr.de>; Sat, 07 Mar 2026 12:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8924910E260;
	Sat,  7 Mar 2026 11:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JfIhcCzd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D188C10E260
 for <freedreno@lists.freedesktop.org>; Sat,  7 Mar 2026 11:13:30 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2ae43042ea7so76236265ad.0
 for <freedreno@lists.freedesktop.org>; Sat, 07 Mar 2026 03:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772882010; x=1773486810; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/gabd+hFXfCNsaU4VsDDssNuV3/DePYzj6ege99XJmg=;
 b=JfIhcCzdtriZbQF9KRz4IXnWCE1FGXEs1YY3vQ5TIkiN5Wje5LuwMihvaMa7hMsCTk
 FxZIDNG8RhrvX01lL+ntcy5+FN33frvd5H87RLWwBmSs8j3bE4PHtBhyaP4gjXIHsV/w
 I1Iskulic6Xj/O0WzbqFxaEtzTPlICwb8clf/TOayaQlG1iXWEdZ9LvLrVYG97239SjD
 wUWHaSFxaS5HJ3T5UCDV4py2RTsKMv/fxfAzcOODRQVApBDmVHl7B9iFhsVdRYl3SAUF
 8JXUnXWY7L+C6D7F5e4jQVDuFkWfXc2A4AMECEonI7gVsZajWoOFbH/STJtiqwjf/oA9
 KZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772882010; x=1773486810;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/gabd+hFXfCNsaU4VsDDssNuV3/DePYzj6ege99XJmg=;
 b=P7SJ5oYSW3mqERcZROnFO8a7wU59/xDRgwrYqsz0UUsZc0mNWeQ4F2mbBalgcyn/AS
 AYOckQopCejlvo5Ol/BTVyASHDgQD8rnVHDsxyqJNEHCVb1Lt0LqficfFvs7NY6jQvzm
 1GisKe2jI6dYvXx+etOR40oO/NcsQEb+WLKnY7rHiZxu48OC5Hcg1jHN82CTOX760YcT
 ynZhLSYV7Tu3i2BrH0q+OA0pI4VrAQlcahuiUijimmPkfDgF463ERyTdUNNAv3hihmbj
 x3hEUR9OfjAxj3qVXReaPs8Wg2Re6xjxmdOX2nXkpNhXNsOpFo7HK05M+cEAQPy14pl0
 jENA==
X-Forwarded-Encrypted: i=1;
 AJvYcCViggj+rhSHSLbdKXENVNCuFlCMbE7CZO7r9tR7DMacbiOEWdKE4Pwes+ca8I04R7DhXevTkyNqO0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzChiZlmpx8gYpFG9GvM5VPvAK8BU0EqRAPqi9yGjU3i3pNU3WM
 V04RqKSLyrIGbkXlQpE962BM8ZFOfQlHFasgNnyhTSfKpG0N97z/Rw7u
X-Gm-Gg: ATEYQzwEgopP/E4rjQ34Tfy1pWoatAtmB+4cOChLIvDonu4/rD0THnJ/uacsL0d8yWS
 LknqX4geiASguknUEFYv69zDKekKzpUXunhgmBpbB6dSCcDigbiPn0u09j7RdGEH36Y2JnAOjTS
 hsifjvv1UdNYIu+Gg/JR7xJNxHr+yORDZ2NSO5ehkg67gA6/pzwcyxChOwx7/3tCQ5T6UyAnUs3
 09oQHZ94vKpHpXRq+rQ+2F8Bz/TYyMDeFZ/rutojRl4neaT8TAnGfA4RomMPhl0oiO01FwDoN45
 MBli6UfgxzwDE5suJOm7Nj1RyikHK4709ejlvZtgJeJdKqeUnd1IsA4HLp17/WNAvisbiq/fS7f
 coB521Z/1FcHuAAFbBB/hDuP1tYvHP5FG1P8xiS7IXjBVZdvprbKneR/8AmZc98pMPAW46p/j4Y
 tRFhmRN/UMjjRNyuw26g==
X-Received: by 2002:a17:902:ea11:b0:2ae:54ad:6057 with SMTP id
 d9443c01a7336-2ae82476956mr55642665ad.44.1772882010239; 
 Sat, 07 Mar 2026 03:13:30 -0800 (PST)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83f74e7bsm47350265ad.46.2026.03.07.03.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 03:13:29 -0800 (PST)
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
Subject: [PATCH 1/2] drm/msm/dsi: fix bits_per_pclk
Date: Sat,  7 Mar 2026 19:12:48 +0800
Message-ID: <20260307111250.105772-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 3C9A422B5E8
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
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

mipi_dsi_pixel_format_to_bpp return dst bpp not src bpp, dst bpp may
not be the uncompressed data size. use src bpc * 3 to get src bpp,
this aligns with pclk rate calculation.

Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programming dsi registers")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e8e83ee61e..7c16216e8b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1030,7 +1030,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 */
 		h_total -= hdisplay;
 		if (wide_bus_enabled)
-			bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);
+			bits_per_pclk = dsc->bits_per_component * 3;
 		else
 			bits_per_pclk = 24;
 
-- 
2.53.0

