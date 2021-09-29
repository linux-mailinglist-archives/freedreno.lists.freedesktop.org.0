Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B2241CA85
	for <lists+freedreno@lfdr.de>; Wed, 29 Sep 2021 18:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FD86E1D5;
	Wed, 29 Sep 2021 16:44:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Wed, 29 Sep 2021 16:33:11 UTC
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AE96E1D5
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 16:33:11 +0000 (UTC)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4C8BD405FA
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632932765;
 bh=Rm+gsKMf3KO4CSrmWZZZ6Qt7mfefNMHgflz9fS2JkAo=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=wP/hR1x32R8oYqCqcOyN2YA3L2+cUlhbUR0AY37FUfA7bZ+JO3rlZkllmJW9qDPaz
 Tw77qBd90v9GvthlrvF/WFOqIfPYZH0wYfLUriEMP7iDEJ2df6sPWiqsyFdac+jW6f
 DEh0qrciafG3sqS+krrlSFSbrMcZZfz7J7d7yt/w3n4Gl4wcUVQvKWvkhN2Gd3MAJO
 4PLM63dYExq765hdOvdl3nJ0+SmeRFHhwB9Ld4Og0S1zX2BIEqdDcMhEVahsgUefPv
 a6eW28x+ttmq1GnISB9y9N2QktzKH3kMDnyW6Nw5/rJf7wWfAZqMHy1dnC7vTh/05Y
 Ujc5a0jdeMr3g==
Received: by mail-pg1-f200.google.com with SMTP id
 q23-20020a6562570000b029023cbfb4fd73so2392974pgv.14
 for <freedreno@lists.freedesktop.org>; Wed, 29 Sep 2021 09:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rm+gsKMf3KO4CSrmWZZZ6Qt7mfefNMHgflz9fS2JkAo=;
 b=tbDKda6sfxRz5//nzU7GjToBJG+j0nE0JoRHAKbkZeNh7mFyUWhmKfPABvuc1aG6Lb
 qvV0rLdoa0qUqYgNtgwwwGhu9Jbl+A64Lb745LapPMVE5UWVL2/CAGStXaR01FBsiQU+
 uCKxRPBc9/xptpS+4rluTmfUWuu5OiKI0dbSyXOJKDcrpOEVd9CAkPQ5YH9ncCVkDvs6
 63t1iOC0sxWSkS2qPrv65GU7YHnSWKwE2OJ+WaGZE99LpaJC+0Kc/rpA1BSZPUsJgjHL
 WqaTNXRQHoGvG8sDcVlvpJ6mS3lRz4j76PDcDnaPsKJcnxtN5J77JqP3fBo/nyorg3Bx
 XvWg==
X-Gm-Message-State: AOAM531GPYKVnaAskDY9flOA2aWDDDkzD595I66d1OkGTVdIzebYqtnN
 7aElmnP+hm+mbWelJDZ3Yg4zlXIxglpuEM4RvalbMp6YIgCfXqudr/VI8fmmHjJVXpTBAJ+bhOp
 zllX8f6bW4+iZcswXuSsEiy2Pt/GlPzSO/1gmcSV6N5K6/A==
X-Received: by 2002:a17:90a:4290:: with SMTP id
 p16mr7357987pjg.112.1632932763768; 
 Wed, 29 Sep 2021 09:26:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC22Ts07QZM3TqmbHY6TDE7TF4sYwB/o3/NJgExi9doWhLlJTT95Q4jxI32IZQB87N6iLNQw==
X-Received: by 2002:a17:90a:4290:: with SMTP id
 p16mr7357953pjg.112.1632932763495; 
 Wed, 29 Sep 2021 09:26:03 -0700 (PDT)
Received: from localhost.localdomain ([69.163.84.166])
 by smtp.gmail.com with ESMTPSA id p16sm293615pfq.95.2021.09.29.09.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 09:26:03 -0700 (PDT)
From: Tim Gardner <tim.gardner@canonical.com>
To: dri-devel@lists.freedesktop.org
Cc: tim.gardner@canonical.com, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 29 Sep 2021 10:25:54 -0600
Message-Id: <20210929162554.14295-1-tim.gardner@canonical.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 29 Sep 2021 16:44:08 +0000
Subject: [Freedreno] [PATCH] drm/msm: prevent NULL dereference in
 msm_gpu_crashstate_capture()
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

Coverity complains of a possible NULL dereference:

CID 120718 (#1 of 1): Dereference null return value (NULL_RETURNS)
23. dereference: Dereferencing a pointer that might be NULL state->bos when
    calling msm_gpu_crashstate_get_bo. [show details]
301                        msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
302                                submit->bos[i].iova, submit->bos[i].flags);

Fix this by employing the same state->bos NULL check as is used in the next
for loop.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 8a3a592da3a4..2c46cd968ac4 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -296,7 +296,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		state->bos = kcalloc(nr,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
-		for (i = 0; i < submit->nr_bos; i++) {
+		for (i = 0; state->bos && i < submit->nr_bos; i++) {
 			if (should_dump(submit, i)) {
 				msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
 					submit->bos[i].iova, submit->bos[i].flags);
-- 
2.33.0

