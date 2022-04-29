Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3275E51523A
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 19:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BE610EEAE;
	Fri, 29 Apr 2022 17:31:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6D610EEB4
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 17:31:54 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id p12so15272008lfs.5
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 10:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N0kkFtjr8AAODbzY6xXTEuPCKSjxOceWVMdgDTFE29s=;
 b=mgIC9mziFYsMyFAHOYErUONAUawV3Zg6+lF8pT/M6IY7fvSpudmNbt4xMfL1Vd2RZx
 GRbqYgrUPkpUb1qIgmFCl6xJfsXc+8QBV/bZoVyuCFU9lyvOvItgw59wlPOkLOyEx1eF
 NBBZ6U0kEq0EsOP1AclJls1dMXQKtiyFRh/C0aj18X2kqqSZfC5FI+dlQF6XC7Lnst0D
 GVthXsYt+FAc9t+OJroj/dn/jrsfrIz35QU/yHkVBuNOUt7r5YqIBqhYCUWp2leSjIGF
 AXZ0AZePI0Yg/9Yp6om1xQ5NmkFLw6YKQZQtDp/u5C92+dDSXqKCEwCSytQZPNLzqGNl
 2jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N0kkFtjr8AAODbzY6xXTEuPCKSjxOceWVMdgDTFE29s=;
 b=nzK7VP/M9xK1noUVQ6ue7kKNKlabAdKg/uImJ3pm5hrQYygHWF4h+OUKqObhIbjw3g
 eN7LRr+ZB/a8LphpZU/YicRM1QDdvaNog/YyIz2PLonQ6ANUGh9+/nCerCBZpE+WoGxO
 n0v5yBtRCpUR/18s3fLwMfT+G/ynGvNDTwI0wPvNpAm4fxSxvUBo4SVBes9/Qm6oJRKj
 4ozhkHYLPnhkKoMphpAv7uwsOhk2UrEugNfl2ezuWsdzI+Ow9/G6J5pUbZFdsm1J7cFO
 XZznjtQfIIg1Br0OguKxcrc9V5Zot0GCNKdjH5ow8PsOuI2qZN+kuPAs5eDLWxcGNlbR
 x21A==
X-Gm-Message-State: AOAM530H9BmYzbwNJiqttC/IcbvdSgQnsZto+xlX6FtolGTV+K9U27FL
 dlv0LFstlyFkoYEB7dD7pVP5ug==
X-Google-Smtp-Source: ABdhPJw8gix5aeuUfeN7PkSk0yv5kUFc9OzEkRCT9VAiDCM3AZPANunBQCFwT38GwbnX95LzdG/twg==
X-Received: by 2002:a05:6512:3052:b0:472:7f8:f344 with SMTP id
 b18-20020a056512305200b0047207f8f344mr222161lfb.380.1651253513254; 
 Fri, 29 Apr 2022 10:31:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h7-20020ac24d27000000b004720819b691sm284731lfk.130.2022.04.29.10.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 10:31:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 29 Apr 2022 20:31:51 +0300
Message-Id: <20220429173151.3645415-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] MAINTAINERS: Add Dmitry as MSM DRM driver
 co-maintainer
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

For the past several releases I have been assisting Rob by writing,
collecting, testing and integrating patches for non-GPU and non-core
parts of MSM DRM driver, while Rob is more interested in improving the
GPU-related part. Let's note this in the MAINTAINERS file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61d9f114c37f..3d7c7d6b0346 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6255,6 +6255,7 @@ F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 DRM DRIVER FOR MSM ADRENO GPU
 M:	Rob Clark <robdclark@gmail.com>
 M:	Sean Paul <sean@poorly.run>
+M:	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
-- 
2.35.1

