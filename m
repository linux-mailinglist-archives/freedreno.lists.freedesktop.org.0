Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17AF8D6A6A
	for <lists+freedreno@lfdr.de>; Fri, 31 May 2024 22:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC78610E4BD;
	Fri, 31 May 2024 20:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rsnNlUED";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7184610E2A1
 for <freedreno@lists.freedesktop.org>; Fri, 31 May 2024 20:07:38 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ea9afcb22dso10676641fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 31 May 2024 13:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717186056; x=1717790856; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TkMzRYwH0rVG++I7PNZai1lbvWhZpzJwskrcS26a0W8=;
 b=rsnNlUEDh5bxtXG4+MQn1XkrC6gOUf9ONKbFd7KnlhGYt68lEv6JLT+E0RXVT8C0yV
 TdpOGYWIwWb502Xd5op3cqn4eEro9dphW55NCnzoGYwNRud5us6sh4rvIM1u6ZR/Mfex
 eNXGPiNrzJVlGPLQ4APdnXt9AKdS3kM9j0NARlSQUGLhAHjayFzd78GrKsfEuN9hypn9
 IjTJo0wyX/B4yspAUN2LHAIF+JaTv8o41jCRJKuBS6z7d1nsFRD0KEXZeN13s376bJ5d
 ndbcxuZV8gvpaZqB9JOHUCwdqQDXga7lD5J1ObEKbHqCbQv5xv7ZVcMpHIRIzuCP20Qe
 xPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717186056; x=1717790856;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TkMzRYwH0rVG++I7PNZai1lbvWhZpzJwskrcS26a0W8=;
 b=H8oqWRP9kFjW5jI/kjQymf9nYPgKE/pgizm4XDlj5YNzp0aGs1OhHYx9VBggqrTMr5
 37zvL/ds/7gAJq6MH8TwJB3SQKmSbwNdFD6bS+aJFGC5VGuuN+mx/yEoGmpniQEaOT4L
 SbGOKZ+FthDdx7L22KAsn1ypF9/6UnlDeGeaSA6C7a50+GUa5ZebBL89rtbiYPs0Q026
 gQ1RRv9gOHnrFwhjmPFBxr2mU6qk+OYoNLfLd+l+gHwr3fzpIXcs5hsakBENodBjbuzQ
 4DyTzhZSMYvl06FnIRmHKIY6UTi8gnl74RGPQewL3u2i+FjiL/gX/p7dt49Kx/30oQQD
 4tbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYEcuv7aG1fLPmQ8fc4mK1gLPfNpMIpHYpbDYYg7UYkziXj+a+Fuvc6O9BrJXa3TqS+OpGkSE4/Tdbteiy2L3Y8/EuWeMTYMzVpaZBaN+R
X-Gm-Message-State: AOJu0YyOiv9TUWHo9D4bb57YCAi7Y2dvUjlC4j7A33WUmI3vEQUqtA/S
 ymx8P0K5DZLJyoAgjKl2+yVzP2U+aDHS5Mz4+pBPzHy9vNYP7PtWV6lPVtb4Itw=
X-Google-Smtp-Source: AGHT+IGIMq/02fN9VaMxPRgQS9gadWvjnFmtbHVzXgej6CyCQ5quwaOEwoTQOwiyLNKP/eeCiAydgw==
X-Received: by 2002:a05:651c:2112:b0:2ea:7dc3:bdc with SMTP id
 38308e7fff4ca-2ea951ddecfmr30202261fa.40.1717186056564; 
 Fri, 31 May 2024 13:07:36 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 13:07:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 23:07:31 +0300
Subject: [PATCH v4 8/9] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge-hdmi-connector-v4-8-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
In-Reply-To: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JXbaAkUfXwOLePC7VJ3jRbdq5WguoXJxRCdZfMDCGD0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWi4B4ZlhVOmXUjUHCWOqtnSa7ILwA7r/cU3H9
 cpqQSneAaOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlouAQAKCRCLPIo+Aiko
 1VmSB/47l6orxp3up1rfCwe6PSVlP9Jfe6KD6YbCaGQ1HbSxcOEBCOUor73qVPIK1d5jN61Sk0b
 6/vcmaA/8ip6UhoS2yfneatbS9yUOksIQeJqN1rqAqTCUGYFKKtesmzdo4v9g6lCOlsoE64l+SC
 dlXfxHwBOx3h0RV3kvTrmSU75ugnl1LnjLsEYGgbapjupaQK6rKrmC88/mdjK++P+gh5fKSKgKD
 0SKf4IPVIr50Pu4lJVZh/HKgrzNF/ubBRVMhQXARdw60pShnSL8PTMsbcMb6WjoXwhTus/tjbJ+
 dBdzTv8eYSbgRDv/3FMYPp+5dpdbUQLsKSOfR4INxPEgf+xr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The GENERIC0_UPDATE field is a single bit. Redefine it as boolean to
simplify its usage in the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/display/hdmi.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/display/hdmi.xml b/drivers/gpu/drm/msm/registers/display/hdmi.xml
index 6c81581016c7..fc711a842363 100644
--- a/drivers/gpu/drm/msm/registers/display/hdmi.xml
+++ b/drivers/gpu/drm/msm/registers/display/hdmi.xml
@@ -131,7 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		 -->
 		<bitfield name="GENERIC0_SEND" pos="0" type="boolean"/>
 		<bitfield name="GENERIC0_CONT" pos="1" type="boolean"/>
-		<bitfield name="GENERIC0_UPDATE" low="2" high="3" type="uint"/> <!-- ??? -->
+		<bitfield name="GENERIC0_UPDATE" pos="2" type="boolean"/>
 		<bitfield name="GENERIC1_SEND" pos="4" type="boolean"/>
 		<bitfield name="GENERIC1_CONT" pos="5" type="boolean"/>
 		<bitfield name="GENERIC0_LINE" low="16" high="21" type="uint"/>

-- 
2.39.2

