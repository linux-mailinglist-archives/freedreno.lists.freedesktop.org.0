Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298B167D4D5
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 20:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8581810E97D;
	Thu, 26 Jan 2023 19:01:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1235710E97C
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:13 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bk15so7657012ejb.9
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+QaWTie8mUd4SkzRTgoE5j5+1M04llz8djdt6Ao+5U=;
 b=bBGz5unnYPdK2er6RLtN6VmuEhsYY/ZzZ3AjpaNcLUg1pEGJXndCcNpNKulFBJT1pA
 iKuvWo1xANnbvgNhFiAZcC25fnXeWhNwa/kKOgxoH5f9NkLYLFJC8gn1RowWA1TH/u0F
 ksne6TDVJf6fSqcMDiHOf9olhN2DRKTGCnrqhzA4J25Wf8vQPkm7Gs0n8Y/yZ09oKOfW
 TSkgghSRaR949pvHL5okjcAMd0zjEWJeQn9NjMKDQ006Zd9t22VuBMWDvGvT6nE5CvTJ
 yUjGEfL0MplDBkR0B/+RNLEha9S7IbMjB4o274N/6kvUSaehmvQzR1gvpACLkTWV1efm
 lQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7+QaWTie8mUd4SkzRTgoE5j5+1M04llz8djdt6Ao+5U=;
 b=VcKVkVeM09u7qQQrYFH/Qvy+r11IuIrw3j1A0TzPN4vt6uIN+baqirzMlfTlV7VTti
 DB1nhzYi/EjIsbW4Xmf+VzN7k/9H8jOAOc8cAHGEhpHUWfwO6bO6/sXvEKD09eIlzUP3
 3fDJYcjL81GSimXyv6Sa+nG3vYVIG2+plYxD+R5KIiF7fzvVNiG9v0PmQtIo3jBjZOnt
 GtMJrqvH/Yrl94XkJqUzycDnnmvsSVntyXluIEcGBSFf/iDXYeVHuuXTo7BuWtjYLjk4
 embBTH+Mh4J08o0EobtMFJq+QA1cy1PNAbcCnxA8IjKurPgIvxV9Kuv7AzKvplLx3CEP
 oB3w==
X-Gm-Message-State: AFqh2koKF41Fx+aIoG7KX52SqmFiXobhuE43Y0I3gqx4BxWBd7rqByS2
 A7X8V8X25LSUGzAaUUOpkq8G4Dn+g7025Vdx
X-Google-Smtp-Source: AMrXdXs4I0OTW36HZKfzhHmWjGW5zXT480w7xSGDhvznva1jtZs3H2u9vxa9fJgqoAMH/5OuphyhlA==
X-Received: by 2002:a17:907:a702:b0:877:95bf:cff3 with SMTP id
 vw2-20020a170907a70200b0087795bfcff3mr30234148ejc.77.1674759671678; 
 Thu, 26 Jan 2023 11:01:11 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Jan 2023 21:00:55 +0200
Message-Id: <167475959086.3954305.3794482888936881382.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 0/6] drm/msm/hdmi: integrate msm8960 HDMI
 PHY with DT clocks infrastructure
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


On Thu, 19 Jan 2023 15:22:13 +0200, Dmitry Baryshkov wrote:
> Make msm8960's HDMI PHY accept clocks from DT and also register it as a
> DT clock provider.
> 
> Dmitry Baryshkov (6):
>   dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
>   dt-bindings: phy: qcom,hdmi-phy-other: mark it as clock provider
>   drm/msm/hdmi: switch hdmi_pll_8960 to use parent_data
>   drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
>   ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY node
>   ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's hdmipll clock
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
      https://gitlab.freedesktop.org/lumag/msm/-/commit/56a80fe57691
[2/6] dt-bindings: phy: qcom,hdmi-phy-other: mark it as clock provider
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a0abe758ccc4
[3/6] drm/msm/hdmi: switch hdmi_pll_8960 to use parent_data
      https://gitlab.freedesktop.org/lumag/msm/-/commit/71e8a4509c8d
[4/6] drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4f62d9764273

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
