Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xjBoJto8oGmrhAQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 13:30:18 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABCE1A5B11
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 13:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCC310E915;
	Thu, 26 Feb 2026 12:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KESKtbb1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5816E10E915
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 12:30:16 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-bde0f62464cso312059a12.2
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 04:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772109016; x=1772713816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NqcwDzw5HN4ZLQrwd1zkwQ8pFoXvNQgRaA7hrn50J+c=;
 b=KESKtbb1iNloUxAiP3YW8eJqVxYgf2CjN8J5muQny6viLVSmvsODaEqE5qMKfBRP27
 9edsutQCNOstKY0YPrFBKXJ8dZWOQAcInAV3Me3cyJB6pmwwMqWMezkzfONKiKQvVp+M
 Dv6FEUavM6EiPNJ3X0fUkmhC3ZUe2lxRQMQ1F44f0RqL5MY8q2Hg2OLYc57t26nG0bAp
 jJzZ1hkKT7QTub+1RnzL76weJm7xoa6m0l4bzbNsJ1JTJo2SKLOZ/BWq2NUaK6iVVcIZ
 aVLbMjf/rb9b6CU3rxeaH1gvgs/vXeK1N7/inj/sNLsJOwDWxB6JmUjDuWnA4nRghp3m
 Dk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772109016; x=1772713816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqcwDzw5HN4ZLQrwd1zkwQ8pFoXvNQgRaA7hrn50J+c=;
 b=vvDXiC1tK1JG3RKZXCwWD9J/g5Sk7ub/C3JQLyQJoQrbz3U8Hnwv26yvSbaBUnvm5X
 20B9Ta5coGnffi0bwdXy4vawtRNHF1Y6oakX7UwlYAG8+Zimv6hag3LVICtHLD2k0dH5
 cBo42ndklwnqSgq443F8Wcm5dnE3NSNvFqO2Rtoqrt+u5wn9y1pZumk/Qx+/oITXLKy+
 2i8wlO1+WFEcYD/MWlnjFuiUlS+b9f1nMbCi06munYEwUDhBoaX5W1Usm2Ssn1AdNl+O
 kvF4tNLy2BWY7sIXa40h9BQCSx2ljEO/uGPAuMpmEeSQLYHOflvm31pQ1XgawVR94+S3
 p4EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm0P++inAabQ+Vzt8uM1ocanpIBa8/w1RyjeFgIV60uXySWEADVKBO7FhrK/4PlTcDYGtysXlxiiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxreLG3EyD33Ecpi6Z772IDQ1s89SLm34w82sZC3MeZWVfRUGkX
 +Z1KT8ITRblmnPEjv5y2aQx3CAnYGWMVc3TsUqQRkCSGxOGcTcE/lO/W
X-Gm-Gg: ATEYQzx2nJ3TtwdetE2HZSZaEVuf/dkmrzSZhi48r/pbOamvw3ZHDXhUnsV5VcjBPiG
 XPBhVjFoT8aW29qY8ZDcZsOhSIaGMtSyt5jHKId/o2/f8K36swAEKsn4Wq5y2YZUfuadCxxiJ6c
 BBfhqoEnvDzI+n13PXjt6g1gZVQWvRwL4lQkXoQgaUmuoDrO/ID5NZKbbkLjp4bGGZeCHPSXPh5
 diOH11eVnSmTdCOfa4ws1tFTBNqB4LuSG26gw7jFmGyljdA2lWkglsJpE1UoTERhckf1/Fv4OaD
 aVDEdRv0tuhC1f7d7lxxgVLaEOIYvoBlsrtCfvkbEs4RnhaFjweO9Zd8mCA/cpoeg7tOICHiIK0
 PGu9ISqa5DnH/h8+eOM3AWq1pt5DjeF7He2fuibirO3d7eR5VXLpwZZr4SM7knkpE6uDe6YouP6
 udo7H3rg==
X-Received: by 2002:a17:903:904:b0:2ad:b98e:35e9 with SMTP id
 d9443c01a7336-2ade9a8ebffmr39412815ad.45.1772109015647; 
 Thu, 26 Feb 2026 04:30:15 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a17:8230::c83])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5b22e7sm25504125ad.3.2026.02.26.04.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 04:30:14 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pengyu Luo <mitltlatltl@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/msm/dsi/phy: fix hardware revision
Date: Thu, 26 Feb 2026 20:29:56 +0800
Message-ID: <20260226122958.22555-1-mitltlatltl@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:broonie@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1ABCE1A5B11
X-Rspamd-Action: no action

This series fixes hardware revision for DSI PHY. No functional change.

Pengyu Luo (2):
  drm/msm/dsi/phy: fix hardware version
  drm/msm/dsi/phy: rename DSI_PHY_7NM_QUIRK_PRE_V4_1 to
    DSI_PHY_7NM_QUIRK_V4_0

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 38 +++++++++++------------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
2.53.0

