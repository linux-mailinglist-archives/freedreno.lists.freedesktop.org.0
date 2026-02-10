Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP6yFceNimmwLwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 10 Feb 2026 02:45:43 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40511160A4
	for <lists+freedreno@lfdr.de>; Tue, 10 Feb 2026 02:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4141810E49E;
	Tue, 10 Feb 2026 01:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H8+chdQX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D80110E49F
 for <freedreno@lists.freedesktop.org>; Tue, 10 Feb 2026 01:45:40 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8c5384ee23fso401575785a.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Feb 2026 17:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770687939; x=1771292739; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qZS6xma+Zqre7AlmNOzN/FqfjaONWCLXqsAywPf9Rk=;
 b=H8+chdQX4b7H/5suOuim48wV86SGZyKAzPBKVDf/Z8TEKcr9ZH41an2T3nWTQHD+Ai
 QUP2KUmgEQTkxu13vZwsNQAqJRDOgibYr+h792ocxriSgpVZqJlevOo1w1EYD7f4UaEv
 VGhki9C6QEFa8t0wPxYuUrCOtGrB/dIyjvfTu7tf7ZMkNkOLPwh57UgzfMFFp9MfN1Kh
 v3kr6Svuw/glldwCLSGARIQBh1bUOe0weUjU2fwmbnphNrmer3gKNx/yICM+yQ0QtXf+
 VQb8H7W7CcdjocC8fa9hLQpoQwKryYtkZpgrX+wsIn2+p7XASuZT8ca7Y0HX8Emo5WDD
 7dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770687939; x=1771292739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/qZS6xma+Zqre7AlmNOzN/FqfjaONWCLXqsAywPf9Rk=;
 b=mM0O9P3ElWurzWlOXuNWwX44xxM7zUS1YfkfhTHBGp4JyHDRjf9qoUhT2d/K4St9NG
 cY/yhvedckE/0Mf0rG0VdcZFL+NlHb/QynhhFM2c7p5P9/jBKYIhrJ0/BFiayaJc1n9q
 C3BCSqPq4pqGY4HP+9AUEQMAjfKV/MLZG8P6rdEvL1EEBvJaZfYF/Gi8X9X8pnzF4+9Y
 95FyQxPh3UOBJ4MywyODpz4F+eH6SKlPcOyhKfUAfQZ2eP9HvTIsFtq/z5CsNK8lmMER
 4V+A7sXh0DQaaDpWu1fzsLtopYhdvoNabwjFN3EesjBnM0I5qnbVHk6z6w7QlckgKRzB
 fcOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU2csHD2gvaIX5Sro+x7HC6Wxipc+ipwqafvN5tW2ctFwKXY/UsHJKys8J3BlUUTfWJnRRt/5QDK4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTLx3v74uzUaVpIjCZoWl8JmOBTPuuS9aNTUFwPeMc98ZeBJBz
 cAUSJfuKap99i2D+EvL56ghhnvA+NmiFgMUv862wDiVZPpInU1AmvZ+W
X-Gm-Gg: AZuq6aJTn5PKzyK4L8lqu9qIuk800I2WhRFdYJTxx23daA4+5jB2ixGdzV4lnBnDlzL
 EmXaGtt2NR9o8Z30fYiXZjBjwkiha+javu+amKe27M2kSjgPwSIXbDwq2kTqJiKB3niVpzBm6gd
 r/eG1UidMOtdwTrc1NQaxw7w0gP4WWBSBafzowsHQb+ZFXFkAcfGasdo3S1Ct+MJJZraiSIqrUW
 Z/q6yc7QAUsydeO7G6rpWerZdlclyf01aQYwKImPFpEGpnkFqTqCkH7n4fQPSZoOocsg2IQ43DF
 dic6P7jDo5LEI+h9Am7/91/ex/V9Wkp+cbhlIg+NtCfC4nG9KSGJCb48ULAAKjodYhU+agUZrQ5
 ETVOlo8jyLH2Ip13QZsFZ1ySV6PszYM8QcMebqjGfjeG+Q3asUFp9ja144YjB00QUqCeNWYUFze
 JWhBdiis9b6+rhVM5tfEWvpEuMs8C/7u/0SP9x1t0KeX3e+BWKKvQD0rB4Vy+ZC3VhhoJiAyQqI
 y9NgWJDmV5TvL8=
X-Received: by 2002:a05:620a:1902:b0:8c6:db3a:3735 with SMTP id
 af79cd13be357-8caeeb4e8a4mr1816696985a.5.1770687939183; 
 Mon, 09 Feb 2026 17:45:39 -0800 (PST)
Received: from localhost
 (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf7aefbc5sm915309685a.17.2026.02.09.17.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 17:45:38 -0800 (PST)
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
Subject: [PATCH v3 1/1] dt-bindings: display/msm/gmu: Add SDM670 compatible
Date: Mon,  9 Feb 2026 20:46:03 -0500
Message-ID: <20260210014603.1372-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210014603.1372-1-mailingradian@gmail.com>
References: <20260210014603.1372-1-mailingradian@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: E40511160A4
X-Rspamd-Action: no action

The Snapdragon 670 has a GMU. Add its compatible.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index e32056ae0f5d..93e5e6e19754 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -91,6 +91,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,adreno-gmu-615.0
               - qcom,adreno-gmu-618.0
               - qcom,adreno-gmu-630.2
     then:
-- 
2.53.0

