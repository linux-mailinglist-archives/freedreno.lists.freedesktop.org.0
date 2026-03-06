Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB3kGKudqmlLUgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 10:26:03 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11A21DDFB
	for <lists+freedreno@lfdr.de>; Fri, 06 Mar 2026 10:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6183D10ECBE;
	Fri,  6 Mar 2026 09:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NYJVqYf8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D72310ECB8
 for <freedreno@lists.freedesktop.org>; Fri,  6 Mar 2026 09:25:58 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-c7059b9df33so3434848a12.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Mar 2026 01:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772789158; x=1773393958; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ewHGacURbR5hWeKGyZInp1e9Eq3/0vuCV0I4zH6dBM=;
 b=NYJVqYf8axiPKJtBGPsuwGwiUCpeee7I/Ht3MO++LSE/LkuOzKRLnvVF/FfOq0GpjD
 w+acskFwb7Ueo4Pp/sw4FskAOUSQg95KmO6Phu9Tc0N3jjAulCThwalKfVhNQibQ0iNQ
 JlY0tJuai+PgICun8WBuhJSC7W9vZmvh4YesalrFThLwSbVzFDcHFCIwZP9SJhVer19L
 bE93j9FpMrebINjEYy+YYtUU8WfQh/7FigUkuVs8dh0YloK3Tw8CQ+85Ity4/xNFCkAb
 7pCs2qmFvsjXzKVdf1fJot0kDUmIc1uJDQz50AfWOIIrOu2+az5OXmOXx4iTjMWRn59z
 0ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789158; x=1773393958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ewHGacURbR5hWeKGyZInp1e9Eq3/0vuCV0I4zH6dBM=;
 b=LAi+YcjMmZiQXbfYQGVWPLY6ai9+RXclHTPVUVkk8PsS1BPsChYIQOZ9gffFZZWbOb
 zc1QuRWoagpaBYarL3jp7n5Oo2UNtUgM4QY5MYEtWN6N2RUlt8ir9BJUkhg0yHrb/BOb
 zP029m6o1TK5C6UnQX2U6pYWy3z8ZwWbsCqCj5Rzw50otL3dcWQD7rNjo3uy1e9aPXHk
 2BkJ+7qURrlGhlXjqaiPFP8E5zF4I/u1EfsvmN3t2yiXS2C3bbuGvjcpvTJILrDxh0vk
 XtP4u9nSzqimK9vL/IpdtPmaNoCO+ELTVY1KeDcbme4fB3E01pU7QpWFLWo3eCYv6bg8
 irbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCURTlrsESqF6uviw9qkv+mypk5UIC4uRnyyq04dD+Rw9k/4TPfn4MfDaaNbknK/W3eKRCZQL/xa1SM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxar+nM4zR4/zSn0sG7yJ/mzHeZ3t/IDs8hDdheKK0YAYGKZlT
 0ZxufAY12vhmyHQb7NAlqWz6zCvQzqcJ/ZTzrc3+O+K36o3lQYz+iCwA
X-Gm-Gg: ATEYQzwwfLa+BG/wLltyrnRXM1fEpBMmRbyqyM8WT8gu3xWiAO9hvQErWp2bWZ2abeq
 XcBpv/6s7vPL5CCzAC8QrxQ21aGJSJQN5HrlWBSTdLiaVKJpCuVEEFmKCm+1p+lN/pSZX/DRrqo
 4nHVMqPmg1C2nfH/H2Y7vlh8TArR/gdcVRPgS6iMYqubpudUVKyYNWaSnxc9bf4ljYO0apOKCf0
 +lsgKEW5z3pUB+quoBzQQnL2IiVABXHKO1O/fAOus6+dB3Pd+UpmF9QXMTu7yQk+bqThEMd1eHH
 L7VxcvTSyR2nPGQ9mqqZwSuZfM9qy4sn/uNhp6BVrYHjreeNsP7oezTcuhxGLwqjdbgroyPFEI4
 NsfUF4sJei4S6NDZ4sBinVwSn2pTHID6t0R6Kr2TDYhmZedRkKk9GptjYbTyP+awgyRuN/PfuIq
 2ToYQ+sclB4v8G1O/6QA==
X-Received: by 2002:a05:6a20:cd96:b0:38b:e8f3:7065 with SMTP id
 adf61e73a8af0-3985a84978emr1449373637.19.1772789157619; 
 Fri, 06 Mar 2026 01:25:57 -0800 (PST)
Received: from nuvole ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c739e195c40sm1021673a12.31.2026.03.06.01.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 01:25:57 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Eugene Lepshy <fekz115@gmail.com>, Danila Tikhonov <danila@jiaxyga.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: remove bpc > 8 entries from allow list
Date: Fri,  6 Mar 2026 17:25:00 +0800
Message-ID: <20260306092518.37849-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 4A11A21DDFB
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:fekz115@gmail.com,m:danila@jiaxyga.com,m:mitltlatltl@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,jiaxyga.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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

In upstream the msm, for bpc greater than 8 are not supported yet,
although the hardware block supports this. Remove them until we
support them.

Fixes: b0e71c2637d1 ("drm/msm/dsi: Allow values of 10 and 12 for bits per component")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e8e83ee61e..b60b26ddb0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1824,12 +1824,9 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 
 	switch (dsc->bits_per_component) {
 	case 8:
-	case 10:
-	case 12:
 		/*
-		 * Only 8, 10, and 12 bpc are supported for DSC 1.1 block.
-		 * If additional bpc values need to be supported, update
-		 * this quard with the appropriate DSC version verification.
+		 * In the upstream msm, only 8 bpc is supported for DSC 1.1/1.2
+		 * block.
 		 */
 		break;
 	default:
-- 
2.53.0

