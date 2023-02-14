Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA14169566F
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 03:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8614710E7D3;
	Tue, 14 Feb 2023 02:10:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C70810E7C6
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 02:10:03 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id z37so6733720ljq.8
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 18:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3krWooVaD7gxI/MuHJdJwJLEDhxVnEkT/xDyRE1I7q4=;
 b=GXJrXEqNRD1mVB/HSZOcdpX+RH6803clEiJVhlmWpeODDuRt5paX0sitpBcn9QRxaB
 BqwlEu+LCHuD8w2zEyLpbpaTSt50acsBW9rWOXIk7p+KgTZepLzLUJ+APqbgyZ/+Lqms
 FvlET0dgS24fIC8BU1xbv8rC9zFNIefN9IU//IKYcIKlPVO81E5t097UjGGtb4KTC/6l
 nmXO92fBNxi4NyGqYE2ZQXyBFKaaekXjVPWaYijTXxpwnEhoR4zPY/Oi218infdOOpcx
 Uep8iDffbXxvCNIJ79cJAHwkWRVYS/SldkLCunrSRwheIZ5AxehP3cfhZLVdzbbqMc7q
 uPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3krWooVaD7gxI/MuHJdJwJLEDhxVnEkT/xDyRE1I7q4=;
 b=Q5qHCW9JR3ZuKNNS93xOmBGhyDuK2Cl64D7h+Hk9CKr6yDWo+p0TEej/ejF2RNEJyA
 aSjqvfYCvY0l5g331Fj3tsNwixKb++hXK0t1enhckDrKWNxod07/8OCNQkNxZ1Kvy6fv
 VvGYZIntQV4CjgLRWAmOgfWLdgVIG7pdsHtsnBjMQwAdwUXyBJn4o1ocX4qCoU6DG56X
 GBz9ixxhWJlnOtmZF+cbmZnjt8IeI4Adt+N41DxT7JEh0feozTQN/N7XqHxeWruvWFfr
 tNj2ZhI8d/Koz7umWZiZKANE7QJl5vH8YAAxUYj61NPTjBvIR/g43Tm0p3zPJKtyzDJj
 v54Q==
X-Gm-Message-State: AO0yUKV5VUKFaZJZTYJNEoSlxLQqqUfMSVbU/sVXHfw/2QOYW/g5k0Iq
 h9xM09veuspSTMfHLvI7IsBO9Q==
X-Google-Smtp-Source: AK7set/INJUhsu9dINYFmoXc80j9iZnt4BbCJb6ebVarThokQgjPgR6cbE8l2ONMPwLmrHUW7Y2IHg==
X-Received: by 2002:a2e:9813:0:b0:28b:5621:7be with SMTP id
 a19-20020a2e9813000000b0028b562107bemr218378ljj.35.1676340602613; 
 Mon, 13 Feb 2023 18:10:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a2eb711000000b0029066c8906dsm2239518ljo.23.2023.02.13.18.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 18:10:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Feb 2023 05:09:56 +0300
Message-Id: <20230214020956.164473-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
References: <20230214020956.164473-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/4] drm/msm/a5xx: fix context faults during
 ring switch
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
Cc: freedreno@lists.freedesktop.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@protonmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The rptr_addr is set in the preempt_init_ring(), which is called from
a5xx_gpu_init(). It uses shadowptr() to set the address, however the
shadow_iova is not yet initialized at that time. Move the rptr_addr
setting to the a5xx_preempt_hw_init() which is called after setting the
shadow_iova, getting the correct value for the address.

Fixes: 8907afb476ac ("drm/msm: Allow a5xx to mark the RPTR shadow as privileged")
Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
index 7e0affd60993..f58dd564d122 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_preempt.c
@@ -207,6 +207,7 @@ void a5xx_preempt_hw_init(struct msm_gpu *gpu)
 		a5xx_gpu->preempt[i]->wptr = 0;
 		a5xx_gpu->preempt[i]->rptr = 0;
 		a5xx_gpu->preempt[i]->rbase = gpu->rb[i]->iova;
+		a5xx_gpu->preempt[i]->rptr_addr = shadowptr(a5xx_gpu, gpu->rb[i]);
 	}
 
 	/* Write a 0 to signal that we aren't switching pagetables */
@@ -257,7 +258,6 @@ static int preempt_init_ring(struct a5xx_gpu *a5xx_gpu,
 	ptr->data = 0;
 	ptr->cntl = MSM_GPU_RB_CNTL_DEFAULT | AXXX_CP_RB_CNTL_NO_UPDATE;
 
-	ptr->rptr_addr = shadowptr(a5xx_gpu, ring);
 	ptr->counter = counters_iova;
 
 	return 0;
-- 
2.30.2

