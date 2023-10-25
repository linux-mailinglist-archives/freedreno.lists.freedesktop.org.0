Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870F67D66BA
	for <lists+freedreno@lfdr.de>; Wed, 25 Oct 2023 11:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5982B10E617;
	Wed, 25 Oct 2023 09:27:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B41F10E614
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 09:27:15 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507bd64814fso7857235e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 02:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698226033; x=1698830833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QtUxpS9LHBTz7P4AH4M/bkhlO9UpvXLDxTXKsW01TMA=;
 b=D0CWk6CjIQaS3glY0fvdalg4MetBAtlJW6UiPDm9kbrNHu6GOvvhj5amBgARe4nZ32
 srME4AkyWJComcdJgghUhril5sGLahF4BPV4VIThbChqHFnl87opVdkwDLO/O9xa4w2S
 Edbwinlrt8qQwer4iencQi73T4dwj/iKRvtiNFQ/3iThGWG2IsGvWQIq/bj5RVfSh73V
 yzq1nHfMIaDcHBylE/hL2pQ3Jy2cp2AAAhDVCp26/0SD1hLbxNHvAbJGj+LPGrVFOOov
 PyDmMI+eQnRWToRR+PPuKNcWOSaPdlfgAVMqmu1VjV3CxhxF9zdqpUTGA8CwocdzebHd
 8opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698226033; x=1698830833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QtUxpS9LHBTz7P4AH4M/bkhlO9UpvXLDxTXKsW01TMA=;
 b=kL3KwVEFQ32+8Kb2VHjmJtJ/HfOzCxcNutQdPyghFVaT5vuclj5ZUd9QoiEvqX6bJX
 uWzCR00SEYtzZc6aQgHDFxKxv6QPmP92fy5xIpuFpdWtuYgV3SVQRDUj3bOyTWv9DwnM
 jTPbAQJZkB4/hMJByRihQJMc4xR0rlrQB6w/ojwHJc55a07c8H5fTVKunHNrtjGkMIXh
 7n9rX1Qax6WBz3xXAHrwG2y560sZUrE5+LQ7+DBB+dpeVMcHHMYNkDRk9CGeW1SVkRIz
 X790Wh3iisMrX7pL3rDUAxskFneChtpTAQOXuGuCNWAxdBU1LtrNxSClXzbLmE8FYY4y
 450A==
X-Gm-Message-State: AOJu0YyDcvPXj7th0SuSa4HjtkZNpAOc877Zx2nkxCCrmv/tPJoYDVYm
 7cZTTpWjiMRDjfnnmA8XE/QX5w==
X-Google-Smtp-Source: AGHT+IF4JyODsy/R7n9MpWLVJ6X92eTxeIIQaPwvTPjpfhaAGvY2yEMuYrSSE8O5MrNacMcr1we5Ww==
X-Received: by 2002:a05:6512:3b87:b0:507:974d:80f9 with SMTP id
 g7-20020a0565123b8700b00507974d80f9mr12978498lfv.34.1698226033609; 
 Wed, 25 Oct 2023 02:27:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 eq25-20020a056512489900b005079fff83d2sm2470377lfb.3.2023.10.25.02.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 02:27:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed, 25 Oct 2023 12:23:09 +0300
Message-ID: <20231025092711.851168-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/2] drm/msm/dp: don't touch DP subconnector
 property in eDP case
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
 Abel Vesa <abel.vesa@linaro.org>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Abel Vesa <abel.vesa@linaro.org>

In case of the eDP connection there is no subconnetor and as such no
subconnector property. Put drm_dp_set_subconnector_property() calls
under the !is_edp condition.

Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e329e03e068d..1b88fb52726f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -365,9 +365,11 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 	/* reset video pattern flag on disconnect */
 	if (!hpd) {
 		dp->panel->video_test = false;
-		drm_dp_set_subconnector_property(dp->dp_display.connector,
-						 connector_status_disconnected,
-						 dp->panel->dpcd, dp->panel->downstream_ports);
+		if (!dp->dp_display.is_edp)
+			drm_dp_set_subconnector_property(dp->dp_display.connector,
+							 connector_status_disconnected,
+							 dp->panel->dpcd,
+							 dp->panel->downstream_ports);
 	}
 
 	dp->dp_display.is_connected = hpd;
@@ -396,8 +398,11 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 
 	dp_link_process_request(dp->link);
 
-	drm_dp_set_subconnector_property(dp->dp_display.connector, connector_status_connected,
-					 dp->panel->dpcd, dp->panel->downstream_ports);
+	if (!dp->dp_display.is_edp)
+		drm_dp_set_subconnector_property(dp->dp_display.connector,
+						 connector_status_connected,
+						 dp->panel->dpcd,
+						 dp->panel->downstream_ports);
 
 	edid = dp->panel->edid;
 
-- 
2.42.0

