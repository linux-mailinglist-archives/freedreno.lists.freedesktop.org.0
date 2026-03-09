Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ji1BPKarmmqGgIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 11:03:30 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58332236B42
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 11:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C65010E4C5;
	Mon,  9 Mar 2026 10:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MIeoiIUS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B21810E4C8
 for <freedreno@lists.freedesktop.org>; Mon,  9 Mar 2026 10:03:26 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-829a9c03780so2523081b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2026 03:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773050606; x=1773655406; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9nlwmWhwIXO0X3Jk30jSEyo+dFAjP7rZs6urd0jScw=;
 b=MIeoiIUSPNJ9I17uczqWq93HQkEllrE6gQD/cj8tyKcayiPaAAzD0vhEdB+kIPi9HI
 PHuzqOn7r4pQGJ7WnM18e4+ajw7eo1Rw9k2sfzLS6dkMzqp8jygHH5n+jMSnhCgrLSRl
 wxumFca7ZdWHHS7AwVZT2fb4ia/JfuJvkJ8FHeSl395Rj3sTtVetIpSzyc8P8CKTCrJ7
 9c/M/p9UfO2cwLN0GLcnQWDos98PMRt6k8zEKVUo759syqAQ2Kmti7ER+kmwFI1W6Cyy
 bFScAByeVBe6XIbLK7HJIPnZLfv2DAJoo0L4On//SNDmKmmFWvLvcvYI1NFvzlg2HnBK
 jbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773050606; x=1773655406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z9nlwmWhwIXO0X3Jk30jSEyo+dFAjP7rZs6urd0jScw=;
 b=nH9AjprGDl7uUZ1Alb3I4a4jXCj20lRX8CzVUZH1YbRPoiUlBPh6lNniDaa6LmaGuT
 wDdi7ABynPVCt5OZcW/0FM6QMaknRgAltoJ4055elcEjOUZPV6Hck07hJtdAgpGr8W58
 7dMJT+Q7NShdgk+jm2b3OqHUfcz5k+eL5DMq3tOqgoQEc9nqnf5C094Y+SDTq40tRXGA
 e98+dDa9WhfnGubO/zjyD60arHvlnw4HxneU193c/ylg/lCzn2hQqznFYcpFFFGkUXOY
 S9J2md+XItxjicfNnjAG/lSsuX/A5uKGdWrznueMZwdHhBUtaA/WHPNeWt/6JqELm7WQ
 z+Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHCtaEZ0NMGqQCLRSTdlIDDbIytDZr1R6YKGPElzO3ZhwZ6BwlkVfvz/wPGqeFiTGFkiFWGivokV8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+7j60R/Vg11o44zLdUaErZR//in/+KvSfqkAShNlrgnhTjay3
 OyyCTM/sYpfYEjdNygCWTwlXbeof7mzNjNIDkDJQqUlSpFD09Sdm2M1m
X-Gm-Gg: ATEYQzyaUyhEupsHkB18Gz/SkKxHLO8PSna1tc4m6bIJU4+sL1P4fPvqwuZQsjYvpyj
 k2BAfimCd11oMxxy5eqZ+Cj4w0YExXKQwPSgm8PvgFk06MX908XKWcKcTpT9p+ZLFK1re218e1M
 g2DGgn6Y1yu5hTzA+YwFH2lco1AJTnxLsbDw6tWpXt64rTtynB+kFwYI33tlHFR4GNDSGtSQY92
 nBVmnk+2yRa/6/6QUjqTDKrSF+6sYgkctNnBmj/yUUPVbJTBoxW04ov6XR3CqoJnTyvY1ustUNX
 XRDHG+ssw8OkorxaXZvjiOwTq0abGrnYUrJoot6IDH1Lf8+2hWoVH/JzonMciQLIUp/I0+zxrA4
 O2pf0OM+/RaP5PGmHhZrXfh5fed2zW+tYYiMHucBqPrp1LE//Cyd174Che+2Kz+LFaEEJ9jMlfi
 7+NMT9dP/YGBj98CaOPg==
X-Received: by 2002:a05:6a00:7487:b0:829:82f1:8bf7 with SMTP id
 d2e1a72fcca58-829a2d6e341mr7386135b3a.11.1773050605584; 
 Mon, 09 Mar 2026 03:03:25 -0700 (PDT)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829af8695cesm8147353b3a.12.2026.03.09.03.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 03:03:24 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: add the missing parameter description
Date: Mon,  9 Mar 2026 18:02:53 +0800
Message-ID: <20260309100254.877801-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 58332236B42
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:mitltlatltl@gmail.com,m:lkp@intel.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org,lists.freedesktop.org];
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

Add a description for is_bonded_dsi in dsi_adjust_pclk_for_compression
to match the existing kernel-doc comment.

Fixes: e4eb11b34d6c ("drm/msm/dsi: fix pclk rate calculation for bonded dsi")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603080314.XeqyRZ7A-lkp@intel.com/
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index db6da99375..6cb634590e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -569,6 +569,7 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
  * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
  * @mode: The selected mode for the DSI output
  * @dsc: DRM DSC configuration for this DSI output
+ * @is_bonded_dsi: True if two DSI controllers are bonded
  *
  * Adjust the pclk rate by calculating a new hdisplay proportional to
  * the compression ratio such that:
-- 
2.53.0

