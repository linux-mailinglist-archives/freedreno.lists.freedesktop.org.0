Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB937774C2B
	for <lists+freedreno@lfdr.de>; Tue,  8 Aug 2023 23:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95EE10E3F6;
	Tue,  8 Aug 2023 21:03:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F2610E3F8
 for <freedreno@lists.freedesktop.org>; Tue,  8 Aug 2023 21:03:19 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe21e7f3d1so10087746e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 08 Aug 2023 14:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691528597; x=1692133397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QHqFXZ6x0OPm4ZMw7WQeV7WZNp4cmRIh/Av5DgwSNhQ=;
 b=GQUbyw4eRYjKwQkU5ZMU/yeNnQVDHGDQdMvp/qWJGIY57WAbwVGFi3beDujQ6DoFkD
 deiVVsvTtEZZT6uz3lACeVQkh5886v4aLsOAyuUfgqCdxir+SLFu3rEcv/obMnTgAxV6
 yeT6l1GhG/sudeo/uTTdKZ6jai9Xn4aKc26RgdSxgq++VhsSyRGJvplJDSb6NoUkD/GT
 n7gasiqw7oDvjknFzGddWUp60RVM3W+FruMhz6u1/NVVghH+5FQtkH0QLVLDIku2uxVB
 KXS6GSjqoyok0rp9k5ki1PYoDqyKfqxCOF6v9cL4guXjzVK7F5scYE3AT77rYIwvzera
 R0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528597; x=1692133397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QHqFXZ6x0OPm4ZMw7WQeV7WZNp4cmRIh/Av5DgwSNhQ=;
 b=CRRI57b980BA3QQ2WYVx8sgZynLG8gbcUH8uxGQPm3JorrE47x9htgUT9We1lcFmRq
 VivR0cxWCps0z7m4GksTHE/VFDP/WljE4rl4e1ghFcS0IzTQP0gWwOOhnqHzXTTghN1S
 2mcK/mla9GMGW1MJKSJ/n/x9zCpSo/kYurEke6ZVdW57oOYfUvLebisxz8Z9+1iaX3Lg
 TiB989Qluv0ypv+FAdpfuXEKqg+quGVLicEM72epw3d7MxAqPRoQU87bv/GOKI1eR4jr
 SiOKgKW6J4CCTk6KZViCPJ8X7d9G7qevtUaBgCCiFGDXKkdnPJaaF/8YP0n5ZTeTkI5V
 6qPg==
X-Gm-Message-State: AOJu0Yx7RlpRx8NVxZUlxpSF+n+CdWy9qEKMsTe9EMqM8vLb1SdoB6+G
 0IkWyHHcX0w3z8e68KKZIpi/Gg==
X-Google-Smtp-Source: AGHT+IFIE0Szj/KgGDm5MrS0BWlSGQSLooWZrPv7OJdSkMIOa28C2Xb44HY47TOrwSvtshviQefZoA==
X-Received: by 2002:a2e:9d54:0:b0:2b9:dfd1:3808 with SMTP id
 y20-20020a2e9d54000000b002b9dfd13808mr460068ljj.25.1691528597563; 
 Tue, 08 Aug 2023 14:03:17 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a2eb0eb000000b002b6cc17add3sm2431483ljl.25.2023.08.08.14.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 14:03:17 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 08 Aug 2023 23:02:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v2-14-1439e1b2343f@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691528566; l=1394;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=adxhdr38vQ+H8w1ud+VW4JLIkAtv3z4AL0XqkuOgPHs=;
 b=XQDGBxuHYfbbYepOx78RUkDMexkbi9oIwe5G+gOBDPTNfeODBiBmltLstJo8wG7FOZvlbmixK
 dJY8My1JyIxAjexcNUki8A3SAwf+Ej9E7lDVtfvwQXhZtaZ6C1DidhH
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 14/14] drm/msm/a6xx: Poll for GBIF unhalt
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
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

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2313620084b6..11cb410e0ac7 100644
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

