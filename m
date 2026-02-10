Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VMD3F8aNimmwLwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 10 Feb 2026 02:45:42 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB9411609D
	for <lists+freedreno@lfdr.de>; Tue, 10 Feb 2026 02:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E80E10E4A0;
	Tue, 10 Feb 2026 01:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oox3OpFW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD5E10E49E
 for <freedreno@lists.freedesktop.org>; Tue, 10 Feb 2026 01:45:38 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-89473f15ed8so2951996d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Feb 2026 17:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770687937; x=1771292737; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=elsS/kGMmD0OoEVMgvfZiiYPaJsOWDl9DHfN22z7daU=;
 b=Oox3OpFWdx/pQbi8JLifIfs2s+RrTHItTGDSFPE/CuiUptN2Ltt1YxDTs5MdQh68Tp
 5mxgX+B7s2wz6g1Yu0NfvxzBquZ2tZIRd6XR4ja9ZZOw9d0clkCJf0rKCaxmMq31PVq2
 xQBxl82XbxRQiZczKr7iCSyozlELRZWsnyom45pdmh+zyC34+jI/bzuPQO3lIxHMoiXB
 lsEaEJhbRjxZxCExyaiM8uSpsdm0/9fc7QthHzoTtC7iI8YK0vMXxnstCYKJKBAh4NMD
 F0GjKf8TyGMB9kaFfWpUdvYOaGaenFlcCbIPd+YVxH3Jby0sv2kgGDR1Q+Bxe0LpH9AR
 Wg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770687937; x=1771292737;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=elsS/kGMmD0OoEVMgvfZiiYPaJsOWDl9DHfN22z7daU=;
 b=xDJrzl8gUA1Uj2dwg7UZqXaZqHiOPprZhfY5dgqNU+1XGQDqYWOcck3AlsisP5Nl34
 VkRRLjAc/peY04f3FCeeTKA3GlS6u4OQvafCmLyujeLHDoQVFUiy+CUqMRQKfk1/5wQG
 Tt++7DmiwYIuOMH1vKfZzTFGtXYAQR/fkINwweKYROTkYb1LkgLUAqEZp9z5SOsdoJD6
 toP6gq/UrLe9Yz/vIX3ZDA/iftk0zoQlDH1rM7BSUvczH6Fb491xs1k+87ov9kVQcgox
 /nVzAdJlzRfJyxrVhKopFhqnrefG9DsU3APxtrg8SQOEFPTasIKTRcFgWUcq7DTzrvIm
 ijGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFmppGiylL9BdsC4lrFHjVlvr6O/7+SPNWkzwClYJavPiqgDIaEsX0InsVRlkBrflEEn4XPEm9Ytw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYc2NBxInyX1Y8xfDQt5fchpsoPbBk+rzSzk7AA5EAmKAEqVcu
 Dp0de9F2916D3Tqoeq7EujFn5QUpB7iQuC2hyn5lwCpHHHYvl0NRw5e3
X-Gm-Gg: AZuq6aI9+qy+PhLfyFUpVRKUpOpdDXh8cM0foi6d5dTV69S0t/JKAgg5Z1sauxfSG59
 vCGhXLJcuOfYinD24uRHZHUF1ePVtUA/hKefMpu+nq+3UNzZVdBWg/u8G8IXHQOw2Y4dYIzC2Ae
 znkWgobfIPPjAw6JVxt22WdrRBYsEIt9emqQTH9cxRHEonDV3dGYbxK4jAY479nE5Oo1h7a+A7r
 vCN5wYOE6AzjeBezBRcNwWnzxYruIoj619QXbcTkx+nKjChX6EewfUogu8kmWSOT9PaeRcXh4Fd
 yqLe5nthA9IKJu9Wbl8wUk8W13avXreeXcRwS9GBTnzrSgk/Ti8F6nvlZ5OKTfjTB0X2zCKd/Qc
 aZHvZWc+svR0XB2UcahbulK+LSKTT99PirOvQqORhqEf7av8PSWKD/i/1RmfEPW0lKLIS3bIad8
 G1scukVdydvQFSFmY6X7OBvPBEeg==
X-Received: by 2002:ad4:596f:0:b0:87c:2967:fd32 with SMTP id
 6a1803df08f44-8953c82d263mr190898256d6.22.1770687937497; 
 Mon, 09 Feb 2026 17:45:37 -0800 (PST)
Received: from localhost ([184.144.58.243]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9a15969sm933984785a.34.2026.02.09.17.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 17:45:36 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 0/1] drm/msm/adreno: Add A615 GPU for SDM670 and Pixel 3a
Date: Mon,  9 Feb 2026 20:46:02 -0500
Message-ID: <20260210014603.1372-1-mailingradian@gmail.com>
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,freedreno-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BEB9411609D
X-Rspamd-Action: no action

This adds support for the speed-binned A615 GPU on SDM670.

Changes since v2 (https://lore.kernel.org/r/20240806214452.16406-7-mailingradian@gmail.com):
- drop applied patches (previously 2-4/4)
- specify that this constrains the regs and clocks (1/4)

Changes since v1 (https://lore.kernel.org/r/20240730013844.41951-6-mailingradian@gmail.com):
- add Acked-by tag (1/4)
- add OPPs exclusive to some speed bins (3/4)
- enable GMU by default (3/4)

Richard Acayan (1):
  dt-bindings: display/msm/gmu: Add SDM670 compatible

 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

-- 
2.53.0

