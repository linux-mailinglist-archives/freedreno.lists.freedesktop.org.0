Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /5WgD+gbrWlxyQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sun, 08 Mar 2026 07:49:12 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854CB22EC00
	for <lists+freedreno@lfdr.de>; Sun, 08 Mar 2026 07:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C018C10E062;
	Sun,  8 Mar 2026 06:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U25QF7HU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B791810E0C0
 for <freedreno@lists.freedesktop.org>; Sun,  8 Mar 2026 06:49:08 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2a7a9b8ed69so118751405ad.2
 for <freedreno@lists.freedesktop.org>; Sat, 07 Mar 2026 22:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772952548; x=1773557348; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aNIHEpkAqWiAErrHYpSRHcsVSQ/YY6yHFTO8cE3ikuA=;
 b=U25QF7HUctbUNmxKREpuhc9/1GWMKa8owYpsSxt+NY3MaChFI5pUR3TxefYiQBLbYA
 cG5/NW644jWajK6i3IRc1AJS+tlqBjuV6FkzD3m9Ln8JZsqN5c9qlBvbvpF2zavou8rL
 zQ4aOMGa6XAtgYOjFsL8urVhPtLTPN07aE31OVva/PmY/XR5UFjZHFh3eFodJTwFFP0K
 /7pnnWLi/ILzTY4ieAIzYWr61TVVJisa2jGErxZO3JREWafhloLdSuxRo8iFWaZJxqLd
 /Ju4Hrd0sQ5iojIRmEpzBNnkyvWZ7TcXN4+wNMH0qnS60KEDutPtVrbE/YP2lJC7PKi7
 lcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772952548; x=1773557348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aNIHEpkAqWiAErrHYpSRHcsVSQ/YY6yHFTO8cE3ikuA=;
 b=XvHPez5g+BF/aK0zlDeox+IIcfGqNVWt2fu0ACALQl5VbX+QOD/PIA9mj/OzkNEklV
 F9TxB+ZITIdgy2kXJGgk/M6NXjhzqOE9KXEweAlR1qrZIm2c5i01FuepYUDdSLbIvoui
 DKcuYGIp6HfXXe/WQEOHWJEZ6AObIbqnBjgiAiLRwOPGUdeGp3ct7xUH0xyXozcp45GP
 ZcmRpd8xeeHSB6Q4xMhZHYRX4FSqYd447Sg/U63EtnBY887Z0iCzxpYFbkBUpmtXlJ88
 hOjTIvdDZTyH8JqjJQU7TaFp8q+8fGnIWzEERi3DNBbBDITD72dVmHdMGE0XNR1ZJp9q
 7xRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBTdCfv0dVDg/kqPTrJU3ayarORVvMOtbGxCAtJY463pZfdSc9iTQ3JxCGi5gwYG89uvBwBA5o+cU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZiq3Q0/JFWriZrYRoGAPooIbMuQbbpGbg7pHMj2ZjsCXdcgs6
 GDONDONzpHZtn0na+Wm+qx9uuhkeYh9v6uH9CsJcCHAf0Y7k6nbCWhgB
X-Gm-Gg: ATEYQzzUgYRgj0k5i1Lf8q2hrmDMKYPznJigqH0MJhqeFhX9iyc9MmQDc86cd8gBnds
 7ZP2YOKjpJhgKBGb2NXmjbBiGFmrIoNgwZibni/pJwbaplBMaZFnYotE6rNO0rznpCWmsNX4thm
 /KTn0ocnK+JWMV+JW/BRCT9u/6przt458bZZdi6CQDiIm6hOINm9UDvmRwnY5OMWxfc9OhmzM8b
 D5WG2Y+2/+i8o2U7EaYNffmQwdQYwbkKEhVDEexxOjMzCXIEQ3J+bR7+J5+B4ecG5PKjOzbvzoR
 2ni/eKsC2VEPKfSWvA601zGiF5ivdwDslfufKg3EC+vmpwI9xxRG/zF5mbaWYt5G5zP3KGnPTly
 L6kHk1ZcTgCzVB/LLUw/QPyUUPg3+3srqjz5lNnxXb3aqTheIOz/AznlyV924mHyIrlBIXw4UAO
 8dOA4dembgyuDWQNoJFg==
X-Received: by 2002:a17:902:f70a:b0:2ae:8253:1a78 with SMTP id
 d9443c01a7336-2ae82531aeemr77776095ad.17.1772952548110; 
 Sat, 07 Mar 2026 22:49:08 -0800 (PST)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae840c9a0csm72503225ad.91.2026.03.07.22.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 22:49:07 -0800 (PST)
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
Subject: [PATCH v4 0/4] Add DSI display support for SC8280XP
Date: Sun,  8 Mar 2026 14:48:31 +0800
Message-ID: <20260308064835.479356-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 854CB22EC00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
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
	NEURAL_HAM(-0.00)[-0.998];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Add DSI display support for SC8280XP.
---
Changes in v4:
- add missing comma in DT
- collect tags
- Link to v3: https://lore.kernel.org/linux-arm-msm/20260228141715.35307-1-mitltlatltl@gmail.com

Changes in v3:
- add the missing refgen supply to DSI (Dmitry)
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlatltl@gmail.com

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
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 404 +++++++++++++++++-
 4 files changed, 428 insertions(+), 8 deletions(-)

-- 
2.53.0

