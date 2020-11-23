Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391E52C0409
	for <lists+freedreno@lfdr.de>; Mon, 23 Nov 2020 12:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EA689683;
	Mon, 23 Nov 2020 11:19:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6056E89683
 for <freedreno@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:38 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 10so17529988wml.2
 for <freedreno@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4O9Wtg4ERk7UIKuJVRpIsYKCPive6atwfzd7DqykwOM=;
 b=Fv4WcU24S/mVuirgJJoD8NvlY3hjP06GFhM7tn1pNlSPQQHYkea0xN2LruNIN15ZHV
 wP5l4G3ZNipBvq5duw+OF9G4nJ7sjT303l6Rw2EkYYO8O7MQ3iqaY5PccncHX8gqiq3E
 V8Sf5cxO3BTT156CJgZT45SMdIEYG6Uv0D57dmy7+HGFzdjblGyacZ0KWpfvwXO/2vcI
 bZacMpgn8g/YiDQayXVV3KUx9+W5Rf1U0XJ724yAVa/y8SgXO2Z80tezZMfm5DMxUN5n
 ZtR9YBg1LT8PSnJmE3XvVSZEbQ+YFFOtsnD60T43tdbl6dThfdsNpzPI4i5xXk//Qs5l
 kJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4O9Wtg4ERk7UIKuJVRpIsYKCPive6atwfzd7DqykwOM=;
 b=DQpuUdKizBjCe9mlkjQ+gzUDysnZWfHwnslgCpc9tC1d9sVcGo0BAOnRHagrdLS6Fe
 t0nPU1WLs72miHNK7bwjyKPPz0XjIIlb4kwMovdu7UxktDXUCVjbBejEV6IGd4pAghT7
 D8OL4xyttWLsPTstJRh19SJx4C84ItoZWhTRSrRRip4ZeqALGna2b09H7heVvC54W9Tk
 IwvlZe21VqLVU+HijYE64lO3G8UQCaC4Kfvv5UTFExHx1/E30qrVtRg41BymTp10AFvT
 qRJNxQgh6dclUr9roc+ylHguHF93j8lLBgcKkJKGqRmaParqKdZ+JI+Sj30+ZJb9TRIW
 nxoA==
X-Gm-Message-State: AOAM530zNaHQu9YBwEegNLeaI//tE8CZ35Sfo5S/T16JM49UqPvgm+jW
 dC60qg5oRCLEQMfArj15oINi5w==
X-Google-Smtp-Source: ABdhPJwqwvKgR7IXqRKhLFtae2xL4mkcspCLvAPV8ZXfa0zCpU98VktxupX7MmluRrNJDbEzVPxwsw==
X-Received: by 2002:a1c:f017:: with SMTP id a23mr23703118wmb.56.1606130377058; 
 Mon, 23 Nov 2020 03:19:37 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Mon, 23 Nov 2020 11:18:50 +0000
Message-Id: <20201123111919.233376-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 11/40] drm/msm/disp/dpu1/dpu_hw_blk: Add one
 missing and remove an extra param description
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c:28: warning: Function parameter or member 'hw_blk' not described in 'dpu_hw_blk_init'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c:120: warning: Excess function parameter 'free_blk' description in 'dpu_hw_blk_put'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
index ca26666d2af91..819b26e660b9c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
@@ -19,6 +19,7 @@ static LIST_HEAD(dpu_hw_blk_list);
 
 /**
  * dpu_hw_blk_init - initialize hw block object
+ * @hw_blk: pointer to hw block object
  * @type: hw block type - enum dpu_hw_blk_type
  * @id: instance id of the hw block
  * @ops: Pointer to block operations
@@ -114,7 +115,6 @@ struct dpu_hw_blk *dpu_hw_blk_get(struct dpu_hw_blk *hw_blk, u32 type, int id)
 /**
  * dpu_hw_blk_put - put hw_blk to free pool if decremented refcount is zero
  * @hw_blk: hw block to be freed
- * @free_blk: function to be called when reference count goes to zero
  */
 void dpu_hw_blk_put(struct dpu_hw_blk *hw_blk)
 {
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
