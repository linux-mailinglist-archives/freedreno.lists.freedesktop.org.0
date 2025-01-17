Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B313AA14B8C
	for <lists+freedreno@lfdr.de>; Fri, 17 Jan 2025 09:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A33310EAAB;
	Fri, 17 Jan 2025 08:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y7HRUbs7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABAF10EAAD
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 08:56:51 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-305f529a987so15250381fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 00:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737104210; x=1737709010; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=VLM1E94zeSWa7OSuX8gMRqzReFqeBbOp8I7gc5sLd6w=;
 b=Y7HRUbs7Pcip2OMoAwVMISV0ddnwp+bWbgzoRsx2ZPJH4znlg4zgpCF0cIcEaOgQB8
 S8po1ME7eoZgfex7iffdXN//NJqjRmTowUsCmFVIDorqtQi4tB6x4R5M6+AOuD5wOdPk
 ifZEuoxg+EnhnOL8HGSLN+xQeHTAzCF7xZXPzOdQMJsBY+bxQE1K6USXLG8cCqp8vcV1
 TuJnaiRCdYtno58Q6c3jr8ZN0qUg/TGbFd1kq3YcCuL6T0SjITz8yKvF45+CLGMX3eOO
 9BbtQDJTazB6rOIwwfwNXm2QsDs8/oUi/iesnbPU4rIpXrQZU1Gkaz+Hw2QDEUpmgAgK
 KMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737104210; x=1737709010;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLM1E94zeSWa7OSuX8gMRqzReFqeBbOp8I7gc5sLd6w=;
 b=QZjdM669bjPulgK3O53VDC6ATjzcrjtw2lXo+2uDfXAgY9Nozzhvop8drQokPfhsXX
 l4MOBPh3jFV8PlxDU6AI7ezqjm7U6xtNgaqQxXNWa8/UZw2vlLR1oRTZiwN0PLanfB8Q
 CwtyFmKFz5A7j4JmYFoTcO671sBTmVlKloCJUtceHNfrw7LFX8DDEQh0zn5tdqMr1LBf
 HXWE/PFY//Ha4I0+ywMK7hyV48DoQak2nLR08eh8/jiPyAAYRd4EeaaUSREWgLgsWlr5
 xVE1W1/7daD2z148psjTF/mW1PD549VEN4ZdNnAT6t7p7S8l846uNLrw7tA2WFgAxItH
 uxSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXBvCAsmv+SGj9zQp4GR+fS6u0mcNhRzvuBZEpPeB6VfkYa3lfjYv+ovc5l4J/PyqWT8GslTZNb7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyfGwdqSPxtCDOi7jCzvKLyHOyAr48jHFLEfrcLER1Cja72Imn
 XR26xPTaJYfo/aaIsJPV53X3sxidl6EaR2MHll3tjozv6Vjuq56dUSEfhgCFE6Q=
X-Gm-Gg: ASbGnctW2o3CnVjjPKy5g+pDi9LSwvwbJDcePccYAC9u86Y3k9Np9w3bsoac432SmMD
 Pl3iAVSbs7oWuqSOb5BHafhrJcmV809+SjwmfHzvdy2zyxJg+wuG/C3MyB43mpikrQ66+FkWtfa
 yvz09kF6BeVcPbiHaNOwE9+UP+1QIZ/9IXNH/0YTxktcTFNfHixWpkQWwCjt2Jcpd5Ygc2daa5H
 Nmue7a89uEKxnRzqEDEzvIQlMfUNnuJvWsO7Q2fZZrBcdbQ19yEY9sH4iK5udXz
X-Google-Smtp-Source: AGHT+IFBojLKFUsRi46jxUj/82lpPoLlFcmw7BAFGVljTWhsMBbJ3khzAeUTmD1KdTt251Lb09lVSw==
X-Received: by 2002:a2e:b81c:0:b0:302:251a:bd04 with SMTP id
 38308e7fff4ca-3072ca88ffbmr4931551fa.9.1737104210175; 
 Fri, 17 Jan 2025 00:56:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 00:56:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 10:56:39 +0200
Subject: [PATCH RFC 4/7] drm/display: dp-aux-dev: use new DCPD access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-drm-rework-dpcd-access-v1-4-7fc020e04dbc@linaro.org>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u0enUT6rCyZ8RqHzkNWyQVgEzKAZFsn/cehDhTu72TM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnihtFPa5XPtqF5ObSemv7vpAvzUlPQNy8VMpjv
 RyX+pGyC/iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4obRQAKCRCLPIo+Aiko
 1QRZB/0b3sThkQAPK5Beb+5Pf6cn7vHPGIu4Piqk8s/CE8IKzDU+27jDQ/KOgIcLM2BOs2vmZRO
 Zb+L/0xMQ9kLSlMyp3NFHQgEBlO+Aykl4la4dDQlxroc5GjAHq5a0kE12q/R+uEhtIuF07wQg1x
 fEAQqzuQKE3zaFrKVvExUkljI4lnB+mKBBCKKLgnuCYwGcmdP6lD6AYqD7JZY1JvBCK3NedPORt
 O1972W2CsHJgB6bG+6JHa+l8s81kV1XjdIQE+dVGwLN8SYUp8BhKDlVSml67E0+KzneY1GoD3Qz
 zZsiuc6wSv2wOm9emHzfTlD7MgX2pW/EVxdGt16cNyjCQ0y3
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

Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_aux_dev.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_dev.c b/drivers/gpu/drm/display/drm_dp_aux_dev.c
index 29555b9f03c8c42681c17c4a01e74a966cf8611f..a31ab3f41efb71fd5f936c24ba5c3b8ebea68a5e 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_dev.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_dev.c
@@ -163,17 +163,16 @@ static ssize_t auxdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 			break;
 		}
 
-		res = drm_dp_dpcd_read(aux_dev->aux, pos, buf, todo);
-
+		res = drm_dp_dpcd_read_data(aux_dev->aux, pos, buf, todo);
 		if (res <= 0)
 			break;
 
-		if (copy_to_iter(buf, res, to) != res) {
+		if (copy_to_iter(buf, todo, to) != todo) {
 			res = -EFAULT;
 			break;
 		}
 
-		pos += res;
+		pos += todo;
 	}
 
 	if (pos != iocb->ki_pos)
@@ -211,12 +210,11 @@ static ssize_t auxdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			break;
 		}
 
-		res = drm_dp_dpcd_write(aux_dev->aux, pos, buf, todo);
-
+		res = drm_dp_dpcd_write_data(aux_dev->aux, pos, buf, todo);
 		if (res <= 0)
 			break;
 
-		pos += res;
+		pos += todo;
 	}
 
 	if (pos != iocb->ki_pos)

-- 
2.39.5

