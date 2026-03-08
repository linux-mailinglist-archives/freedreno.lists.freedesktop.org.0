Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLSZBPsbrWlxyQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sun, 08 Mar 2026 07:49:31 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC3B22EC36
	for <lists+freedreno@lfdr.de>; Sun, 08 Mar 2026 07:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7004110E062;
	Sun,  8 Mar 2026 06:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JdaTGw04";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E3A10E0D9
 for <freedreno@lists.freedesktop.org>; Sun,  8 Mar 2026 06:49:28 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-c7384f5a9cdso1599997a12.0
 for <freedreno@lists.freedesktop.org>; Sat, 07 Mar 2026 22:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772952568; x=1773557368; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVqZVQCQ9M+s/60nh17cYdg5jAVVqaMsdAamEjRVdF0=;
 b=JdaTGw04LFDpMozrdpo/I0cpem5oTvY2126JKylpSYue9Dk4tnfY3BTkhwYA2QiOqY
 0eXI2rd8iJuZPehC125EuxUwD65lS//q0oUUrgykmqHYH1OFRvpakX2ptiSVMnlT/i5L
 ogAwLEU8nbCHqu04mmMYrnEQxwTW/uEVM0s2TkAj4O3aSJsgjfDdy9/sf8iD91Bzb919
 BfEISlVENGht8hCWNxPe4g9am3hoz0zIs8+N6zCRmQ+up7JW+pCSIP/7k7hXHm79dvfB
 Tu0Q8LCpK009qbQ3iSPWzyO5knOgZzSM9fyTUSUk2rVI8N3ULAyxsXlX9gJqHeL6GvFr
 hPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772952568; x=1773557368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XVqZVQCQ9M+s/60nh17cYdg5jAVVqaMsdAamEjRVdF0=;
 b=sxulUBvOIrr83WkkoHWPOd+8ODyTY0lOM0m9TkisSlde+K5/4QxlI0szbaHfZd3u5V
 FRbpy7zQDwh4AGZcxNsN0DntgPk1Isa7zL4GAN8Pl0jT8vwydsAgInLPVhkxOv7oH7Gx
 9mDRNDPtrP3Bg5jsMcWxeM51ODQmhfVUcg9c8h6qV1oyPx5Ixa8Gu6uyg+OSlStKs6uV
 gOyNoHYJyXNX1MGe43Ba3SxWQY0OZ4dVcojPD8HRDRIU9QeBgNaCz9tE9F4YWruPJUcy
 t9qFDmUTspwvidj2ra8AOn/EtfonAOqiJ9baA6oWMx/A308Wa8fLFhQxuamF9b8mXlQ1
 tSsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdQpE2EtM/7MAxM/mx+haQw7o5lqoX38s7w3BUk20VxjD0uAu4gQW6kmxDsjFZWn1elqPyOpUQrJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrMHQ3ir6QjQdddu0kGUZyMJz1zbJDj6GwTG+cGooj0qezKmRR
 e8liJEtgt2/dcIGuUV3fQKOQzohS1Mf8tcVANgKQuokU0JtszfyWu5bC
X-Gm-Gg: ATEYQzwiNfTeVvG8KVVR/TdPtmrr3Frd2pUwkiTPg2ZiQmfnMN6yK9908mUfVDlkXFx
 pja6UG+vK3WufwvFltNVVCAPs3JEoobXNxFbGP7jax7NJiM2lIC/L2NB+qUr4DTDYM40wl56rBE
 eFH3mSZJYE3j4hLB3oHw0Azird2QqCbMpW7BvFRBUnbrpWLYiAJLytkd+9Ult9d4bgJVS7riK7q
 oshkRZOT/KCRNopB/KHD8Uxy0YTQmVZ0Jt7ffjxaOi9Xm9aBqGFVomwZ9LMZUAQP1SDCUC/QJil
 hyidT89Ri7vnxONKi/MU4Z8F6+KOCI2+S5HO+OPrnS+9RHwDSHJIAPurb8iwA9ZeQGJwbDlrbTB
 aIAhT/8cb1X8Fh0CjLne5zAi2bkwQM4AjC2hhiFqhtTws/2gl2ug8aFR6S8S2Lu360hTMCVDN/e
 1CxyKi3deIU06ayUogaw==
X-Received: by 2002:a17:903:f87:b0:2ae:44f4:1678 with SMTP id
 d9443c01a7336-2ae824b83e7mr69310475ad.57.1772952567915; 
 Sat, 07 Mar 2026 22:49:27 -0800 (PST)
Received: from nuvole ([109.166.36.159]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae840c9a0csm72503225ad.91.2026.03.07.22.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 22:49:27 -0800 (PST)
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
Subject: [PATCH v4 2/4] dt-bindings: display/msm: dsi-controller-main: Add
 SC8280XP
Date: Sun,  8 Mar 2026 14:48:33 +0800
Message-ID: <20260308064835.479356-3-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 9DC3B22EC36
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
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:mitltlatltl@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,oss.qualcomm.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

Since SC8280XP and SA8775P have the same DSI version(2.5.1), then we
fallback to SA8775P compatible.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v4: There were no changes to the patch.
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index eb6d38dabb..617dd110db 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-dsi-ctrl
+              - qcom,sc8280xp-dsi-ctrl
           - const: qcom,sa8775p-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
-- 
2.53.0

