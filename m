Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPZ9IEPBomls5QQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 28 Feb 2026 11:19:47 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5171C1F10
	for <lists+freedreno@lfdr.de>; Sat, 28 Feb 2026 11:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C3C10E033;
	Sat, 28 Feb 2026 10:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZszLo17b";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0279D10E033
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 10:19:44 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2adff872068so14504025ad.1
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 02:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772273984; x=1772878784; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRVqqul3/pfy5o1UTViOLOTR76RCMcD2+rnW+WmI/mM=;
 b=ZszLo17bTWKrf8G5Ev6mFHPPBwmet2D9xCVXgNJBj4xy/e/y29NlldjCtJz0ogh+F9
 zSKAFkf0bFA2J0ocvJlYLZKQP0/e4wyOWgIzlcM5CaacL86GAy5xR1GCAbb2i1QmnSlY
 2CbMVHp17EqcAfv7t/Teo246RLw5xNt0QcWvVdCwpocyfU4Pb+1ezwRyrnVJZ9ZSYiSX
 NGkrGW5wjJV37QPnm1GulxA81hS1iiplIeuQCGASBrekggN0Lc3uwK6xWOelizSFY5R7
 6lD9LE3ndQJdUgFBFifyG7RYDjKL5qmiQ7tTs7zzcT2+lcFw+dg65nqdY+lBHbaLaWWa
 Y2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772273984; x=1772878784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZRVqqul3/pfy5o1UTViOLOTR76RCMcD2+rnW+WmI/mM=;
 b=JHftbPUhuQAmVjID+rmM1hcbxgXdhDzGZS6h2NtMNZVoaVrAPHSJlOPvLjx+BYlwNB
 /qNtHu1iCglv0LBiRKtlO4WnkdIpzTNcLJ9HdTKTYp1OVBkpB4aqftfz5m7bZjxfqL7F
 wZByipevRC/mrjfLBBWtz+Yzrg3JxS1540AzU61rOTb5CMnUoEB+a99AiqHnDjuNX0jF
 FuK1walVUHxtFMtdL6B5W8MfKoGV3Qj34xDmvX+wYx7/8cxr3A90nRYVyq3pL26Dd3D7
 ZYWBFRkpsCBxfQpup2Qc8aVDG1WgMtresMX1+Jh2e1syoRkdeBhkwEVXeLJsU/M895BR
 gBDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmA7OYETF8cqb2UYTG4iP7s0ISvdbUAHzXEk5lKexPuiMvIRYcgDY0IL7g3dfw0ihNfcAJZL13jAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmSB2PjQJsE3kSsupm3Ldct5kNVjCbstgnN/ZsJUpJYYkyjZSK
 p6M/N35fojp0RjaylHKcOspB18EZgWzTd9itDF5XWzrqCu9UNc6J5R7R
X-Gm-Gg: ATEYQzz/WI8eXPVJeYyH8Scwj17nKlm0hpHfn+vmSl4Nkm4lyWmWOh6vptB+FnZ+iTI
 qUQLfGaCgOB/anrpS52M6UrwjAmZqsBu49bgOaYu1PvdSuGF0vDwm392kBvt110wZ4I7Ex29D5g
 mQu6y5lrhAeVUIl4kBlVcoKAu3ezKdKowC5HL6pGUPGQkyLDx8sZlFMHV32Dcw7y95bEVZzzt5Y
 5lTyVttGtblMTZTDzjioAH/K6rIv07KyWlLw3APsiEuJ5l+GGY6jBY66cCY8lbBhLE+VAJAO23C
 ePlkeaWRV0hoy5BKiMSDFc18b51lEILmj9/kBeIrdHV4rMJEhJL2OufMXAKZNA9wy7HCTFdbpnt
 E3HJyMUeUiWKOOm5biIy4TtaLvO8t+0dbU1Lp1hhNveBkF1hWutK2B2YQ/G88JBmjUhmAT00jP8
 yolf2bKC46QANI9kGdYCNTHQ==
X-Received: by 2002:a17:902:d483:b0:2ae:3e4a:3cb8 with SMTP id
 d9443c01a7336-2ae3e4a3f61mr13106665ad.53.1772273984400; 
 Sat, 28 Feb 2026 02:19:44 -0800 (PST)
Received: from nuvole ([2408:844d:a00:16f4:279d:1459:9faf:9d87])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5c111asm82361855ad.21.2026.02.28.02.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 02:19:43 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>,
 White Lewis <liu224806@gmail.com>, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 0/4] Add DSI display support for SC8280XP
Date: Sat, 28 Feb 2026 18:19:03 +0800
Message-ID: <20260228101907.18043-1-mitltlatltl@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CB5171C1F10
X-Rspamd-Action: no action

Add DSI display support for SC8280XP.
---
Changes in v2:
- fallback to SA8775P compatible (Krzysztof, Konrad, Dmitry)
- fix DT styles[a newline between property and subnode, property order] (Konrad)
- use one dsi_opp_table and all dsi controllers reference it (Konrad)
- resize dsi_pll region to 0x280 (Konrad)
- update commit message
- Link to v1: https://lore.kernel.org/linux-arm-msm/20260225054525.6803-1-mitltlatltl@gmail.com

Pengyu Luo (4):
  dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
  dt-bindings: display/msm: dsi-controller-main: Add SC8280XP
  dt-bindings: display: msm: Document DSI controller and DSI PHY on
    SC8280XP
  arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP

 .../display/msm/dsi-controller-main.yaml      |   1 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,sc8280xp-mdss.yaml       |  30 ++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 396 +++++++++++++++++-
 4 files changed, 420 insertions(+), 8 deletions(-)

-- 
2.53.0

