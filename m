Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BBC4A62DF
	for <lists+freedreno@lfdr.de>; Tue,  1 Feb 2022 18:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C15710E1D3;
	Tue,  1 Feb 2022 17:47:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CC210E4E0
 for <freedreno@lists.freedesktop.org>; Tue,  1 Feb 2022 17:47:50 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h7so1742763wrc.5
 for <freedreno@lists.freedesktop.org>; Tue, 01 Feb 2022 09:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7TPcuWXxFU6hWv6NeLAOie1udRWkhLJ1DWe5t2FsQ+M=;
 b=NuDwlgu6ILp+04FQNgBAsUPzgY4AJ4bWp5fA+81vgbrR5oDX2XCAO6zFTyz1N6KBkU
 1kdQkH85xpE2ggU6G7YOsyHHkTToqT8hEBjk5z4lr12RD7yj4VqBh0sdrZL5PnVifknW
 4Yd8p3bHKpvTFcIiHl+wEjbshC1kHaYl4TwJhUINoU5P7+NT6/c0K3F2jcQT7LSNe9yy
 FaXvEgb0ZLMnKx8Bk9pyEz77Z7+wYBdKtsrkqcuuKGXhgjKJySsryv8ltvb/6sadloTy
 UzkbJtcaH9lrLMA/LhpmdFsKm7icqg8TsZuhhQDF0expi5wKdSPQ3x9ySEnfmKNh7Pkn
 ccBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7TPcuWXxFU6hWv6NeLAOie1udRWkhLJ1DWe5t2FsQ+M=;
 b=TNkjsRvWfuczmYXdiDhH+bFILR3FwI4QhUfhr71oozdUf8+nw/i8N4lnFyLsEK2BrE
 vktgkxU1mSzA1el5Pa5kdAq5V96UsOB7KZ/8+XqaFCfDS9r0oC1MFKkxeotZCeceMvP7
 YZ/GB0tpfhSt0tF2+VEoas0LdmzttG2/D7PM9JgVNEbUfPBKawhlVuTRGaZJHTODmgCx
 8jzE2xbWa0V1jHtVeDJlrWFSp6rHnRJ/VPX/4VQ8Rw0bQvcw3DDwjHKNyZaPqVQKRfxV
 vNIPu9EgBRJ61IR3EcUCRNWF3V/H5IcopJ+pbb2fAOpIPzKWz7Z9AKdKEe5SLWK9KOWg
 gmgw==
X-Gm-Message-State: AOAM531XZ3hDFA1235m3nBc4ipmMoIvnh09CZkIv3OiqgWDz4C/9rgPZ
 wVfPaJWvQ8CPRphB1jqpdzYsGw==
X-Google-Smtp-Source: ABdhPJwDJNj1YVlHWPoJ293olzLjFEIQcMbpGy6i0JMKcmYgnDUgr1EqX8iuwkgOa1W/rpbnq/zJPg==
X-Received: by 2002:a05:6000:1548:: with SMTP id
 8mr21586066wry.504.1643737668657; 
 Tue, 01 Feb 2022 09:47:48 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id r2sm3392332wmq.24.2022.02.01.09.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 09:47:48 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  1 Feb 2022 17:47:33 +0000
Message-Id: <20220201174734.196718-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201174734.196718-1-daniel.thompson@linaro.org>
References: <20220201174734.196718-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/2] drm/msm/hdmi: Remove spurious
 IRQF_ONESHOT flag
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting the header comments, IRQF_ONESHOT is "Used by threaded interrupts
which need to keep the irq line disabled until the threaded handler has
been run.". When applied to an interrupt that doesn't request a threaded
irq then IRQF_ONESHOT has a lesser known (undocumented?) side effect,
which it to disable the forced threading of irqs. For "normal" kernels
if there is no thread_fn then IRQF_ONESHOT is a nop.

In this case disabling forced threading is not appropriate because the
driver calls wake_up_all() (via msm_hdmi_i2c_irq) and also directly uses
the regular spinlock API for locking (in msm_hdmi_hdcp_irq() ). Neither
of these APIs can be called from no-thread interrupt handlers on
PREEMPT_RT systems.

Fix this by removing IRQF_ONESHOT.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 719720709e9e7..e167817b42958 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -306,7 +306,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	}
 
 	ret = devm_request_irq(&pdev->dev, hdmi->irq,
-			msm_hdmi_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+			msm_hdmi_irq, IRQF_TRIGGER_HIGH,
 			"hdmi_isr", hdmi);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev->dev, "failed to request IRQ%u: %d\n",
-- 
2.34.1

