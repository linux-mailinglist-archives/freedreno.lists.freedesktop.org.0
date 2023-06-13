Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE4472DADD
	for <lists+freedreno@lfdr.de>; Tue, 13 Jun 2023 09:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E6910E340;
	Tue, 13 Jun 2023 07:30:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BFD10E33E
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jun 2023 07:30:22 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f8cc04c2adso2907455e9.3
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jun 2023 00:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686641421; x=1689233421;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PBDkCj6IzOprmvk0wsDqFhkKf1Z88p1shaiXxO1NVss=;
 b=fZuCJTbOyXS8c7Ez4hWwkZplKnxZYGPzK6QpJkWLCjBUqHlESaHFK4lkrsYRFKOWr1
 eoSgWUSFQKGTSLpcwoXWW3+9u8D/1K5gJSEr8DdCB7SXRT1peVKq50AuECMO7TWfDOeF
 wYLQEews3OmYYL3w4mOT2PGUmZR6oTC6rVWG5z4+pFdGuMofbbE8BHDzBOrhL3bdwjto
 zPjtk9OcntbBk1UKlmxYfMcF7eEJ2xwxXX3fvdxT6Rb5G1u31hOQDhJ17boOnDTKpcRV
 fA2PGUTZVda4Ocd6RyxkbMjGT6/7SetLUDTZ+7PtRujVALzLJbJILHUR9HvFurZ01NjT
 66NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686641421; x=1689233421;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PBDkCj6IzOprmvk0wsDqFhkKf1Z88p1shaiXxO1NVss=;
 b=ONkPTJnfUzi5pJw42HDIYzBsrw4KMXGJMUF2LqG5AkWciQWgyXfT6T7RUc+yLXWzoW
 fdHeKTWQI8ntLwrZCL00KDO1jTIKldSTQTxusDzMx5w44mMYYgIUOr4lkHG6f24iEoz4
 PAMPWzGqLdCwoPmdKFEp2Qo5mri9eZzsNjqB2+nU+DgRiYNN11rzrEvgcgktYJoB/sao
 N5U29UTreehLUKdpYO33plrtMBK2azVdwoUwztnQwUisN29qsENMiS597x6unJCbl4Yg
 gkOicPDaSYz30dn5U3CgbDR9Rbt6hY8a47KXkl2Vy2O9bWIdARz4+YSRUgPfSr+lXAnF
 eyZA==
X-Gm-Message-State: AC+VfDwjE3mVSROCQx0GGr38Ot8iU2gVsbXi02FejyFOn3V61ZftAMRi
 JtE9qIjlXAgZtcedX5rN1cZGYg==
X-Google-Smtp-Source: ACHHUZ6GhVpOh89E7wzRUZl8GRroyUGL8JF6b5FpJb/rSQKDuOUL+eUZZiMjzNbPPBGSLWTlVjOZ/g==
X-Received: by 2002:a7b:cb88:0:b0:3f7:e4fe:1dd7 with SMTP id
 m8-20020a7bcb88000000b003f7e4fe1dd7mr9485430wmi.13.1686641420564; 
 Tue, 13 Jun 2023 00:30:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a7bce99000000b003f17848673fsm13474453wmj.27.2023.06.13.00.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 00:30:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 13 Jun 2023 09:30:11 +0200
Message-Id: <20230601-topic-sm8550-upstream-dp-v4-0-ac2c6899d22c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAMbiGQC/43NTW7DIBQE4KtErPsqfoKBrnqPKAvADxvJAQscK
 1Hku4d4V3Xj5Yw037xIxRKxkp/TixRcY405tXD+OhE/2jQgxL5lwikXtKMMljxHD/WmpaRwn+t
 S0N6gn8EpJpzlSvbKkzZ3tiK4YpMfG5Du09TKuWCIj/3vcm15jHXJ5bnfr+zTHnhaGVDgBgPyT
 hspxe8Uky35O5eBfNSVH5V4k1ArpRk1Xkn1TxJHJdEkGUwIvXdadOaPtG3bGyb9a5lqAQAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8DvxRryXQQQ0y8Oh2tMAV/xSohwX06++G2+ngE4ucu4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkiBsKTJOKtHi2EI9K2dRfEfI1j0+AEfmWgTRgqqGl
 BTBUvuuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIgbCgAKCRB33NvayMhJ0ZjJEA
 DJm9dMBNEkuCdJ3V0k54VYU3+fm2YHKjKvaokmK9lT0WHXfQ5ABko38xxGcM30yozhSFcOYLn+O1Oa
 +PpY183grbzvysTLCfD0/uhAm8euXU/AFQAB5Qzpsm+v7gMSqQP96eXVSV498GA2EDB+ZRa3wlDitc
 5zUXSD9+nw9dxySsePDHZzWt+7GdCBSMUTBDnaXpp+VS5tFgk/UbVdNpUZ4B1a3eyHjbv7blKFyYs9
 eOmjYmNGYuMVd3mab/17OvihVinkileSwI+hbyDhRPV2aLsFOXnOptoSTcPOx2HGZUxuGf5Bhfobt9
 Ec4PgiVgwsU2gDd0YsMF1EbPgpBDcpdanesTjae7ews7tC9yU5PquZTGeZnaEtf5Jd/bErbEYvTviM
 Y/hesIorIfPnONdmQIkutTQqqEvIHsp7hJLJV7bBcTUM+6xTYzbQeC0RaPNocET/5XJm/rFWaN6dVv
 yMdqkdWVcLnMdx8bCJGw+Ss67mA9WgwpVis55V7A2WL8SlkMC4GV96ine9E2RD3iSmUuJ/CbrtvSUd
 oDvLsL06kOeaL7rJwxWVLGI+kxTJ6dMKXm6pPP0ricTmTytaxDCabGH8Z8Mzyc57XK1JvaLNFeQBMR
 aSYtPpsKhbqJt/wJyGZIRN7zPIiEfPNLdfa3C9ccoEzaZZAhWCq1JNR0wDrg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH v4 0/2] arm64: dts: qcom: add DP Controller to
 SM8550 DTS
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The DP output is shared with the USB3 SuperSpeed lanes and is
usually connected to an USB-C port which Altmode is controlled
by the PMIC Glink infrastructure.

DT changes tying the DP controller to the USB-C port on the QRD
board will be sent later.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Added review tags from v2
- Link to v3: https://lore.kernel.org/r/20230601-topic-sm8550-upstream-dp-v3-0-5f9ffdcb8369@linaro.org

Changes in v3:
- Rebased on next-20230609
- Dropped applied bindings
- Link to v2: https://lore.kernel.org/r/20230601-topic-sm8550-upstream-dp-v2-0-e8778109c757@linaro.org

Changes in v2:
- Added review tags
- s/lov_svs/low_svs/
- Applied fixes suggested from Konrad
- Link to v1: https://lore.kernel.org/r/20230601-topic-sm8550-upstream-dp-v1-0-29efe2689553@linaro.org

---
Neil Armstrong (2):
      arm64: dts: qcom: sm8550: fix low_svs RPMhPD labels
      arm64: dts: qcom: sm8550: add display port nodes

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 95 ++++++++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 5 deletions(-)
---
base-commit: 53ab6975c12d1ad86c599a8927e8c698b144d669
change-id: 20230601-topic-sm8550-upstream-dp-b713ba275d7c

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

