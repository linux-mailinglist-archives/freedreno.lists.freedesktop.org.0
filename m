Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D23B3696394
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 13:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069AC10E8C1;
	Tue, 14 Feb 2023 12:35:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A70010E132
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 12:35:09 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id br9so23257622lfb.4
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 04:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1wKD3viWx9y2Doh09M6thHCui3jXjNr6R+aDc8/BUA=;
 b=W+iHYcy4Kau9N/8oFf0OC/B05xBFj+/6mw6m7TeMCX96tPAlibotzVD0l4WvPYU49S
 fqf0J4giZ4dLuYcSwWsGsHN4b19iYKmKvjhclr/QTdEW8UM/t8SqZ4wUZZn//Bc+sy9c
 bDXSq2BJ7KUi5pljAOYb0a/Q55L+YhXg9k8VaNpomy8LHDe4SZlgJG1mU6AkT88bC1s+
 snfiDwmYE6KhFm50Sdtn1aE9GMtgKBipn1eNWoV/dQb3Mke1fnlK9zoyeq3nqtsURyBi
 ifDg/2InNco6iX43uhqpNGnInicMlYkpZRmaSRrbMo6XEOY/HP200v4C+v+rrF01hFWw
 fJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1wKD3viWx9y2Doh09M6thHCui3jXjNr6R+aDc8/BUA=;
 b=ImwXZLw99zhDpZ5apf8yv4JMaltoi39FxstZaHLyJdpTahBXWgTKxQBxieHcKkIqBf
 e6l4/pTGiftoLx6onXkeWy6iVz4gdysSfCRCzAHTxH/l9tlmkB38nryYrXUmjn5pkhE0
 6zC81yBRxe9dsYZUBZmnhz9fk0yK47OLbYqvdVLgtEFx/x9qyXRZJg043ScA0vIw4pG7
 IiZqeAX4cW0n2EPi1iPH0pQXwjTKqvZDw7QbTsVx3I6DqJwGrL97TUaEgkR9ibE4EIlX
 UQ6o2fIxSVuSmRHzqwQGAs0JJ2vSeqOx/VQmRawOlelmvmhi1OyBXiy8+stzH39742en
 jC4A==
X-Gm-Message-State: AO0yUKWt4PTFvvamqChltYJjoB3s4lY5zuSoK+2YZVB3h3ZIaVjwv2CS
 8KVd2DlOb1RYXoqY/acWefSomw==
X-Google-Smtp-Source: AK7set9Bquz0hgYxtaiG1c/s1FRRk3s8VS0wWQuvd5BrpQ5m9R1E/b4/FcDR3o2q7MpTGUiuP9qyAA==
X-Received: by 2002:a05:6512:48f:b0:4b5:b7c3:8053 with SMTP id
 v15-20020a056512048f00b004b5b7c38053mr466747lfq.42.1676378107761; 
 Tue, 14 Feb 2023 04:35:07 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v19-20020ac25613000000b004ab52b0bcf9sm1077158lfd.207.2023.02.14.04.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 04:35:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Feb 2023 15:35:04 +0300
Message-Id: <20230214123504.3729522-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
References: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/3] drm/msm/a5xx: add devcoredump support to
 the fault handler
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use adreno_fault_handler() to implement a5xx_fault_handler(). This
enables devcoredump support on a5xx platforms, allowing one to capture
the crashed GPU state at the time of context fault.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index b5270324f5f8..d38ebfb5965b 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1099,16 +1099,19 @@ bool a5xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 static int a5xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
 {
 	struct msm_gpu *gpu = arg;
-	pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
-			iova, flags,
+	struct adreno_smmu_fault_info *info = data;
+	char block[12] = "unknown";
+	u32 scratch[] = {
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(4)),
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(5)),
 			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(6)),
-			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)));
+			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)),
+	};
 
-	gpu->aspace->mmu->funcs->resume_translation(gpu->aspace->mmu);
+	if (info)
+		snprintf(block, sizeof(block), "%x", info->fsynr1);
 
-	return 0;
+	return adreno_fault_handler(gpu, iova, flags, info, block, scratch);
 }
 
 static void a5xx_cp_err_irq(struct msm_gpu *gpu)
-- 
2.30.2

