Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB86E693522
	for <lists+freedreno@lfdr.de>; Sun, 12 Feb 2023 00:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391D610E416;
	Sat, 11 Feb 2023 23:13:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F1A10E3FE
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:48 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qw12so23995957ejc.2
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iHQQmWOhgfHuVxPNefuUhrb3kyDxId/lJ4kO/uFtf+0=;
 b=D840DiePbnHiL2RRj5f+XCcNdzN4zBVAFosHBGU0JZD7G/On3F/l11kQW2D0YDXbUB
 ysHm0MAxF5S/sAVJDNxLyZumDSRiVApYTB6XbILeO7mNhbyktoXSPHs+IVqXVzp2rujX
 kqrWMRy/sC0qw6EjWeqBKa9OtGHyY/78qzcq5xwlU/O3orEyWMiGYHq3dMbHcEc91Ey4
 YKxfAxECNeoWkaDnZzpJcq1/C9kCX5b49L3bPaoE3jWSqML4Oi/utDCk5JAyksAKjI2z
 2SXef4NIGgBVUTJN2TLOcefAzq5rMWoeBEQFfFu7w/V8yJUbwnQN31mPCrqc6u4sfCxN
 i33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iHQQmWOhgfHuVxPNefuUhrb3kyDxId/lJ4kO/uFtf+0=;
 b=5f5leZ5mnAX70j2+Q8e8XrWd09+KNDxJukdmuYAd2AbyotBUjvyWSFO1zQcnfYljQV
 K0/AfoIQo5LrkL3uUNO1dxcnLuX1DJ0T3qvYHUCJHTk3nN8v4RQjzHJHzOf2dn304FH9
 CyGoxz/Ha9EN+rTz8UTZU8KVTIvrkvqimg8m3dNsZsM6O9OLD0VvbP/gwtTODnN7LCRg
 sRCnHDt+n13ouhHLz4uhGa2iUE4YWFLr2wWDIUUhP8nYblrGAuPECo3i56kjlRmdIdPu
 V5d940QkJhvjrFyBrgx1K2xlv/w0hYq4oaIXqYtaiLp+ZAVdQCxfj5yG/VVk1ifGXoSl
 CykQ==
X-Gm-Message-State: AO0yUKUx1qMFDcoGeOd8Okk0vuYdNp18FQn6T3RdGwStj8DcsdAy5yzp
 lb9ENVqGxwXpB2QYec9CrOL0Zw==
X-Google-Smtp-Source: AK7set9QFVBfv9yUIuYShfB+fY8WNSPt8xwa1IBgCo7gX2eRbPO1lA7sl4OrFtMPBsk6OrFep+LfTg==
X-Received: by 2002:a17:906:6b1a:b0:895:58be:954 with SMTP id
 q26-20020a1709066b1a00b0089558be0954mr18894745ejr.58.1676157228100; 
 Sat, 11 Feb 2023 15:13:48 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 12 Feb 2023 01:12:49 +0200
Message-Id: <20230211231259.1308718-41-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 40/50] drm/msm/dpu: enable DSPP on sc8180x
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

Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index c51e1bba1533..457733a6986e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -91,6 +91,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
 	.sspp = sm8150_sspp,
 	.mixer_count = ARRAY_SIZE(sm8150_lm),
 	.mixer = sm8150_lm,
+	.dspp_count = ARRAY_SIZE(sm8150_dspp),
+	.dspp = sm8150_dspp,
 	.pingpong_count = ARRAY_SIZE(sm8150_pp),
 	.pingpong = sm8150_pp,
 	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
-- 
2.39.1

