Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA56FA45936
	for <lists+freedreno@lfdr.de>; Wed, 26 Feb 2025 09:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E91010E873;
	Wed, 26 Feb 2025 08:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QkmxyfaR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8575E10E873
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 08:59:42 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30a2d4b61e4so48084321fa.1
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 00:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740560381; x=1741165181; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
 b=QkmxyfaRDwRff/DKixkuzls15wFUBRugACHhP3gfPjppeNndXWTLsgp5q2/vCSQJ3j
 7zdSJEMU/Bzx3DVVU6ZCcN/bFwhJLrb0bIpP3ChXfsJjOUV65nd1AAQJES/yCZ+yIhkt
 tIycrAZCASrqFlORL7kHeBx/3hWltGw7Spo0taJTDoraN7nsTD9N1Ze1lULjjMpGL09I
 8xPCWsWUeEXb3FBdhI4rSxAsEx4Sgawq/uLTE35eOqP7TuHTCIXofVk6CdRrVQUlRya7
 NXw2v+wMo8LTEKkTcyOwaKlrSG0sf2WofQ6yvLYF96/mqnhvrZWXYFUWrpFSg9efQjAG
 Zlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740560381; x=1741165181;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHcNOzm1hcrclCZti3P3V9XcVq0n02C20x1XRNCo8a4=;
 b=nBz77Ot60poiZ1KFO5cXlsD/QDwBoNNzClatlLDqMatP3lsNOKrgLYUZcBlfXsJYET
 jb6/IrxsaD8NJJMqDcazerI1C8bX5+mdYbkTVLfQ3mh/jxnqX9AfYuEhRSUfEfY70LKl
 WInVTIe0dUjYSkRvSUKTZeOSvWPKLlbFQfIQCjau/Tw3AnUWciHxj2owa5s6aMnKVBqO
 w5tXiWhiTeONh3kNTgfur+acSNNZtoGfkQMk581dTj9eW33Ands+WAY8zLcKqBC4PPcY
 SdIB30mZ+ByshxvMSzPhFb7rRXjM0Pg991FdWBaYu44LzMladr/Q8K/jqrGsPKq1AGXd
 J8Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzMUhGCAj6CcI3KWQCgQQcKHj7IyDC3fa5Qqa/XMjjc/3C8mWC1nUWLam9yNg3Y2+FqA4G7B39st0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzVgOLfbUWzjuXGdPi6jt5zRx6QujxD/1NjuOIj2X18AUkeizn
 sWLluBaghExAC5tS2jQRhqa8vkCipP7P4Vj9YBFS0LF2Fm29Zdkwv17mAB6lxjk=
X-Gm-Gg: ASbGncvv0HFqG9enwNSfZRQ2lKek/64qoZd6GvmIUG9GMJ3X7V2ehsbQwuiQcNOltqi
 Wvdt6LeExb2Qq5EzySmUDwXjdtF2LrdzyiivZHf/O6VPC7IbrnkOsONhb8gsEee5yDgcywDTjeX
 K4qTJOf3weZMAOGu+MyzBoSlfVX1d01ahJsyCr3/dWdS5HRE57e9YlePvPyEGh/EQL51yOoA9iD
 2C0oD6sDI8S+YPhXI95lqnJ8UmBCKlSpdpwEHcL9+1myiLRgewiHht+UnKbOHswHjoV0jE+5Nw3
 J+H0l8JBNi7UyrSLfvduHiTXQMG6vYzjbg==
X-Google-Smtp-Source: AGHT+IFIstiUWb828AgIqSu/ljVx7698UENLpRl0AsY21WG4mplxCihJ20chMJifNN+VTAFh8RwL3Q==
X-Received: by 2002:a2e:b609:0:b0:308:ec6f:7022 with SMTP id
 38308e7fff4ca-30b791832cbmr23531521fa.17.1740560380799; 
 Wed, 26 Feb 2025 00:59:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 00:59:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 10:59:28 +0200
Subject: [PATCH v8 5/7] drm/msm/hdmi: update
 HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-bridge-hdmi-connector-v8-5-340af24b35cc@linaro.org>
References: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
In-Reply-To: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KlCjBmWN3HQI30P1/iEnVtV7zXNb45CFcF9NRTzfcWY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtftzKFbgYCMbYXDtuTbkps1sLO/1BiE+TJuB
 fQwesvAqTOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7QAKCRCLPIo+Aiko
 1TsuB/4pVV9CMv49UiMTJIEgL+qiw5buub248rfTYgGygTN/itp4QgFwwr0+m/bI+EZhR80wdXe
 SeTxFF6CBjSL+yR+/JP22/h73WF7RhXo+92/5L+l57liwAENoxErqEu+5X19KIwKlbxnXRNh007
 YEA9AUa3SFYTENk9t44L4glEILLtjW15xp5uR+ImONmslyIE3nB2sIKusOUr3VGXTY+AAMCTNt9
 nfPZckgIIHRwEgyAFl55ZRscpnOgLWSI3mLS9pWbEPFqhOL9IPnVoJ9z5jcApJJiUhjuj7V1nX+
 BApcipfWgqtuiNniAYB0g+s54XmYhvEVgrj/okw70eq6ru7s
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/display/hdmi.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/display/hdmi.xml b/drivers/gpu/drm/msm/registers/display/hdmi.xml
index 1cf1b14fbd919e041fd7ac8a0731d554d4468f4f..0ebb96297dae80940dc8a918d26cd58ff2e6f81a 100644
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
2.39.5

