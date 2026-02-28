Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNrhLFLBomls5QQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 28 Feb 2026 11:20:02 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E81C1F48
	for <lists+freedreno@lfdr.de>; Sat, 28 Feb 2026 11:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C631110E033;
	Sat, 28 Feb 2026 10:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Md57hKA9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5845110E033
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 10:19:59 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2adff872068so14504395ad.1
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 02:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772273999; x=1772878799; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W65pIjxoHigfzhiWxc71VWPJjXP9A8eJwpMfks2udRU=;
 b=Md57hKA99en35FJ8KpOwarcG6pQI9ay8tk8TxGk1BdYvQ3ol0Xq2oPytBiErpLIAtc
 klEpTUVvqrfT6aN4XEIyCQtgPUWRcEtgCi2J0nN1RsIh9F/ePz3Xa+km55ZuNnwk45Dc
 /EXPDSEgnPaDvu6oF6+YdjueVRTU/nVIeCBqFuRM4Se68jGYUOKk1cVsVZAFI+QNnG7i
 TGUU70aFRKHhqgSVbO2ze8/KM0Gy2VwWXU6icHGxs/Etqq0i4VA55+Ew7GN35i0sHayt
 3FdPIeeLwO0Mp1DCRrcv8QOv2WVS5rR6iiRssoc6BMcKcQ1ahrco+fEvIr9+Aycq6KaF
 2G0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772273999; x=1772878799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W65pIjxoHigfzhiWxc71VWPJjXP9A8eJwpMfks2udRU=;
 b=qp6GUNbyLLU0j6nfk4K7Wrvz3TMkBfHzvKPLfUDVDedGhb0/VvYG0R1lBabtOcAk1R
 J4YBPLglzSxcdN3oRSEm8XJR2Y/n1ezAQUjGjnGC/JJdBEznIyoauQcmseldNXDIWvo5
 dcqs6PanMzNpQDYnlKQ91F40/ZUugQd5hARgEZt1TgCscXUUuSbPKSw/MU7TIejYrEHK
 NhM0n8OWFRu+M/P+SvD3jfoIbN2XDg2UcVjIHEaye2MAtTI8165PAgzL4dwegdFApm13
 GqlF1uojUIxJ/aOTNHBGE8SsEbGxv80L5hMQT/8hnKU4p3RqivQvuGAvKlzmb2Pd9fi9
 zE6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLmi1u7kaW2apm/YaMZSyDe5YfD5n5BEpb4ZPH0v2iAVXu9XyLDENQKzPtygR4OCmJftVvlQ0TLbk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlOK0ktLNjUvjspLPnH6EenMQ4nkBnTz+xZaT64k1guyqrue29
 QXyJqlFVXmdUPLYce1+bmWI2+UX25hg7ZUk+riPO67QVUpmy2s2PTKkG
X-Gm-Gg: ATEYQzxlVae2OOVpgwTcgSpuXXa5zWTm8NWcKYioCW3mC7cOcI1s3lE2pcTL6ZLJkqb
 DsnAw5QfGxA/4qGFEIfxjD3ErVYPNurcdIKxvcSn5Zr/skJzxHXoqEYqB6UNccFbmdNPZXhEyM0
 EV+jGa5454qIIAnyZrR+x/jKpdbnfQsU6CrI9GKy3BWxBzfPSiba9nxwoPQhmhePu8iz2xSEA9H
 /L9+LxBKSR4qXdyYkr+EHUYNXAGUuSuc2vkwyZEcb5uGHDUodKhl8b47ZzWsirOCU+JREg99xYX
 yu1Z+ezzwMA1JPW/gh6tnaOJMxBFV+r2ZNfRu0BklQRcDoqNMfE8QlI+hFlbm15Fr8MXaYtb0Lq
 YjICwI8TlhqlBXVYASAo06B+xJ2zMcuifG1NgQCSEjX+Tq6NmGsb6l07ct0jvuSEdGc/lqF8gOi
 vlHqWknViBvGQVDb6k6LxQug==
X-Received: by 2002:a17:903:2444:b0:2a2:f465:1271 with SMTP id
 d9443c01a7336-2ae2e4bd049mr57192275ad.44.1772273998754; 
 Sat, 28 Feb 2026 02:19:58 -0800 (PST)
Received: from nuvole ([2408:844d:a00:16f4:279d:1459:9faf:9d87])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5c111asm82361855ad.21.2026.02.28.02.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 02:19:58 -0800 (PST)
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
Subject: [PATCH v2 1/4] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
Date: Sat, 28 Feb 2026 18:19:04 +0800
Message-ID: <20260228101907.18043-2-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 382E81C1F48
X-Rspamd-Action: no action

Since SC8280XP and SA8775P have the same values for the DSI PHY
REVISION_ID registers, then we fallback to SA8775P compatible.

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

