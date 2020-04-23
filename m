Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CBF1B65E1
	for <lists+freedreno@lfdr.de>; Thu, 23 Apr 2020 23:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB9A6E9D5;
	Thu, 23 Apr 2020 21:10:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8E36E9D5
 for <freedreno@lists.freedesktop.org>; Thu, 23 Apr 2020 21:10:25 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id ep1so3672678qvb.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Apr 2020 14:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OznIskxLEmtu/QkMuofbi8Hv/l/O/vY0LWIonX2v6/0=;
 b=HDWmhCXgHFsTLLcphP+WIWEuRTazXG+nj2IFryAZzi3LaKFikQ/kbEw/1eYYlc2EAu
 rlP4a8T01kvPycC/L1jIKc1649iugOK8bkpJ8pGnag6+oQL5Q/t4g6X9wJdyYVgs4E6Q
 Wm89DH254gNh0jJN8vwAhwNU2+uZklXZ9Fb13437bsjht89uyP7lAJFiu7Q0CoFky9pO
 6mXRG6P3x8paQ6Px1wteHecOTrIUk5c6xnkkyvJeZWos/i8VAYVMIRLwMDNi/s4Y+tjf
 ERiDEtmWqdrLzkzQMZlgPFqaKz6de/3Yepocg8K0oqllyqj6P8aj2p4rppkWcFpIOnUV
 iU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OznIskxLEmtu/QkMuofbi8Hv/l/O/vY0LWIonX2v6/0=;
 b=WjEwvzVj7S01n5O02nxiq5FVvUNP/lW/kPluR4tOigQLhaInyTJk7kuWpH9o4mPC3K
 zRcY956ziE1/B21ImN4bUVcC37/fRk2dLA4NJZHIOwzveDS/jb9DDHbWaVY25sQtFF3Q
 no95U5vIhU0KGI87UGb61H1iKJWgnz7io8jHC9eDFmO437nq8KBS1KUX9Z8KGoZxccMa
 aLS/hJ+ZUzA/26R4W0CkNvK3bOIjNdS0yNd4+mDohJH9seGeFV5FPeIuTNouS/pWJItF
 Z069Co+bp+56gMBfju5sg0J7qTMSFSWnz7FkYRyLD0ftwNjrdJry6gewwSZtFuQLCMWp
 ByyA==
X-Gm-Message-State: AGi0PuYu8Y+awjeu9vscY9DOHJ+Z9n6QG+npanPIjz9HOAuE2jiSWkGe
 Ggtq7vPHpPwEAUGl8XUDtC05g+VYDnw4+g==
X-Google-Smtp-Source: APiQypJlblvSwiOiCVaavRDtMFgfWWKA5keisrxO/bk8aKribOb5caIEKhyujQ4BrBPl7LSzI8qjCg==
X-Received: by 2002:a05:6214:530:: with SMTP id
 x16mr6061009qvw.55.1587676223869; 
 Thu, 23 Apr 2020 14:10:23 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id n4sm2341495qkh.38.2020.04.23.14.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 14:10:23 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Thu, 23 Apr 2020 17:09:14 -0400
Message-Id: <20200423210946.28867-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423210946.28867-1-jonathan@marek.ca>
References: <20200423210946.28867-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 2/9] drm/msm: add internal MSM_BO_MAP_PRIV
 flag
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
Cc: Jordan Crouse <jcrouse@codeauorora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This flag sets IOMMU_PRIV, which is required for some a6xx GMU objects.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Jordan Crouse <jcrouse@codeauorora.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 +++
 drivers/gpu/drm/msm/msm_gem.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d8f56a34c117..6277fde13df9 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -428,6 +428,9 @@ static int msm_gem_pin_iova(struct drm_gem_object *obj,
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
 		prot |= IOMMU_WRITE;
 
+	if (msm_obj->flags & MSM_BO_MAP_PRIV)
+		prot |= IOMMU_PRIV;
+
 	WARN_ON(!mutex_is_locked(&msm_obj->lock));
 
 	if (WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED))
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 30584eaf8cc8..972490b14ba5 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -13,6 +13,7 @@
 
 /* Additional internal-use only BO flags: */
 #define MSM_BO_STOLEN        0x10000000    /* try to use stolen/splash memory */
+#define MSM_BO_MAP_PRIV      0x20000000    /* use IOMMU_PRIV when mapping */
 
 struct msm_gem_address_space {
 	const char *name;
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
