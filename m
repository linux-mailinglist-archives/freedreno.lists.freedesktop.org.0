Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43C4137892
	for <lists+freedreno@lfdr.de>; Fri, 10 Jan 2020 22:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCB36EAA1;
	Fri, 10 Jan 2020 21:36:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763446E0D4
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jan 2020 21:36:15 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id c11so1804247plz.8
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jan 2020 13:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=lklv8FQRp8rzT0qNRNej2/Ey5tQkK5RdPZ9PPNXjJ/o=;
 b=tVwGZYrLHNECzGDBzzpsfHd1j99ze2fBx7zZNOtyFK2nFw6cKUh4LRyrx0Hz6aEnHj
 xjL8M5eiKT9bQ5Svg8gNtSTB7J+J509NP+v5mrcq0KuPW/GxKpcJzMDrDMGzv2fVngew
 KIrgphdjT6oefZw6kPFNWrut2XNbjHeI+h5kmXdl4N8z9UGGhxTmUEWUm3GvWhY6hI9A
 5cOEumsNpnAKH4tPnsHuCbTqBWIN77f3lNkCuLqAiEy1Jcemr/F04p8QldizUhpcs4ji
 b/PdhclpGbYxhLnY0y+jjoHZw0e3Rknli3V6Wi1wWlTmEw8gw/tS0qhSXltohRcpI6CH
 DE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=lklv8FQRp8rzT0qNRNej2/Ey5tQkK5RdPZ9PPNXjJ/o=;
 b=UFTRCGe68YkE/dEuuC61m0i7oaXW/v6XTrnuAVZFaGY6pTA/YGemmWN49jrdDC58vs
 YNmUjZwMNIXei16cosh44tO98CFHhlMbhwyYyNm826ufaM9HGBqMlCI1F8vu1KxNGVAm
 a4NDzjbywOmx7WqeGVlThlop74JmPBEYBDJohmOLqCTL0lPAFEg/cT3F7PFThI0OJ14w
 vaQvNRyNdr0QE8pz/k6DucwWMR5YdC5KEBMZZLm4kBqiifnm2DqHnTVm/+fM4ZfHNXB+
 2D33P40yT+WTwpLdVpHMlxrOIi95s/FS2w24x8IILwsFjTZ08ElabUyeO/VJaEpRKlam
 r9Ww==
X-Gm-Message-State: APjAAAXY6ZlAtjZIme0bG0ElXYbxrSCRVr1Z5v26j7wK8vOEh78qkF4J
 3qe/DshnIMXvhh7BXGPIM8TfNtelSXg1sQ==
X-Google-Smtp-Source: APXvYqz6h9roepz92B1ZH3Sq2/HDz04zhQSLuowxmrGyRazGZhV9zcZ4LdZ5NtGc06jMSBOCB2z0oD/pajdeYg==
X-Received: by 2002:a63:3d8e:: with SMTP id k136mr6811902pga.4.1578692174830; 
 Fri, 10 Jan 2020 13:36:14 -0800 (PST)
Date: Fri, 10 Jan 2020 13:35:51 -0800
Message-Id: <20200110213551.59826-1-frkoenig@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
From: Fritz Koenig <frkoenig@google.com>
To: robdclark@gmail.com
Subject: [Freedreno] [PATCH] drm/msm/dpu: Allow UBWC on NV12
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
Cc: linux-arm-msm@vger.kernel.org, Fritz Koenig <frkoenig@google.com>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

NV12 is a valid format for UBWC

Signed-off-by: Fritz Koenig <frkoenig@google.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
index fbcb3c4bbfee..3766f0fd0bf0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog_format.h
@@ -10,6 +10,8 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_BGR565,
+
+	DRM_FORMAT_NV12,
 };
 
 static const uint32_t plane_formats[] = {
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
