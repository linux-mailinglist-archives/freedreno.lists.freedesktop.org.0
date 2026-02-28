Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B3+GDr5omn18QQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 28 Feb 2026 15:18:34 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99AE1C37D1
	for <lists+freedreno@lfdr.de>; Sat, 28 Feb 2026 15:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5252E10E2B9;
	Sat, 28 Feb 2026 14:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ub8c9mww";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6353F10E2B9
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 14:18:27 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2ad9f316d68so14308455ad.2
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 06:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772288307; x=1772893107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRK4ytllLFpElYCVfnglLAksecVZvWpzoSUosFjJO34=;
 b=Ub8c9mwwhV6K+SiApIkaV3gS69iqkZWxaiAQm6nXk4AnZAxNEBf8xS4fKBAygz836O
 LTmXn5v3BGyRr0XHiRhj4rA8Vma5BmbUBCr3eJSBK0+zMJNb7xFRyRuYQ4gebLG375c2
 owLu+4q48lHwQQ4RQatk142KMW7sk4Ru6UKoWa/VNiIMVUqzA4DYV1l/fOW+D0C1rvcL
 JwyE1ZAxCIHk6ksSdjKmxhdicPSJy5PKH7bERGAkXTDLR89IKcdLVUe3yfnuvm8bQi6d
 qOm1VamTWcyl/6SqdIA45osXoZbh9HB2RrXX/E9CS6Ff7bEvT1Vkj+CXkHbfzD5SCFb2
 Sv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772288307; x=1772893107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IRK4ytllLFpElYCVfnglLAksecVZvWpzoSUosFjJO34=;
 b=O7kMwxlrkMZjRmo5Tg4HqwlLUeX6lLduJ2BfbtjGd3AmMnmG18m5GOqVQkJrZg9n5Y
 CC+clyqb8c1e18yGR9FDVRyLCyeqYFvm5a4vJFzu1K8URata4U1J3//sXlaHiRSrZkQO
 7JzCcGrwebucCrK4zv5ZbO6XF0CPGJP6ErJKFzHSdc/tfCh5YKfZwvbI8sWziUAsmgng
 mmO9X5xNgktJ4eP8QGMULsfBpsn6AHWcSGWKoeztb/O4CZI0H357g9PsWvQm7LqbG8ys
 8AhS4Dz+Ggu7cVev76cmWI6nkVIDI8VqyTuQ+QaOL0jnehbVbG8Ob7VzS+0mhKJIuo8b
 pylQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7yjYDbwxt+wVhCLfWTrPVbogg9Xn6Ee0+E5G0AD6OxXzEfExB8gCagwlkDmoFe1qvDTudaX4yZc8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2l8MmF+b29siP/E3VVUD5efjUDswEkKW4XuBlFe4Axq2VEmBi
 sOK8AxQ7lN+hwbqYgLaC5jeHQyZkz+UxSLrlR/7SeURG6ULPXsy00vNC
X-Gm-Gg: ATEYQzzHz/q5fnmWthYih/rsHyx+MM9/u5ddlnGQWMwzcraf7mnIZDwWtJ6n3P+OaXf
 HtcqdFByeQhHWN2df8Anu3m6V/vpIpdMOQRKSd/xAALDX4bN5j/dCicfZN0/5WX1NCCF9cOxzAm
 AZOJ2qVaH/pbr+t4wqmJCWPlUM+WAVpOxd/2AT6GS1TpV98rxs8BfK3i1K0M5DC4TIbOLsV2eeM
 M+MMVhX5aFwhQ6ufuQDR0ltuhnh2YCaVLGfbiTaTYg02rVTTHZLbbpef5DW0UtomDE7ivkqUdrB
 qpxtlGnO++M1gnfYpvYmoDTZuy3tCOgNEI6HuOED6LFqE95Nc8ix45ka0ONqJ6LWjryFr/9JEgN
 mGqXTb8i9IEWGqSYJMDc+lV00y4ScxaDo3XJIVjkQhXVEISZH6iUjVOYdLFpvpZnyQk3PFHS2jW
 qdwtGbdVRV5hHS3rJCrbSP
X-Received: by 2002:a17:902:f68d:b0:2ad:e535:36c5 with SMTP id
 d9443c01a7336-2ae2e4b55b9mr64065355ad.40.1772288306828; 
 Sat, 28 Feb 2026 06:18:26 -0800 (PST)
Received: from nuvole ([2408:844d:b08:3702:16a4:72fd:8170:4ed3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae3d1b2c5esm18697235ad.6.2026.02.28.06.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 06:18:26 -0800 (PST)
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
Subject: [PATCH v3 1/4] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
Date: Sat, 28 Feb 2026 22:17:12 +0800
Message-ID: <20260228141715.35307-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228141715.35307-1-mitltlatltl@gmail.com>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: B99AE1C37D1
X-Rspamd-Action: no action

Since SC8280XP and SA8775P have the same values for the REVISION_ID
registers, then we fallback to SA8775P compatible.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 9a9a6c4ab..532f37182 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-dsi-phy-5nm
+              - qcom,sc8280xp-dsi-phy-5nm
           - const: qcom,sa8775p-dsi-phy-5nm
 
   reg:
-- 
2.53.0

