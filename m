Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC7D47812E
	for <lists+freedreno@lfdr.de>; Fri, 17 Dec 2021 01:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A052C10E1BF;
	Fri, 17 Dec 2021 00:19:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F37510E1EF
 for <freedreno@lists.freedesktop.org>; Fri, 17 Dec 2021 00:19:14 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id r26so1275924oiw.5
 for <freedreno@lists.freedesktop.org>; Thu, 16 Dec 2021 16:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ENSn6IuB+oeiV3yKnojaUGUax2jZ8l/NgiJmlnlGRM8=;
 b=fhm/OhQ/sdR+Qhsb/I9XemcDSyVjaGBVqHbNBNF1QmgT+42HuyhEMSP79YqVh+pF3b
 dEpBWDTMly9uAy9dTi7R526EUDNhxh5Z8oDmMBdDr/dvWyMA9dqEnuz6RQiW08Hb1bEE
 ecE6Na4fYfIEHhtpSTPyTcEn/Noi5OzKJI0GwFoDPHvQZSrYqxNHbQQCO3e9w/cbGBHd
 684j/j1/IJ10n3aDlFRCcvNhAl/SzDtwOKVYZP9c5nPAVgRkj9P0Q3yguLDqMAdUqCsM
 J4VlevGliw6ez+TD1DpXBBFmZn92ZXPYF3wo3197RqdBBnLEbVQ29yDHUiqKe0MULALF
 WgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ENSn6IuB+oeiV3yKnojaUGUax2jZ8l/NgiJmlnlGRM8=;
 b=cjFD8C+auokiY5OWLuc8wJdidphRnGaxya8xvttDh6pH54FgumMyK0PCyR6Zgh+QzY
 sWSLlLoZGET/ZWRNCMJdqcU3Sk58U9Sir42x88UnL36plfnTXuFV/tarzfjCM+K+/A6p
 w9QZatZlhXJcVPJrk1i1c/HAyVHcWzZhbWiNViPCkRdE/olD4MnLB83/i/DSwal5e5i0
 AV+uqE+VwWXTX2EjRp/acXOvHO9X7R4QzaBWXOaGzTHwdTTMyqbxNrKDE8hdLa01dSlt
 Oj3ORFRU9mQPug9/NP3ezO48uHBkn2K3J3nxD/IbbORtTtxlltJIL4hB2ckYdbcaw/WE
 yLrA==
X-Gm-Message-State: AOAM532/JFK+zqV9MiV77sRthH8elacFarL4j2nhGo7YvuGoNWgWInvk
 zU+pOQtB4VqQpV76bTRGC83ohQ==
X-Google-Smtp-Source: ABdhPJyirE2LAYtTzTmww8lQgs/2HDcezCd+h7aylmB9JAn5/W3GK0bUarTheMMU1gtz40mXLgXJaA==
X-Received: by 2002:a05:6808:209b:: with SMTP id
 s27mr255871oiw.43.1639700353143; 
 Thu, 16 Dec 2021 16:19:13 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id e14sm1261737oie.7.2021.12.16.16.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:19:12 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Dec 2021 16:20:26 -0800
Message-Id: <20211217002026.2304973-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm/dp: Only create debugfs for PRIMARY
 minor
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

dpu_kms_debugfs_init() is invoked for each minor being registered. Most
of the files created are unrelated to the minor, so there's no reason to
present them per minor.
The exception to this is the DisplayPort code, which ends up invoking
dp_debug_get() for each minor, each time associate the allocated object
with dp->debug.

As such dp_debug will create debugfs files in both the PRIMARY and the
RENDER minor's debugfs directory, but only the last reference will be
remembered.

The only use of this reference today is in the cleanup path in
dp_display_deinit_sub_modules() and the dp_debug_private object does
outlive the debugfs entries in either case, so there doesn't seem to be
any adverse effects of this, but per the code the current behavior is
unexpected, so change it to only create debugfs files for the PRIMARY
minor.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Moved the check up from msm_dp_debugfs_init() to dpu_kms_debugfs_init()

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 2ee70072a1b4..a54f7d373f14 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -193,6 +193,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 	if (!p)
 		return -EINVAL;
 
+	/* Only create one set of debugfs per DP instance */
+	if (minor->type != DRM_MINOR_PRIMARY)
+		return 0;
+
 	dev = dpu_kms->dev;
 	priv = dev->dev_private;
 
-- 
2.33.1

