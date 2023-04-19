Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9966E7D27
	for <lists+freedreno@lfdr.de>; Wed, 19 Apr 2023 16:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDCD10E9F3;
	Wed, 19 Apr 2023 14:42:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CA510E9D6
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 14:42:02 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id gw13so17239344wmb.3
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 07:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915321; x=1684507321;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TNjgEw1XFUwnMr96e+2CQ6Lo6q2FDtNyKhqD3dmTUrE=;
 b=4LuBgs9yLJSinqw8HSRzEzngPmX5hzcqhMf7QTeuslRyOioxSoXH7W1tHLPFVxL8Dc
 LKPzpPKd7dgx+TNyX9PyRaBjvqPW0nmct4PZ7GltxoAb0fWMBgWEgvBl5vVBVuxGQFYv
 MJ6vDW/SShPCy0/rw1wLYMJiDyk5Hvf5QbaefGOwazZPNGr0ynmOWszW+eNNydmSaXGT
 xzllUv1g1NPH9oFVmm7w/81fjtbJfJd3lm7gT735eTSwdtHtsdwJmk8Qfra9H4une67D
 W8BbPPVyYV6YT2A/mFNcFiRECiJ1eO4/AV/hWJYIKltcABnR4VBLce1ghxewvHpjG9cw
 +iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915321; x=1684507321;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TNjgEw1XFUwnMr96e+2CQ6Lo6q2FDtNyKhqD3dmTUrE=;
 b=dW76OsUZdxgEDPVdOf7/gjgFBrPaHkbMUbBJ5P4ToBL0Hn0WhU+nR60k7iaCNxE+Mt
 ScawKVly7/0xAn+r/2KoBMBx/NVhi/2kGgB9q81dP3RLkeX/eMN+VBQSoYiVu+4GJwUv
 WygWE8S57RFYBnlcEDe0LRJ6bzlqJsVLqKi6/hKYaDL5v33wPX+fvokbmzvhEp/FcgUL
 hfRigNVu59aZ9cNJZ38dM2ot8lOeEggMtsb/1ZzLgwJvpaS05eAeBSxxoKozBeVp6CEY
 M5YPAsCshHsVMcqzMcxvFnbd/YIG6yTrC5tb0cgmKWaK0sV3vVIX015A6j2oFSYuc39+
 4NXQ==
X-Gm-Message-State: AAQBX9cFjtDzZLnp6wevbWb4oubo+ub9+tk9I0HjzFdwwzOqiZfG/E6P
 1q2+8JotNDJyFzrC+qj8HEk5myaO61hgSFjSGA==
X-Google-Smtp-Source: AKy350YIZQJc5mHrOF4rjTE+t8DJKPx3mv8uZ6JW80wdo5VzHFNPb+JI8VMqvJYSCsJjOCkMBCPsCA==
X-Received: by 2002:a7b:c7d4:0:b0:3ed:418a:ec06 with SMTP id
 z20-20020a7bc7d4000000b003ed418aec06mr15495212wmk.28.1681915321030; 
 Wed, 19 Apr 2023 07:42:01 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Wed, 19 Apr 2023 16:41:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-11-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=774; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=eCHzSh6ygzKMrynLk5I85+wK8ZD9bT9L4MBgozHvN38=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2wtV1Bh/RNv/ZG/8M0oZScFy8jinYXpQd0Z
 l2D8Gf954aJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9sAAKCRBxA//ZuzQ0
 q1UJD/46OiGy56oZou1FdqKU/7l7QduKNHg/kGvjVQ6ejPCZbi3rN1/KsuGcpsfBDYnC9kEplxb
 uvdYGoJX7RbyRfP0M3er/R6d7fMOk7+uwCXDmsyGn5VfJ7qpkCgEutRG5O4KWV1oeiMna21h5F+
 DxVJuA2pBpUFw7JjL6fGQh1Sng8FWO8Uzcf391FHb3cK0xFZv0KXlAZAx4c6OpodRauIXYXkNd1
 Jcu5WViknxy5Ftn5+rJxEstwF7C63jyhlPLrZhjTyKqiCWVfyFXjEWAjGFdr/TkXh5WAEjbhSSt
 mU7nNxVjPtdxR6ie2B698VBZj3If5GylQw0/7BVI1Lq5qUA8eqzENzlcX+r6s3G0Lliqr3Zzl6F
 Sb1WxTjhcgQTYWU2Lotuy1lRuydJoEpSDSBpTnF4/agODy2JryUMyueEMDsy45r/1JSHkLKGNWY
 Pxle7Moqu1T+SjaNR7FQcs0TaLpSNvLGdjSregG/hZjCAWYtx8IIfLuuMKYRUTNLJ8X7jpS3E4t
 if08fYjYLSdG8uEyrg8/r7C4/A8NbcuuGuppH+nYYs/fnrfZguQQ/b9w9ZqLB08fs+zi0Ofy6Q7
 BWH5IzsYUYPdCf1/YN9bRJVoomXeRs5JSezRgMaF+ItDKS+kvI7o55nypbz0Ktlkt/IdxqkEhso
 yRJYDH3EDrznDuw==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
Subject: [Freedreno] [PATCH 11/11] drm/msm/dpu: do not use mixer that
 supports dspp when not required
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
Cc: Arnaud Vrac <avrac@freebox.fr>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This avoids using lm blocks that support DSPP when not needed, to
keep those resources available.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f4dda88a73f7d..4b393d46c743f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -362,7 +362,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 	*pp_idx = idx;
 
 	if (!reqs->topology.num_dspp)
-		return true;
+		return !lm_cfg->dspp;
 
 	idx = lm_cfg->dspp - DSPP_0;
 	if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {

-- 
2.40.0

