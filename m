Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F4690A6C
	for <lists+freedreno@lfdr.de>; Thu,  9 Feb 2023 14:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4BE10EACD;
	Thu,  9 Feb 2023 13:38:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDC810EACD
 for <freedreno@lists.freedesktop.org>; Thu,  9 Feb 2023 13:38:43 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ml19so6556969ejb.0
 for <freedreno@lists.freedesktop.org>; Thu, 09 Feb 2023 05:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bi+cNN8MNydS94MbkJOD784fZVEZBaEhzXHs2Upm2b4=;
 b=D//V/YZZPzXi5NpsjvRuU+/1xhWiGYreIOG++95iz0ga2ChItuLx5keBwUJJkj17Pi
 mWuT+sob8Df6fTEowKjNJM0mJe3g8l+vdFtohCUnOOTcN0Kkw7Vn6y29PzpWxQvdnukW
 ZI0pwcb1r5VJ+uvv9gYeIEWDx4dND7rwHtJu5Cd97cRTGuvy8yZX4uCHOmVYbFEXud49
 nV0QXxq4ZHTs3/kZXrBoEdK8dTBjC6bxzH+s7JS15un58rUAwexbEFoHgV9qRZanHjXC
 X5nfye46QL2e5+b7+PW4Ff0K4oIc5ljKMY85HiJnhh8J0BOFuWLiaNVckWrFO1ib7UFs
 KVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bi+cNN8MNydS94MbkJOD784fZVEZBaEhzXHs2Upm2b4=;
 b=0/JiHHy4l4nxQFwbscztW39lv39KqRgAsLN1oA1/kLH/vq8ah+3eISnmQnED7ykH6C
 5fjuKe3JHgZYh7HQ1j492vWAm0SwUQJxyL3iiwLrD5wGNmwmwuUIbg2hBBYX0MqupQZA
 SDTjmPrHjcjBlaRdxrWWkH4Do56hD93IlRXMLvvhBVGj9EWHOiM03AKbjrjTp3j66lsD
 MoEJP461fqdcG4D9MEDAyX2WYQFTWOUb+WsAvCnCFkjjt3lcuWnTONB0l+DEv/sYHFSc
 BF1xjUyUSBbnGuFtu/X4Uf/h3k2otwf44pNySPGXXKDZedgLELtWuPDSIKA3YmB+w8kU
 CVAw==
X-Gm-Message-State: AO0yUKX5jXW+fryFmIBI7BnSXNOxRQr3w6QRm05Lwf+msAFseXRJ0xHe
 aV3oPiAYMK6yW4s+Ev5CGZ0SSQ==
X-Google-Smtp-Source: AK7set8jLbfeLd+2o5I0ZlDFcxN9JCOFY4+DgCS7ZZl/vH1aNdZrRRcCE6cR0FSPc0lHJKeI3thAzQ==
X-Received: by 2002:a17:907:2175:b0:88b:109e:fbd3 with SMTP id
 rl21-20020a170907217500b0088b109efbd3mr12149330ejb.24.1675949921602; 
 Thu, 09 Feb 2023 05:38:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 cd17-20020a170906b35100b0088f8ee84b76sm885553ejb.105.2023.02.09.05.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 05:38:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  9 Feb 2023 15:38:33 +0200
Message-Id: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/6] arm64: dts: qcom: sm8350: enable GPU on
 the HDK board
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add A660 device to the Qualcomm SM8350 platform and enable it for the
sm8350-hdk board. Unfortunately while adding the GPU & related devices I
noticed that DT nodes on SM8350 are greatly out of the adress sorting
order, so patches 2-4 reorder DT nodes to follow the agreement.

Changes since v1:
- Dropped merged patches
- Expanded commit messages to mention the sort order (by the node
  address)
- Rebased on top of latest Bjorn's tree

Changes since v1:
- Fixed the subject and commit message for patch 1
- Fixed GMU's clocks to follow the vendor kernel
- Marked Adreno SMMU as dma-coherent
- Dropped comments targeting sm8350 v1, we do not support that chip
  revision.

Dmitry Baryshkov (6):
  dt-bindings: display/msm/gmu: add Adreno 660 support
  arm64: dts: qcom: sm8350: reorder device nodes
  arm64: dts: qcom: sm8350: move more nodes to correct place
  arm64: dts: qcom: sm8350: finish reordering nodes
  arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
  arm64: dts: qcom: sm8350-hdk: enable GPU

 .../devicetree/bindings/display/msm/gmu.yaml  |    1 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |    8 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2512 +++++++++--------
 3 files changed, 1354 insertions(+), 1167 deletions(-)

-- 
2.39.1

