Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEEF540E80
	for <lists+freedreno@lfdr.de>; Tue,  7 Jun 2022 20:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A0410EEFB;
	Tue,  7 Jun 2022 18:58:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898C710EEFB
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jun 2022 18:58:09 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id y29so20253938ljd.7
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jun 2022 11:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/W9jGpIH/OL56+uBhFnE9P3noAAOQAr28i57rZ4o8JQ=;
 b=Fx68vBqv45589Im4IvB0H8RQ6BqBh+sZp72BRgAEYLdJUHRr5zV3uUKQXxAjSGUa6q
 TCRiIPrfiGlbN9VT3oaxlxkAEPik61ghm4YmrJEiPPrnU6kFTxxb+LhB2c2O8iujSbpZ
 vYa0IXYWBue7/PqO70VJ2VbjW+HXeMZIspILfuL/mUL0wG5E+krhe8/YDsfxiZe5D8+k
 qCMIHa60w5zUFT9WMf2LTRvvMJrH4MU7NV8zhsJT1ffDSPXHA54XjHcBlj8S0T94Bb3G
 fkQdrK5t0CnollXZ7RGFXTbvnyOPE2iMS5kBvNZWKmI7LkrPYHWDCqkJTfc7KvdS2Ilt
 fesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/W9jGpIH/OL56+uBhFnE9P3noAAOQAr28i57rZ4o8JQ=;
 b=cCRCKaaDfV1OJZCB/l1cQl/fbyDsQsN3QKhvJNsSTONidqHLwDQLqTq5wyHtoX+TSt
 /EpAyH7FNqXmzfVCYI4iAAfJvgADldudQKUEWuh4dVFrYGnx5XcU2maS/i5vxeaFSiv2
 /x47HUCf+54No4sXhP149Fb2Ixma+eDnilQ087FEdoIQ4r9MYAHTRjGRqY54CFIgYLDg
 Yurwgs+B9Os7HgS8Xwaocp38fJ2+w1hZ567WnCAuk0zRBCPOB73wM/sU4LWJUAxMPhit
 3JFiqMDPZDCXCIP3lV0BGL/EzY7cJOnQwsloJtkIK7S56pslgz232PAT0o0+5X0zJ+ZM
 hsZQ==
X-Gm-Message-State: AOAM531uMbr2uC2nKHzx+A0uZ2aT1Tnn+fcsN7SEs8NYtwqGwltoJv44
 3Xh+Z/NT9P18D6msoxjNvajepw==
X-Google-Smtp-Source: ABdhPJzLmOS1+/guV5q204SUkhFztXDSFtNTawl/bLE9lR2G+hjpUayf3IPB1mxKvThg6bhdHx7edw==
X-Received: by 2002:a05:651c:1a10:b0:255:9422:a7c6 with SMTP id
 by16-20020a05651c1a1000b002559422a7c6mr7959383ljb.328.1654628287555; 
 Tue, 07 Jun 2022 11:58:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 11:58:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Tue,  7 Jun 2022 21:57:59 +0300
Message-Id: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 0/7] drm/msm/hdmi: YAML-ify schema and
 cleanup some platform properties
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As agreed with David, this is a continuation of his work started at [1].

Changes since his patches:
HDMI schema:
- Dropped generic pinctrl properties
- Dropped data-lanes property, which is not supported by the HDMI driver
- Switched to unevaluatedProperties
- Moved clocks/regulators/supplies to condition clauses
- Specified phy-names as used by existing DT files
- Dropped #phy-cells
- Dropped power-domains property (which is not used by the device trees)
- Marked old GPIO properties as deprecated (in a separate patch)

HDMI PHY schema:
- Split into QMP (msm8996) and non-QMP (other) PHY schemas
- Added proper clocks/clock-names/reg/reg-names descriptions

The rest of the patches consist of the new work. They further cleanup
the platform configs, remove unused supplies, etc.

[1]: https://patchwork.freedesktop.org/series/98353/

Dmitry Baryshkov (7):
  dt-bindings: display/msm: hdmi: split and convert to yaml
  dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
  drm/msm/hdmi: drop unused GPIO support
  drm/msm/hdmi: enable core-vcc/core-vdda-supply for 8996 platform
  drm/msm/hdmi: drop empty 'none' regulator lists
  drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
  drm/msm/hdmi: merge platform config for 8974/8084/8994/8996

 .../devicetree/bindings/display/msm/hdmi.txt  |  99 --------
 .../bindings/display/msm/qcom,hdmi.yaml       | 240 ++++++++++++++++++
 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 103 ++++++++
 .../bindings/phy/qcom,hdmi-phy-qmp.yaml       |  84 ++++++
 drivers/gpu/drm/msm/hdmi/hdmi.c               |  98 +------
 drivers/gpu/drm/msm/hdmi/hdmi.h               |  13 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c           |  62 +----
 7 files changed, 447 insertions(+), 252 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml

-- 
2.35.1

