Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F261C0644
	for <lists+freedreno@lfdr.de>; Thu, 30 Apr 2020 21:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F746E940;
	Thu, 30 Apr 2020 19:25:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC58F6E47E
 for <freedreno@lists.freedesktop.org>; Thu, 30 Apr 2020 19:25:04 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id d184so339187pfd.4
 for <freedreno@lists.freedesktop.org>; Thu, 30 Apr 2020 12:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LWzoBfWYBplb188JYPfec8yiO1FAiglsQQs7ha7y6zc=;
 b=zvIhEeo6o5Oci/1eDGxIxa70cqZyoYJPXylX1Jz8dm4uPN+VdUMi5dd63F1duzrKjf
 RbDbL4orJsgYwq7Nj0UTh3yQbN4K0xHm3MIzvy5ZD3vZU2dEZ4WTK5ZSvBz/KhNhDNRi
 iq4ZR0E2/FCU5UX9o2YRqOluF3k9408xQAXoHNf8e9LxoECnH5HXqwOJ0rv7LjXnhyyW
 yS/J0pcItyBpgwidW4/F9usyFm2BZPVgghgNjxRdQThOIQoH0bSYmBNCHOuxLIXuzZaE
 8kNRwr8BxYU8I87WPqhv6VIAhcrOvoocf9qPGC8gtHNJf58mlCE62qWRAmVLrpUHxnod
 A6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LWzoBfWYBplb188JYPfec8yiO1FAiglsQQs7ha7y6zc=;
 b=TDUYMaodbr8IKMXsD7IDiWTs4wrG9Ct4RrnJhKtPIri91hgxT2rJcj3mm3siBaFMr2
 pdWDZPEnL9opLPR6LLH2Ggv4ASLqAzs9LMfsHD3DU97xvr7D7yi2SmSyIIQeWU0fpQjM
 nCAhie6RheAgM+LutGGcZFRgR59bRLPFVtig5n/17ywhcnVNYVdbXmN94Suptf5nZpL4
 OuRuXPi+ozjvA8wN/FxkRVaR8+UJz8DA41c+UufKl55xm6PddkG41kKT1z3P1ePIF4E5
 e0nknPj+38AW2pjc29I99W2n7aXXIOwBDrJeGOjQDk4PoHpELi9eOl5NFFKRf5go6RFr
 9tlQ==
X-Gm-Message-State: AGi0PuaeoZbOfzf6bIUwtnig/zjj4JDo80xvVNay9yau12HAndHQ+5Ml
 VDXMvzvNfSX9BN1c8mC+s5FKJg==
X-Google-Smtp-Source: APiQypLCsVX9Nh3B0wNo8iNCW3Dh7d+/91P/QFHKJM1aSTI3VdeXI7wM5INe9jYGfLmdFCvuIRM2Ow==
X-Received: by 2002:aa7:8b12:: with SMTP id f18mr271949pfd.81.1588274704103;
 Thu, 30 Apr 2020 12:25:04 -0700 (PDT)
Received: from localhost.localdomain
 (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id v26sm463594pfe.121.2020.04.30.12.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 12:25:03 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jcrouse@codeaurora.org>
Date: Thu, 30 Apr 2020 12:24:27 -0700
Message-Id: <20200430192427.4104899-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: Fix undefined "rd_full" link error
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

rd_full should be defined outside the CONFIG_DEBUG_FS region, in order
to be able to link the msm driver even when CONFIG_DEBUG_FS is disabled.

Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 732f65df5c4f..fea30e7aa9e8 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -29,8 +29,6 @@
  * or shader programs (if not emitted inline in cmdstream).
  */
 
-#ifdef CONFIG_DEBUG_FS
-
 #include <linux/circ_buf.h>
 #include <linux/debugfs.h>
 #include <linux/kfifo.h>
@@ -47,6 +45,8 @@ bool rd_full = false;
 MODULE_PARM_DESC(rd_full, "If true, $debugfs/.../rd will snapshot all buffer contents");
 module_param_named(rd_full, rd_full, bool, 0600);
 
+#ifdef CONFIG_DEBUG_FS
+
 enum rd_sect_type {
 	RD_NONE,
 	RD_TEST,       /* ascii text */
-- 
2.24.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
