Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E4PFtKdqmlLUgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 10:26:42 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C129C21DE39
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 10:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94E710E20D;
	Fri,  6 Mar 2026 09:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bxXPm8M+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5298110E20D
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 09:26:38 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-35984cd0335so2482169a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 01:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772789197; x=1773393997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GASaaeIc7bq6+Q3h14hRV19dPYKwOXv/nhaVWKzPPQc=;
 b=bxXPm8M+KPW3IQVI+WoLh99GtIMT9Y9kLchj4LFfhx8nLPq4rXVWbQFweyk0AwGdKK
 j+itoUsKsZjaV/rJH8WNG/VtU0+IrHE9e5CP22dwksT7N5czIt2RmA/8soEceDKdyHs/
 MBo9WlLmcmcwZ85xgrpqw4jWLiQai2JlFXLFIp+r8L00BBgpzvBL2997gWbs4OXZ3yOF
 x5vMqFkfyGwh2alPQ1NrQorihrAfsJisYoQsF081xFZ24qL5dp3vsKhdjoglPH8lgIj+
 t8G09F249QRdZELA18usFoykX49JNQY9vDaAK4fOtydIapnVLg7kqX42NrpxHZ+i2+G+
 4Wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789197; x=1773393997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GASaaeIc7bq6+Q3h14hRV19dPYKwOXv/nhaVWKzPPQc=;
 b=jfX5LeFIBH9WkWDWQ4rnFT0jk2RQKpRumKQyVbtZ5ZHhrzq7htPMAowm9HsvPst67j
 BGgqSR3LopYdmj28pK+KMuDuxRqzuUIVUzMvPOVDV+4lfLEpw4KSmKJzAdp9oVkhvJCn
 XGBoEISCtXPnq/oSnDyAKoc6eF8BBj+/g4ju8+e2tz5VJQBKSFmON2Uh1ddI+yYZPdDG
 K+8RmGJkHnWCUFTbrheRGpjoXquVIG5YpDtzYwF/FjSNFzZpkaDdGR0bv+rDC/dPb3s5
 KqzwfFA9Ebn6Z8c0bE9CAtm5MOVrkJK3WKMG+HR4KEfut+Oo3NR+gI+N0PjMm/gVeZ+o
 tg8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCULSOaL8ltjXNyQtH26sLFL0z8KxFzvLiH0LhTyhNKVjr6J2UWto7X07QryinCR7UMFNifEjo7+ua0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/tLZe8iaXyR3h3yO6QGUkhUarOIWG/+ifU8fgPYgQjUXNzQis
 c2T9kn7QgF+l4Z+ZQN+KasLF2JeViBCNm3Zop9WVZwihnvm5/2+/z5Jd
X-Gm-Gg: ATEYQzyUz+2/yRfiu9AmmcvbChJwiUqPLLrdw5vs7C9AcJWoGmJ6kIsF2VTQwj/J16q
 E1oHaXt1uXV6yV+LYcRpIndi/tK1ZxzCjNw6NHoR1PdpR55VfTZmyz/Aui4doM1wkxEoaLhpFDy
 Po247lQdDaCoHDCkQK71ohrUYOkJnaBRhsZtuM6DEjCydqZ/n+TWgOj3p0mDeQuxjylxss/rHnY
 vuTtopLkMWmNrbauR41t0U93FbRhUeluhfx+PqVVZxuKpj44c7ZtcvUVj7HfuVkuHyvmgwxoH0j
 sX7G56E3Ghw9GP0TE8dtK5iqR4u5MEmXfCpyzub3J7OwiobH7lEYEadVRWNUYVOawbkbQf3++iL
 A0eQcp/NT9hdVT/Zs6n+qhv9+q8CD2bGcuiexhwv081CYsVOjmxb2S5rERFyHwC8P53ZgCNACz1
 uDmnkEdIeJn//XQjrqJg==
X-Received: by 2002:a17:902:d501:b0:2ae:6163:345d with SMTP id
 d9443c01a7336-2ae75b4e528mr47926475ad.12.1772789197338; 
 Fri, 06 Mar 2026 01:26:37 -0800 (PST)
Received: from nuvole ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83e57afesm13214405ad.6.2026.03.06.01.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 01:26:37 -0800 (PST)
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
Subject: [PATCH] drm/msm/dsi: setup RC model properly
Date: Fri,  6 Mar 2026 17:25:53 +0800
Message-ID: <20260306092553.37973-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: C129C21DE39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Using incorrect parameters does not seem to affect the display, but we
should use the correct in accordance with the DSC 1.1 or 1.2.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 31 +++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b60b26ddb0..276c63d2ac 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1843,10 +1843,35 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 	drm_dsc_set_const_params(dsc);
 	drm_dsc_set_rc_buf_thresh(dsc);
 
-	/* DPU supports only pre-SCR panels */
-	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
+	if (dsc->dsc_version_major != 1) {
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "Unsupported DSC version: %x.%x\n",
+			      dsc->dsc_version_major, dsc->dsc_version_minor);
+		return -EOPNOTSUPP;
+	}
+
+	switch (dsc->dsc_version_minor) {
+	case 1:
+		/*
+		 * For DSC1.1. the upstream lacks SCR parameters, the downstream
+		 * parameters are unverified here, we support pre-SCR only.
+		 */
+		ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
+		break;
+	case 2:
+		if (dsc->native_422)
+			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_422);
+		else if (dsc->native_420)
+			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_420);
+		else
+			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_444);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
 	if (ret) {
-		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters for DSC version: %x.%x\n",
+			      dsc->dsc_version_major, dsc->dsc_version_minor);
 		return ret;
 	}
 
-- 
2.53.0

