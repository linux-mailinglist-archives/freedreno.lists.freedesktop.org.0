Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B971647C64
	for <lists+freedreno@lfdr.de>; Fri,  9 Dec 2022 03:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D049610E03C;
	Fri,  9 Dec 2022 02:49:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828F610E21E
 for <freedreno@lists.freedesktop.org>; Fri,  9 Dec 2022 02:49:23 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id vv4so8475165ejc.2
 for <freedreno@lists.freedesktop.org>; Thu, 08 Dec 2022 18:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=53YW0ORFneqyG93srJ8jF+XX7zmPAnIboOzrEPTG0Ts=;
 b=THue66vB24/bYK1OKRCFn3bh/J/RhSIiO/22Xzu3S1OMJvLXwxUmZzaqbERTDmNPxX
 QG0p0q4606ivku/eGXQWQOeiIDGlgB5VSdhbxtsaFHyeVmlMcQ41A6JCmWrIFMjeLbed
 1QPWt9QMzlb32nmtD26qU5ryEWB5T3z82YP51rFbEtE90bFRGxb4WH0CwWFZ9sNZBDie
 YpGntb2COBf6JNsjRbynRwGQ5E9OEJXMlPt6aroZeRuLOjBeyF6GVdtPNDf/rxNqW9gD
 L5jh4FvWCbafrPqPi9eRB4EyDyH9EMgnUDC9O/kvvfbe8z/Ww1BknWX/k4YRHHKzjFg+
 S5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=53YW0ORFneqyG93srJ8jF+XX7zmPAnIboOzrEPTG0Ts=;
 b=77LGmbt0C2BDiOG8kEOJMtUk7dzQA8MtTT87BWM3UvcSo2YJuLb98pOCvk40qJn3Gu
 tYo77+4TYu0DgPBboAMXUAiJv4xbXHuw3bc0pTlNmaMby3OTu6ZJKhP45NSv/m5eCOqt
 6ou26bUwA0oj7DYZAR99OWb5ahjYwJD7j0Rc3D5zK0LNBeJbceXeWB8vdSuauQ5whL4x
 ZY3pwVq267nue7RZDGVfCFDw23i/1wxD5iWFc7sq3e8+e9dKJyNp5KMVkirKJM9sM3JP
 VeTMMvjxdA3X06GqPQDWiTrFlRY8dCSoumlL9Y6ksa6DWpdh8xwpn+YjBLa/vuWWmSwT
 +USg==
X-Gm-Message-State: ANoB5plVHUJwxD/IqELykNPRW29o0DRbG1l7HPHrQag0wYpFmzDtlumm
 RedBucNKMn5OMwyW1Pu4d4o68jvBTmDkwZ4kbDvcDw==
X-Google-Smtp-Source: AA0mqf6doDwZB2F+lKd6wShNarKCxmm1N6/epMJ03LBGs+paMSVEE2cZP89QidB84RL5HCl7NJLWWsopNGHRAj14smU=
X-Received: by 2002:a17:906:c44a:b0:7c0:d6bb:fd7 with SMTP id
 ck10-20020a170906c44a00b007c0d6bb0fd7mr18360425ejb.726.1670554161785; Thu, 08
 Dec 2022 18:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
In-Reply-To: <20221207220012.16529-1-quic_bjorande@quicinc.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Thu, 8 Dec 2022 20:49:10 -0600
Message-ID: <CAKXuJqirYDCGfOP=YMOGdacB_v0GNty7HZ+p0U19a8DpBMDGKQ@mail.gmail.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 00/12] drm/msm: Add SC8280XP support
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Dec 7, 2022 at 4:00 PM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> This introduces support for the SC8280XP platform in the MDSS, DPU and
> DP driver. It reworks the HDP handling in the DP driver to support
> external HPD sources - such as the dp-connector, or USB Type-C altmode.
>
> It then introduces the display clock controllers, mdss, dpu and
> displayport controllers and link everything together, for both the MDSS
> instances on the platform, and lastly enables EDP on the compute
> reference device and 6 of the MiniDP outputs on the automotive
> development platform.
>
>
> The patches was previously sent separately, but submitting them together
> here as they (except dts addition) goes in the same tree.
>
> Bjorn Andersson (12):
>   dt-bindings: display/msm: Add binding for SC8280XP MDSS
>   drm/msm/dpu: Introduce SC8280XP
>   drm/msm: Introduce SC8280XP MDSS
>   dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles
>   drm/msm/dp: Stop using DP id as index in desc
>   drm/msm/dp: Add DP and EDP compatibles for SC8280XP
>   drm/msm/dp: Add SDM845 DisplayPort instance
>   drm/msm/dp: Rely on hpd_enable/disable callbacks
>   drm/msm/dp: Implement hpd_notify()
>   arm64: dts: qcom: sc8280xp: Define some of the display blocks
>   arm64: dts: qcom: sc8280xp-crd: Enable EDP
>   arm64: dts: qcom: sa8295-adp: Enable DP instances
>
>  .../bindings/display/msm/dp-controller.yaml   |   3 +
>  .../display/msm/qcom,sc8280xp-dpu.yaml        | 122 +++
>  .../display/msm/qcom,sc8280xp-mdss.yaml       | 143 +++
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts      | 243 ++++-
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  72 +-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 838 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 217 +++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  18 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  drivers/gpu/drm/msm/dp/dp_display.c           | 151 ++--
>  drivers/gpu/drm/msm/dp/dp_display.h           |   1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c               |   3 +
>  drivers/gpu/drm/msm/dp/dp_drm.h               |   4 +
>  drivers/gpu/drm/msm/msm_drv.h                 |   1 +
>  drivers/gpu/drm/msm/msm_mdss.c                |   4 +
>  18 files changed, 1770 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
>
> --
> 2.37.3
>

Tested on Lenovo Thinkpad X13s
Tested-by: Steev Klimaszewski <steev@kali.org>
