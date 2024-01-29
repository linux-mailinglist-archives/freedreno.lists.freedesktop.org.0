Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4B984069E
	for <lists+freedreno@lfdr.de>; Mon, 29 Jan 2024 14:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB9010F722;
	Mon, 29 Jan 2024 13:20:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E3F10F70B
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jan 2024 13:20:09 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a35d0764076so83270866b.1
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jan 2024 05:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706534348; x=1707139148; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I5eVpbB25HXQxgWJrqti9OANlwnBf9Ih23lyrFGGtAA=;
 b=IIaRWXrH9GLY9MF7rd6GMCmmydvW50ucmfr36QVchyqMnbYMjxxt/bzlQBsAgd2cWD
 DpWvfM22kP5jBryuXUfka93QKkqpTIr3RncXtprwRH863LW/W05H/jDQLbSNsfqka95q
 upyWlxUQ87VEY1nf8TuLFJirWmDfYwUSi1ngX3u/FklAICubp3TaUPjGVQR9x7KWh0zQ
 IBQeKuAHXcWWNTiv//VnEKZ1zYDYUYgy0giJJGlXLxRee/+s7kcTUPClygNZwghRjWh+
 rzcerifr+4WIlhLE7QgqQZhmlqKZ4SqxUuneri/E55jXg2NQZXF82DEn5GUaJ2ToybX2
 nF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706534348; x=1707139148;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I5eVpbB25HXQxgWJrqti9OANlwnBf9Ih23lyrFGGtAA=;
 b=fsYFYyHh6H+Xl2HCSQx1mbN2vDsEG4wY+9pgqCKRqy7Ep/KY5a08wadebwoJDuuW6W
 9+SJj47uwtHhEOPBlynLkQ/fMYjF1cEwbX6rnYFbfwsJUpXJHM/QeNXVMelvuelsPy5n
 aAwLjjKI/g1BbiqmCRU+OLLi/P7tCdg0my1T5vpaQMAR7VGJVrmLbe15ObiBVukitxdY
 uamj4UV/nn8JCOkUzuoHkUZ70AllwfEpxUZpjfv0CyXvurPhuwQ0oZHqU2fg8F6pe26l
 hPpazKYADMcl4F3p1+oOFPmWOXjD9KkxNYa4QU/7KZmvzMKqA2Y0QtC5Gh+qeuYse9h5
 aUOA==
X-Gm-Message-State: AOJu0YzlzhL6A0hdBmhMYtdziJUWbdccVDNsiRudWz85at2M+6mrVuYz
 TgVvbdnGIPXk+toB69KJmuDxHqOAaIKFOikX/5jGxp1NxtHlV0dWDTWNfSPf5p4=
X-Google-Smtp-Source: AGHT+IHqRqczW+spX0XIhFaQfcphzdcZCldgLjhlKdkZECtdAxveG++qjRbAtDQfSWy/ooYRG6xNIA==
X-Received: by 2002:a17:906:bc49:b0:a35:69c3:8af5 with SMTP id
 s9-20020a170906bc4900b00a3569c38af5mr3225051ejv.36.1706534347903; 
 Mon, 29 Jan 2024 05:19:07 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25]) by smtp.gmail.com with ESMTPSA id
 q15-20020a17090622cf00b00a359afad88dsm1591658eja.10.2024.01.29.05.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 05:19:07 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/5] drm/msm: Add display support for X1E80100
Date: Mon, 29 Jan 2024 15:18:53 +0200
Message-Id: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL2lt2UC/x2N0QqDMAwAf0XyvEBSi4z9ythDqlEDpZOGDUX89
 5U93sFxJ7hWU4dHd0LVr7m9SwO+dTCuUhZFmxpDoNBzIMad9U5MhJP5luVAiUMfYiRKMkPLkrh
 iqlLGtYXlk3OTW9XZ9v/n+bquHx8AJ2B3AAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=WXwCrF1iMEcXk395vZUIozuTjV7W1KezDJ0wK+pB1dM=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt6XAyyrUHNMZ7tZaQaVkKEhqXAPQYD297pt77
 cVz/Nvo4dCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbelwAAKCRAbX0TJAJUV
 Vv61D/9bBdHXS2wO6uKyfd7rbe1VW/qu+1zH6S6JWIsPFoU1rpxKaN3xBeA24PvB/qvt4AD1PYz
 xZNQMdJA1PAC8MDqz4/NanHfBFVySXwo/7+Xu31ocVupozgKfbIevnAJxbMh7YvSaVgiru0UcrC
 p6VigFeydgfKVqWm192f9K2K+GaRC92TfFx7FeHU/ptzu1UbaxxRf6hmn+C/E6nw0SfS20GMkKq
 +QA65vuln5dQ5roWvWsFlj3XCrr9clS8U6nqTlVpC1d1pt81tOERCP1ithcJGeGHqxHHbJFURh9
 7cNwkRfZzVxGPXKREvwbvZxVYxZ/doljclG5U+YWAHR7xWGdygTn0pg3pER3yS6jaD/kqQ2Voc2
 5FPVl3W0u3sBbjP/KGLbQQE+bIYesaqBdnEKcH2p+zMTq7yHgpOA1rOCKZelbIGLCXlAR6pmSgC
 KUO/wHRQDPwh9GIzmVkJnnspHDXEj5sHO1o+tG/PqVP9dvCAQonRXUzKtjtJGRiQpjdbp4JtsnT
 MeiNuutD5Cho2eapVCv1ukETcJA/SfQ3F/MrZn7NMz/RoHjisv0T8mL0Pb4aCdEmilm0Ejisd83
 fMnNXZdfIYU81HG1QH/BkPSAUQjKsLC8yAxa2YNRppJgv7cPkrjW+ITRpI/HITT84XTIv7j03Bm
 F5w42EbmwAIFGmw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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
 Abel Vesa <abel.vesa@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patchset adds support for display for X1E80100.
The support for embedded DisplayPort on this platform will not
be enabled using the connetor type from driver match data,
but through some 'is-edp' property via DT. This subsequent work
will be part of a separate patchset.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (4):
      dt-bindings: display/msm: document MDSS on X1E80100
      dt-bindings: display/msm: Document the DPU for X1E80100
      drm/msm: mdss: Add X1E80100 support
      drm/msm/dpu: Add X1E80100 support

Abhinav Kumar (1):
      drm/msm/dp: Try looking for link-frequencies into the port@0's endpoint first

 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   5 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 249 ++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 449 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dp/dp_parser.c                 |   6 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |  10 +
 8 files changed, 721 insertions(+), 2 deletions(-)
---
base-commit: 6776c8d0924953c6bbd4920d8408f4c1d898af71
change-id: 20231201-x1e80100-display-a46324400baf

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

