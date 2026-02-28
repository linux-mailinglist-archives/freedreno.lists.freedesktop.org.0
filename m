Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 03csGW/Bomlx5QQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 28 Feb 2026 11:20:31 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF9B1C1FAC
	for <lists+freedreno@lfdr.de>; Sat, 28 Feb 2026 11:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9141C10E281;
	Sat, 28 Feb 2026 10:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AolEgDSL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F2810E27F
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 10:20:28 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2ab39b111b9so14474985ad.1
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 02:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772274028; x=1772878828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ctCiaK7OMF92qM4nTlZLKq6zwDFa78jAQVMaISXu7Q=;
 b=AolEgDSLcaRcJBqXfdtQ27yhW3keocpjuQ5+pzvAyr9eBvImRbkde0WtnJO2d23NRY
 M8vWz1CZPEqYZyizMLqIaZdNZvpIrD2AdaKhBgvmjVsa7eUSOxQFB1AnELPH0aEUnYLW
 ScGrZVuvTRx/wl+3NcsJeoOX17dMSEOrTnb/ZM542bWvxZkOqwj6O1RiBxbulVKsi/nP
 wbMPhZxEo+mqCB7S3zqpWyjtd5mjz7KC6tyrIESL78b468qb/zQKS2YKzWAk9rbUWYoa
 l2E4X2i2nMTGfWrsN00E9A3AGXNsWmIDng7rZF30Lvgjmsr+ZuvjJea/U2gaX/xpZmy8
 hCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772274028; x=1772878828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9ctCiaK7OMF92qM4nTlZLKq6zwDFa78jAQVMaISXu7Q=;
 b=XT+3ZxvE0qxjKeK/B2QV1b0onppWHfoP4FFUm9Ee3jXe3q3cLVpuJAqXKEfNS0kEbf
 KUgeMpF7BnHF3NPgEg1Ne7F2XKkcPU4t4fEQbFGpTLGBZmesn0OYdHlOAwH75DP6w2Qz
 Dc/LWzE+gfezyuKWIdYdma7u00UN4/2sRTBTxhRhp+7ejqobRCjPB1a4ZgV/QWsilJ8e
 8vdB+Of5dPaBcdbbOnKJ1Co92rX0ucO01CuVEbIbxzCLaX1FCNpaQJ3fafH7EpSf19sK
 OARovUPcrHdGmvo0rRuPwBOu/jZnXb3iXJpwzJxycNXuFN0B9WA0LSekKKu7TNn52Gh0
 NMtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsMlOKmJSegHfvzDu9vaBaXtxMv6Yp0V2COyoWFIxiiwsUNS4dfc4IRqK/4JusbnhtVr69f1Wj9Rc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQlCtda0d8qvo9JFTokOnq+Q0LSThnaYkZATtjA03OFBS+WzQl
 Z8A6O/NTa0aLaP0SUtCcOJzOfcYZq8dd4nbbH0o15JmVtCInOVwjeHcv
X-Gm-Gg: ATEYQzzmfK/u+AqJ1MbbHSWMmDh75eE8JUmw55EwFuGcgDZB1qirdTx7t/EBUcSAjK3
 dai8L8bLK1YKjeTSVR8KRWGyVIcOjgifSVPhuz9Dvd5TDBzJMTdCMDj5RTGSVgbazzs6UXW+50i
 fqQ88MCGI3Pmh03vtGtzC3p8i4N3Adv4eHn9mTfPxEjje8tBuMU9F5yX7dvTD/544zicCco02uD
 j0cZtHKUfx3Iwas2JnI1QvWWZPbtDltQV0R2v2f4ZOEuOyPTNgd04DAG/WOTUJ5RmERODhnp0mU
 SPGgQNvvy1E3O2aLLryLEJ80BIATBt3EErdQMpywDFpvPJy3fyel4pVvzjNWVrVIh7uHxMsar/2
 YmRobYYl8o++fXcMevx1Zu3hfAM7q6nM60LxbVo14BbNrPx95nzZH7huWf1la/RRba2stqZ7wN8
 7AHpnjZ7C/mshd+T0UT+ocvQ==
X-Received: by 2002:a17:902:e30e:b0:2a9:5f11:3a26 with SMTP id
 d9443c01a7336-2ae2e3e7061mr41831665ad.7.1772274027740; 
 Sat, 28 Feb 2026 02:20:27 -0800 (PST)
Received: from nuvole ([2408:844d:a00:16f4:279d:1459:9faf:9d87])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5c111asm82361855ad.21.2026.02.28.02.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 02:20:27 -0800 (PST)
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
Subject: [PATCH v2 3/4] dt-bindings: display: msm: Document DSI controller and
 DSI PHY on SC8280XP
Date: Sat, 28 Feb 2026 18:19:06 +0800
Message-ID: <20260228101907.18043-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228101907.18043-1-mitltlatltl@gmail.com>
References: <20260228101907.18043-1-mitltlatltl@gmail.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.4:email,0.0.0.2:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ECF9B1C1FAC
X-Rspamd-Action: no action

Document DSI controller and DSI phy on SC8280XP platform.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../display/msm/qcom,sc8280xp-mdss.yaml       | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
index af79406e1..a710cc84e 100644
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

