Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760CF7EBA0C
	for <lists+freedreno@lfdr.de>; Wed, 15 Nov 2023 00:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C3B10E409;
	Tue, 14 Nov 2023 23:00:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE69F10E4C9
 for <freedreno@lists.freedesktop.org>; Tue, 14 Nov 2023 23:00:38 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5b31c5143a0so71308817b3.3
 for <freedreno@lists.freedesktop.org>; Tue, 14 Nov 2023 15:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1700002838; x=1700607638; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cpJg20SvqJHFde7hdRwbQhfmXK7eKDJA+6y+igvktAk=;
 b=Ws2GeoH854bwBmXOGv8LdesCm95OB4rjk9W3/zOf6d46JmO3X9J/buVCWGpnYmGhg3
 ESDV6u6PYwRCq41rhSqyem6GPUbtkahv+Tyxvd0AECahNaUU4N5j9bKRVd2nEuvcLn2c
 jBHemnEVHpCg0VIhwGNLqTaQILnhbVk7hY2OFyLzpE7H8odHvabYxc3KneyOzGwt4Qea
 4pZyDi+DPhIkJxENCJ08sdSd2LEgXBA93Z9aG1GiY/JbzlXslEt3k3m4qhPqrOOBL6T6
 vbi4+JvHGO5tK2hUeKAElKJlntbHoIsTOQZFJGCLgko+gCPodXlE6MfTS6IB4PLF7nSX
 AY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700002838; x=1700607638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cpJg20SvqJHFde7hdRwbQhfmXK7eKDJA+6y+igvktAk=;
 b=SJBxOCXAcGn8cVL9FpGPYBI0VteMc6yHlCemD6wFB6TS3+HWeAfHBNuiiqsqVRjoD2
 5CAaZKO1aXnu+64O8kB70noGvQP8CmcC1UoR2HgWL+7M85B/Fi8JNHFSPHVg/fOGW+Ep
 wtDoxg1Gx10FaBZw5g65F0n1m82B40yUsXS6OO9aL7CIXslKEZ+AGIPqzoWFKaZlqF2H
 SIAhsxUj/cyYF+ZeJ1lKF5oCCgZJmBrynw1sigfL/lhlkG3g+IhRBjC12Cl1cLSvV6Oy
 bZ58Auza6hoJoUGxdOhwsKAa7F/RSZFPzriDYnkyLk6Z9L+36b6/dgJGGCmeaaDNrhB/
 8jvw==
X-Gm-Message-State: AOJu0YzbpLZg68IKWlVaaf12RRmoHess+MPZwMD+60dlTWVOgquG/wmj
 Fvr+VSqHPTGW+IcMnXVzVKzoGaoRmqquWvW0rQg=
X-Google-Smtp-Source: AGHT+IF625S3cBQuZUFbUGBAhZkGCmiGu+ZC9noNuDSK6oc2pQ7dDTxwb4mFW7Ih4VTIW4LqjLUQKA==
X-Received: by 2002:a0d:ca84:0:b0:5a7:bfbf:1bbb with SMTP id
 m126-20020a0dca84000000b005a7bfbf1bbbmr11185827ywd.17.1700002837716; 
 Tue, 14 Nov 2023 15:00:37 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 15:00:37 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Tue, 14 Nov 2023 17:58:32 -0500
Message-Id: <20231114225857.19702-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114225857.19702-1-jonathan@marek.ca>
References: <20231114225857.19702-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 4/6] drm/msm/dsi: add a comment to explain
 pkt_per_line encoding
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
Cc: David Airlie <airlied@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Make it clear why the pkt_per_line value is being "divided by 2".

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 66f198e21a7e..842765063b1b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -877,6 +877,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
 	 * registers have similar offsets, so for below common code use
 	 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
+	 *
+	 * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
 	 */
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
-- 
2.26.1

