Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODh0AgUcrWlxyQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sun, 08 Mar 2026 07:49:41 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B822EC5D
	for <lists+freedreno@lfdr.de>; Sun, 08 Mar 2026 07:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67D110E0DA;
	Sun,  8 Mar 2026 06:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gOX3p4Xi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C3810E0DD
 for <freedreno@lists.freedesktop.org>; Sun,  8 Mar 2026 06:49:37 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2ab46931cf1so72550245ad.0
 for <freedreno@lists.freedesktop.org>; Sat, 07 Mar 2026 22:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772952577; x=1773557377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j4328We2ZSbU89dRtsmQ/+aiFXF79IsV//dOQeF+Tbo=;
 b=gOX3p4Xi/7xwI5P7F15CpB8gnuR0Ca6gT6POiJXY3qkQXmK6urKKn+WpxLSsOHrR4y
 509q/LqToW4qv+dQ6OMRiteJGFe0b55oQtikupIlmPANKjSeO85tkPzIbijSkH0hVRPn
 nevqtp/jXs+Fv1somU1izjvCa6WZe26slLSwcckck2o3qIblpxwhSJXMmdjr1ATbRqlK
 kHjC9GpBA+vW25iQ6J7fskl5o5k4w/gRb/dinl3I/Nf3ubeXv0T1qqVJSY+E8C2EfNOx
 5ccDSPmR5CzngYqPkwEfzuzIR9t0rO/kxaYl51roZCVc/XWg1/IxcjuEeegglXvgxKaj
 nWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772952577; x=1773557377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j4328We2ZSbU89dRtsmQ/+aiFXF79IsV//dOQeF+Tbo=;
 b=awiaki7EUdXFn6Hi6o7qmVQOP0/I171tgj8BR5VL5eM2WumQRMhNUuTVXUHmTuxTjB
 rirsnBENmWEEKNuBjJL6cgPG41AMWhQqQDd9vs8Yst8qxLjxxT3O560HMNgLChF76B8j
 ARoKupsKmu6/35s+pHVRaiX0ABTNOOeltzDvM8r//EaIb0dnw87vsvpxgeMjK08xxQbZ
 DuRzM8kzaWKJt8cLtQgbFA4/08/3KgH83lROUkaAGqn/pkaNJcxx8wgR/rSMEOj4QZ+T
 QzLiTqDOWLiJutuqxPbuQMz8No1RdnrkcurXdGs1VlqkGNSt/XYv6mspIf8ycD2WwaYS
 oC2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8Dzw/jwxy0+c4KwlmLLogiyGCi61+L/bA6k3XNQgi0TF/p4kVLexXR15M4Wqn66W/6eG4yTc7aOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH6V9IHws8AAwm8Uct4KvM1Zy0WskG+rBqB8m8jgCRXzj/UIL4
 +rDWLeJHe3M575z1OzhleIUihme48RhHpbik8JFkBmJVf35HIY7GPEnV
X-Gm-Gg: ATEYQzwe58x8Vm7Oio1YrWMB9FLjLi+DiSN/m+qgGOMTMsXEzCBOjEjdwhF3lNrT66k
 nZBNSRjODK7piFL6eWfhidwlPdl9ow35ShWOmvC03gF+QDJdU9GDXMZRZDEHujTtvn7e+GyrP4O
 iZdw7BcJHv6liP/g1Vg585JGurQZPtLFvtJCd64Q7+eYE2wqCbpK5k/EblR+jtb1YhMNl+yZm27
 H2Y3vZSp76CLDs8g8qNuLXttfEf+Y2XtXgoTYmr7vQ+3NUZk+RtBUcx0RGltYL9HynUB7PwHTzE
 27mEBjd/wROCqJ9rx7Ay0iWwcUX0kJjMFAr88hWaSUGix9zFAk/HP1sCWVvBFcTwfPxWuu5KQO4
 GbaXqjE3m8TZ5lw0JZQEp23kFOYfjiBBNLJfE77wF3WuGlIHxNjsLkl6CqCwrMCEAd95/9VDWCh
 pV6khpa5HMpxYF1l1pEQ==
X-Received: by 2002:a17:903:2983:b0:2ae:5350:3a4e with SMTP id
 d9443c01a7336-2ae829f3447mr72533275ad.21.1772952577318; 
 Sat, 07 Mar 2026 22:49:37 -0800 (PST)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae840c9a0csm72503225ad.91.2026.03.07.22.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 22:49:36 -0800 (PST)
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
 White Lewis <liu224806@gmail.com>, Pengyu Luo <mitltlatltl@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 3/4] dt-bindings: display: msm: Document DSI controller and
 DSI PHY on SC8280XP
Date: Sun,  8 Mar 2026 14:48:34 +0800
Message-ID: <20260308064835.479356-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308064835.479356-1-mitltlatltl@gmail.com>
References: <20260308064835.479356-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 731B822EC5D
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:mitltlatltl@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,oss.qualcomm.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,0.0.0.2:email,0.0.0.1:email]
X-Rspamd-Action: no action

Document DSI controller and DSI phy on SC8280XP platform.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v4: There were no changes to the patch.
---
 .../display/msm/qcom,sc8280xp-mdss.yaml       | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
index af79406e16..a710cc84ec 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
@@ -50,6 +50,22 @@ patternProperties:
           - qcom,sc8280xp-dp
           - qcom,sc8280xp-edp
 
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sc8280xp-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sc8280xp-dsi-phy-5nm
+
 unevaluatedProperties: false
 
 examples:
@@ -129,6 +145,20 @@ examples:
                     };
                 };
 
+                port@1 {
+                    reg = <1>;
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss0_dsi0_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss0_dsi1_in>;
+                    };
+                };
+
                 port@4 {
                     reg = <4>;
                     endpoint {
-- 
2.53.0

