Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A2B741995
	for <lists+freedreno@lfdr.de>; Wed, 28 Jun 2023 22:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02F210E3A1;
	Wed, 28 Jun 2023 20:35:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3AC10E3A0
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:48 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fa16c6a85cso82320e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984547; x=1690576547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w4FrtTzzHgJt6VgBD5Al19EdXlLxrqJDKTmf8RSr2nw=;
 b=BayOPWTj/YnDNGngG10tqbk/lga6jA6qkD1rt8kJU0L5moKrqx3DYkXvuIFmQ28aVu
 I5oei8+BP4P4hOr3ATnzH+nUHxm0ESM5xE0401AJTPv5WKZNgyNgiBGBSwUw7fC/3Vnf
 yOndcOvJ5q6+vLLA/KW9o4NeMDFiNGyU/6ZY1BUDPdd2SVK8KJz2ww91FLQQ6sSIwIZ4
 Ba2aBJGAU0xPfD7HVbAwQ5XbIobd01rKXoBu1+WTYN33EoWofY1ymB7cjSfSA8DMB5oT
 cjtbvjaOTJbj4y6XYEwEjknU1+sUWByuChuO+dkIaMBQFMokKX6NaLSAtP7YeBM7fH4u
 uNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984547; x=1690576547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w4FrtTzzHgJt6VgBD5Al19EdXlLxrqJDKTmf8RSr2nw=;
 b=ZTtHVD2g/A4E8pdaIzUhgIWdEbA+Ian33OkAKLAp3nowH96nqbmGQ/jNkgIRgDKXKE
 hNs3OeAFWsubYAn0a1cKoeCdUsLkjkIn2nDNpOaly+s1Wr+jCd8f2aJ0o+tN+oIE81Rc
 H5aJR7mG8MuEKXZpCK/9bH68exATKQKY+Ljr2ZIYBHeo75iqFvBOObZJhyjWO2G3S30s
 JEHvzYWS06n2oBvtZU0/T12WVhZKQKCNyQS2Yk9bo/kiwEXv34Vx9t91redrFGqrbyr5
 S41OSZmeWqsuI+dDTvRbugbf++V+KactZY6rbqvQRUA9sm+9j4+DYYw1wep/sbkRtroY
 ixEw==
X-Gm-Message-State: AC+VfDyONX2x8zi1P2zg/seHh21x4TRAf2dTXsR33bNFm8W49Bwj+lLm
 P+oczHZ3XpyeSKKLwbJ5ADxvvA==
X-Google-Smtp-Source: ACHHUZ7IRPMwemXJGk4bUgZ8NEjR9/5Bz4Lvpzn8XaqFqMIHZc9eoQ9qMsT19SSmiByMSzSsrdUDAw==
X-Received: by 2002:a19:6755:0:b0:4f8:58f4:b96e with SMTP id
 e21-20020a196755000000b004f858f4b96emr21900556lfj.37.1687984547234; 
 Wed, 28 Jun 2023 13:35:47 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:46 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 22:35:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-14-a7f4496e0c12@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=1255;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=5Q1kvDGqQf+MZGSOe2N8n59sdYSKweQE1iz0+XOB04c=;
 b=eXvXP/e+RhlAwoWIAvEi5snC/1AjilAjPzcIT9/z050IFx7BiJqsJPVjijWMHbh0Eosacg1Mh
 yHlbBK/Mq2rB0sbPFYndGRfJjM8/YkKiNuzpi1B5hPjhfx845Uzw/Wt
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH RFC 14/14] drm/msm/a6xx: Poll for GBIF unhalt
 status in hw_init
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Some GPUs - particularly A7xx ones - are really really stubborn and
sometimes take a longer-than-expected time to finish unhalting GBIF.

Note that this is not caused by the request a few lines above.

Poll for the unhalt ack to make sure we're not trying to write bits to
an essentially dead GPU that can't receive data on its end of the bus.
Failing to do this will result in inexplicable GMU timeouts or worse.

This is a rather ugly hack which introduces a whole lot of latency.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fac325217a7e..b0fa764ba299 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1629,6 +1629,10 @@ static int hw_init(struct msm_gpu *gpu)
 		mb();
 	}
 
+	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
+	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
+		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
+
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	if (adreno_is_a619_holi(adreno_gpu))

-- 
2.41.0

