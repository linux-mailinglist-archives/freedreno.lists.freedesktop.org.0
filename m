Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FCC7EB5B8
	for <lists+freedreno@lfdr.de>; Tue, 14 Nov 2023 18:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6FA10E49E;
	Tue, 14 Nov 2023 17:44:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A89110E49E
 for <freedreno@lists.freedesktop.org>; Tue, 14 Nov 2023 17:44:05 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-77bcbc14899so269814685a.1
 for <freedreno@lists.freedesktop.org>; Tue, 14 Nov 2023 09:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1699983844; x=1700588644; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X/Se8NuL5JKZV2azJTKlvFmjep69ofpc3jvqTI1b0ug=;
 b=BDnPmtFxEEVYQVOixFyQ9TJ/8QFowZJ+JJa3VlgIOjlRJyVQtuEjqZySVV0ttt2wNl
 ai05UaV11q3UFER8NOtN3VGkHjd3TpAisItLSUNTxPjugFzFqRH3YrnvUfIwT/yIohGZ
 39D16tOPqFbkLw3r1bTjBG6h/h1oFa4vMTl21zCmCqNQjyWidMVAtwZ7XkSNXG54oX5P
 /IktQd4bCs1/WEsMphARtGKy0AMUaqy/L1nOnEKLCV9krYZ7N+iupURmAKN0qR0DnpuB
 xhdaJjEPWNPLs7qtgumNsi0wYvIoDL1kXE3phRWsXd3PVQSJgcu+X1Ezk9U0HtMBLddT
 Z6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699983844; x=1700588644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X/Se8NuL5JKZV2azJTKlvFmjep69ofpc3jvqTI1b0ug=;
 b=rl8UlspxWyr75TRgKihbnRKJ0OdqG+pORsV3GO/M4br1biRrS3FXCnHMnh2Omij/ng
 0hkzMu5lMxA5m2Kn3Jt8dD68kocSXr6tftvzTu511/+J3uMRUc7EIv5/PHyQuwwXTtW8
 nFZc38YtS015ZupdGL5etChJLzPFMo26W00dA+otsZmxmQG49GcWAq5y+SE44m4i4SCH
 VONyPzn2AAHBeVzpH9iPU02Le7Nr9y/LDW7wAqS+ssNUNdEhX9/mz+IWknmcBSzDcyAo
 FfJw0fXaBPOsePKxHi068ArZf2Kzvdzc6KU01o2gQ7qWhzxLL9jI3dmZg6/yTsBx29O1
 7Tbw==
X-Gm-Message-State: AOJu0YwmJNYPO6bBd/hJPNF6mWqX8Ip6QFCh8BUVXMIsfXfCFJUYtawg
 LsjwUd8ezFA4cvJhDPJvNeCqoIkVM5JPCK7xiGg=
X-Google-Smtp-Source: AGHT+IEVo5nwOKH3fh3lUeHfJPuHsZveyp2ikuoOIr0IRzcdZCJpfEChO6qWMjdi051wikBpH2Rarg==
X-Received: by 2002:a05:620a:4627:b0:779:efb4:73bb with SMTP id
 br39-20020a05620a462700b00779efb473bbmr3357188qkb.41.1699983844031; 
 Tue, 14 Nov 2023 09:44:04 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 bi8-20020a05620a318800b007671cfe8a18sm2833350qkb.13.2023.11.14.09.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 09:44:03 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Tue, 14 Nov 2023 12:42:14 -0500
Message-Id: <20231114174218.19765-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20231114174218.19765-1-jonathan@marek.ca>
References: <20231114174218.19765-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/4] drm/msm/dsi: add a comment to explain
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
index bddc57726fb9..2ea2fc105fbf 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -875,6 +875,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
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

