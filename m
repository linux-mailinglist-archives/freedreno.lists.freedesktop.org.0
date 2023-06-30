Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AB07443A6
	for <lists+freedreno@lfdr.de>; Fri, 30 Jun 2023 22:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E336E10E511;
	Fri, 30 Jun 2023 20:55:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C019A10E4F4
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 20:55:32 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so3914188e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688158531; x=1690750531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r18mIVnmzqRHDPtVLwyQfg7CU86v3tvlxJpotfkE8/Y=;
 b=LUyeVfhqY4vehUN7iaSFHM+uoOBODXHG8w7l6Lw7PspLCfPKldR4KAwZ1W9FkwPAuz
 kI/Q+1MxAeU1vP5nHpmXjAfiU9JM2e+/iBsUqH0s5rZGQ5euKH3Yt1cji348QgFhMHIq
 qVrBcQRqzKPK4Aox2BpKJuQiYPSASSiuISu/JXDfBywg65cxJov1vuKP53Moc0HZHebx
 aR4n0XANAHbQWlhFuZM9jYtEGHCdwcxW1Q5gIVMVXI5MdqMXJiucCr0kBkpepibS8Ziy
 JORNtbZtmqE2GoUPVrNwAsrmOQWtVoq4RQYaDs34Y9QzFTZEHdg7FMZzquDPDa+YAvLu
 lluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158531; x=1690750531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r18mIVnmzqRHDPtVLwyQfg7CU86v3tvlxJpotfkE8/Y=;
 b=bTNBLP9w3w9len/QCbpELXGir0j81r1Puiq/fAFcdoedRG/O6OJR3cDN6//neuzKDi
 ylkLt6QwAsDjKP2PzSHBKohaC8F40Shl/fI3MkQde+UgvLgh8/hryqvTjCBNu5P1QbNQ
 d7CAGOyyu/kv8l4aAUqGftTWPFiVCpqQ7QsurH4S2759rq6yrkJiV3XpmaLt3dELB4WF
 kySYb7JW9M8gTElVH6INo92QQXvkJIow2YSrE1l6t36uIAYRJDUL8wxv53d+YaAMq06W
 yv1pe35lg3fRZxOXlvi7M3F/TkxZC4GRadv4vy8MK9uiXcKp2v6rMbeSY9cixicjq1i1
 yrBg==
X-Gm-Message-State: ABy/qLbyjG1znZ9Db4UmEs1Uy5XZPvIO8oD6D/AX6zbjGNIVnkBgFqPh
 DngLb0exfNMFPnb4owA1udkdyg==
X-Google-Smtp-Source: APBJJlE7JZKxqCJN4wJq27EJv5YNxShDUyy9x1y4SLSryjFibDNtFji/MeeW5RVzba70K+QXzWeFZw==
X-Received: by 2002:a05:6512:3c81:b0:4f5:1418:e230 with SMTP id
 h1-20020a0565123c8100b004f51418e230mr1018104lfv.52.1688158531172; 
 Fri, 30 Jun 2023 13:55:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:55:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 30 Jun 2023 23:55:17 +0300
Message-Id: <20230630205523.76823-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 09/15] drm/msm/hdmi: add runtime PM calls to DDC
 transfer function
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

We must be sure that the HDMI controller is powered on, while performing
the DDC transfer. Add corresponding runtime PM calls to
msm_hdmi_i2c_xfer().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index de182c004843..9c78c6c528be 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -107,11 +107,15 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 	if (num == 0)
 		return num;
 
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
 	init_ddc(hdmi_i2c);
 
 	ret = ddc_clear_irq(hdmi_i2c);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *p = &msgs[i];
@@ -169,7 +173,7 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 				hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_HW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_INT_CTRL));
-		return ret;
+		goto fail;
 	}
 
 	ddc_status = hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS);
@@ -202,7 +206,13 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 		}
 	}
 
+	pm_runtime_put(&hdmi->pdev->dev);
+
 	return i;
+
+fail:
+	pm_runtime_put(&hdmi->pdev->dev);
+	return ret;
 }
 
 static u32 msm_hdmi_i2c_func(struct i2c_adapter *adapter)
-- 
2.39.2

