Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BGxFYQBcWmgbAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 17:40:36 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FA85A04F
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 17:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF3110E83E;
	Wed, 21 Jan 2026 16:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WI5bbRBD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCDF10E83E
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 16:40:33 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso10365745e9.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 08:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769013632; x=1769618432; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AVNYngE8GhcUThodYsah6BFUD0+NgqeUoL4mISd0lrM=;
 b=WI5bbRBDFVxFzsSLHmhwGXV6EunHijxNpwSiFlKNAEPh6vN+e8NNESLcJ2MYFeuGPl
 LdpKB99BuFg/YBfc4ltQF6NRpG9VRl4NAW7S8BNeIv/Z3wLrg9gUov4vUxQbu6Zzy8AN
 THBuryv1pRbNc981CzcwtE7tovfdTrHfjXQ8LPEHae8jYhHx0ZyQ2dFIzXj5+qu2xfKS
 0EtQsytE8G/YDXDZJ3yKNiVgiG74/AGqT8u2fWvz5jnXqlu3KY9qcLgHaBevXPcB9jJA
 LmHAKoRxTAVNw/LEgxx/q5flMZsp9CEEGmxYtl6+VxaBgtaMkrieQZyGOBjcsMw6V89k
 pURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769013632; x=1769618432;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AVNYngE8GhcUThodYsah6BFUD0+NgqeUoL4mISd0lrM=;
 b=B4mk/Xcgpr/pWgoZ9PSxqQf5zn3svV1hbfkbLZ4HW69tyjLHR7VOSgAvaA2kiDXUIu
 88jiSvNi4LLjdhhesqN1Y+qwCeugYPY+O1wSXTF72AEfoLKIX+jnYKGIgX8FjWMs0fCI
 KRmnwIB4BHR4xpIibhteDlYMH1TLk8bZfTSZ8V18pAe0pvRfd6ts1OJCSjSxNYiKJUUn
 JdVRjOC19td4HCgRggsbAdlbvrD6IHrajEw1zdmoSWfGX6fluGObRq5vXfubxOgMpeIg
 eva8noIdAOxJxbmJTZn1zCTTJcueFVaMQZxDDoWNgVelAaP2JVtC4QSE13lOdx/Ma7Bw
 Ndtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiKvNrKeCSvtxc6iij/IRhU8uH9CjtiUuzukYeCRDz7T/ChsHBk8/u2K4MndwpE4B+3zH2hVZkae0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4TZNcII6/FQMxwBc0sCyRU559Oz8Xr/zGtSJ8buuOPq2m/PIx
 MIuB1XCbyY2f/GPA4clJdIMCfJWcoX5jDmXQCJ5Ca5D0EWGnT414TxYu6y33173ZjNw=
X-Gm-Gg: AZuq6aKl5euQIZj6dYZwW/tV+1Jw/Vijn3LqZ8HZebff/UGLRyCHNb8RalSkPodvB0p
 mnpMFHgycm0nt/tLgTwUoL4O7YbGer+TRrYTP8swGQI+LNTqDghNlpilX4rCiiNn1hrwapIUyan
 a/LEzegUyeKkkBWOVDoYncRp2oV/trd2WqdnbtfkMQ39mS+f9+ROU+j7otOeGtzOp2f8yl5HlEb
 tJ+k3uniFD1Y06t2KCc12ORG14CoUDu3yG9tWBC0TuHwTGCLsq6nYvW4zvVN/mD2WuWR7ulhTPB
 Vk0jucQViBrheGY2pQcyiF/t2Vn+HczLcd7Zu4DVwc/T9CbtX+HQuWZduPOY3ts6rBdYr7EWasO
 UKU/Qx+1UYgOZ1Xm0jKJEHCRLAaABeqwtVcLhcj/jYpoLJ8Dq6GJ7+/vgK17l01i4T9V5YZ1M/U
 wtsvtwjs597q3Ij66PjC40KhZucJGLzwI=
X-Received: by 2002:a05:600c:4e14:b0:46f:a2ba:581f with SMTP id
 5b1f17b1804b1-480470a6bb1mr487625e9.16.1769013632032; 
 Wed, 21 Jan 2026 08:40:32 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470287c3sm1000255e9.3.2026.01.21.08.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 08:40:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 21 Jan 2026 17:40:26 +0100
Subject: [PATCH 1/3] dt-binding: vendor-prefixes: document the Ayeneo brand
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-1-bb3f95f1c085@linaro.org>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
In-Reply-To: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=915;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cJ+fpKUN2CJHaLJYtnMXTQDEo8RTawpmcuU2CAoDmOA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpcQF82obrGjAidxJJHhz2jzclHKgnV7RqPHaMXRKs
 wghZOmaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXEBfAAKCRB33NvayMhJ0UYtEA
 CuoW6Xpnu8TCP5r8IvEk2Ul4i2nMSYjbAtOpsTuv7Bvju45OvWmtzE+BH+PvMXtH2DWTKhnPw2Y4Hp
 z4KhyqJDQ7ClKNWUGgtRyQoOEqn3QCVyJz0g2UfrcYaq6pbZDe8jyiGbzKpM3Z4+yYkIn9Z/onkzDJ
 yBfFGBGwCyLFgPYTrembcKHOty1mGj+aZS40yCEIzaV/rX6Bx5qLyAS6kC7vvbP0HmeaPJUsQDiOqW
 cmufILuWJC3ef391sWp/FLcXQE60Vvz9IyQYc29Ma1t0xRo76jP8Eo43iyTeJdX008kRnLyZn/QH9I
 Ify90WDhOVFFKHOqrdi4TZQSTsD/Ob/Of5P6I9wLE+e51foghEYt8P8wNLMLai6Zmll5gJHPgrcA2z
 N35Q5kVuUL6dnIer0A1atj/Q97GT06+hO5ZISPCOUCwGbjeBYmwMO2AqKqIgvODKXPUqpMtbIe4jsD
 q4ZZ5erYiVt5sd8hOdCYdDSE6TVS508SUSt3Ua8EBtZ88ZJPi4V+nTrR59X8dbUFMEXFDJseNmtUB8
 pBV762lF8xnepjFBKj++7F5SLUXePRJpqY0u4Jfl/h3+IkcpV7qGbisSG+CUaMykgSlRsL99O1H/rg
 /h7wTtjbM/qabCU9vpNW9V36fgbKk49f9KtDOvZvBxgY+w/Wy0iZwMnI+3OQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,ayaneo.com:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: B7FA85A04F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Ayaneo from the Anyun Intelligent Technology
(Hong Kong) Co., Ltd company.
Website: https://www.ayaneo.com/product/ayaneobrand.html

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..1f83979e0d09 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -216,6 +216,8 @@ patternProperties:
   "^axiado,.*":
     description: Axiado Corporation
   "^axis,.*":
+    description: Anyun Intelligent Technology (Hong Kong) Co., Ltd
+  "^ayaneo,.*":
     description: Axis Communications AB
   "^azoteq,.*":
     description: Azoteq (Pty) Ltd

-- 
2.34.1

