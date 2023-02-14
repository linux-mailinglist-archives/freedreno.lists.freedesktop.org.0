Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BDB696B97
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 18:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCBF10E943;
	Tue, 14 Feb 2023 17:32:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9F810E93E
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 17:32:09 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id s11so10763778edd.10
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 09:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OY08lSRJ0khJ3YSfU40JW9rAgs8VWCIlhnOm90/cUOg=;
 b=frfKn93kiQebkp11O4duo98V/VYbcCaSsG8zEDPRN7bXFw6RY8w5rF0knMGnhEFM5l
 /02KkVtTMObUBFykV6Q5lsPHyvYFJ18icSwP8QxYbEKJm0GziPhXz0K7e79e5kaYvj//
 MS6T5e9SIcAfpUlqhOEg1ndoWsCUUKWFg445luwHBacOWbuGwDsfbwR1KP3wMID1li1E
 5i+1tgcFdWF5aZQM85pLheVzpKKlkMtlWj55tgeH5yuU36lfSWefZCJ0q2Rw0Cy8pCFy
 6WOeJw7XAPSGjYLTQoBwmt5Yh46Y768uSz7iPY/rtkgyFu49b7B8JZJkKUPmyLkSwTAI
 WsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OY08lSRJ0khJ3YSfU40JW9rAgs8VWCIlhnOm90/cUOg=;
 b=hbKckUipSqlCYX/j8Lu7sAOrm611ww4Dq1HN9Hjlkwl3RyCZfzyIFsV16lglf9gEeL
 Y2d4IJ0CBjaBgcqKpsfuf8yijFc3YfZxFgXmduSmgWkXB727jKlbmXGdPWmd0nqX3row
 4cZR4xqsxxP5gGoOv10nss88ktXmwg2CBJgKFs5fjQice/qcgE3icAw4NIOx78cSPjP0
 HhwXLOLkQrl77SZGynAOgDYwA1GuCmXsbtDiHDphdkV7Qyl6Vc6sO56dbnCgaFhzo9ph
 +0d3n05U5+ibZH73G0zgD2fP1pflAan3g1deuJ5P/D6nluI0Gx64y2Gy5TsEGE19/Ngc
 /ZrQ==
X-Gm-Message-State: AO0yUKXG1/SFzRc//ePTsfRfYEJNoFsV/4PWnl6E4YbneNAVTP+Y/P9X
 ndtr93Zmf4uHFW+CmeNYCy1CLA==
X-Google-Smtp-Source: AK7set+p3q4YKuAdCoI2TlDfL0AaC/b3D1U8fkZW8bGwqj3d2sCOyEM/PtwXUq2iGExPskN1ATR+EQ==
X-Received: by 2002:a50:931e:0:b0:4a2:2e8a:14cc with SMTP id
 m30-20020a50931e000000b004a22e8a14ccmr4271090eda.1.1676395928744; 
 Tue, 14 Feb 2023 09:32:08 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:32:08 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Date: Tue, 14 Feb 2023 18:31:36 +0100
Message-Id: <20230214173145.2482651-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 05/14] drm/msm/adreno: Disable
 has_cached_coherent for A610/A619_holi
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These SKUs don't support the feature. Disable it to make the GPU stop
crashing after almost each and every submission - the received data on
the GPU end was simply incomplete in garbled, resulting in almost nothing
being executed properly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 36f062c7582f..82757f005a1a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -540,7 +540,13 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
+
+	if (config.rev.core >= 6) {
+		/* Exclude A610 and A619_holi */
+		if (!(adreno_cmp_rev(ADRENO_REV(6, 1, 0, ANY_ID), config.rev) ||
+		      adreno_cmp_rev(ADRENO_REV(6, 1, 9, 1), config.rev)))
+			priv->has_cached_coherent = true;
+	}
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
-- 
2.39.1

