Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7741966A4D5
	for <lists+freedreno@lfdr.de>; Fri, 13 Jan 2023 22:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325A510E204;
	Fri, 13 Jan 2023 21:12:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF12910E204
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 21:11:58 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id l139so23860909ybl.12
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jan 2023 13:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nwi1WKddhAW8sPy/ujwfpc17G/Uaa3ESBQr8HYWaLxw=;
 b=ExxIeFvd2GIeHxK1e+u7KroQtACr/sH8/Ejm/zvlmXV5RBmEQVVZQCPlClFKUg+Y/Z
 Zu3o8WoEMu4BezFPqGnlQee8qPTqHyb/Dcj+xVOZfPj19hblI7bmW+jOWbDqCDasMjWd
 xlCM1bDHQegocMk5ELWQxR9whwDPRTfhJ98FzgZpUw+w9gY6cy7y0SKyyu3lNDOjzfbo
 h08KT8Qr8L7kgMW/RsyycO3QVrxrYu2BzJ+jpPjUf6P93rF1prGzohzz3uvWo0jByz+z
 7T8OW/7o2lbGmpcMdVyFEsgfkf5ztFQWM+rQy+1zEnzLa26wp6G4RE/6eJKBdDLkhqG2
 Q/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nwi1WKddhAW8sPy/ujwfpc17G/Uaa3ESBQr8HYWaLxw=;
 b=AeWbO3vLuJ/XIVfKTdsoT6m1w1LJqUJ+yKM7CQG17VJKiAEFyEtycSjCPUQGOy1Sem
 8bL+GEVzyC3TKStoa8YhlRZymwtN6UYR9HxNtU13z1JZE1JrTq/R/QHraIO7i6Q4Z1ys
 L+Ddp41wRLc3EnRhoNvRQaFCOLiz+8e+/F9ejbYxc3Csb0I0CVC8HexpS58GdRohw22e
 v2IVy8e/AOeNyY/lCbOb9N3/JvrfH+7KWr4rXzvY4fPw1bMdt8aFlODj2aka4qI6NUcp
 PkoyNI/FPaXO6ws4NSkGBfPe3tVwL44o8ZZgcR1OgXXpSM0rAMavcutcp6AjCR5G2uRp
 9Pdg==
X-Gm-Message-State: AFqh2krnKJQqCkzuUxW0nDjt75bV3S9i/rTPTxOrlCwK/RR4iXi3F2C1
 C9B0x/iLVAmbVmrGeRgm6dRlGCOCgHKguOapp1/ayg==
X-Google-Smtp-Source: AMrXdXvcqjA0Ri5PB+/+im8+2opI/8QMNUqxjMQxunAmz1hTImGN3pCiltxTaFVZMZwXeDlQ8av4C7+HLdLGbnDwgn8=
X-Received: by 2002:a25:cc7:0:b0:6e0:c7d3:f026 with SMTP id
 190-20020a250cc7000000b006e0c7d3f026mr8961122ybm.275.1673644318081; Fri, 13
 Jan 2023 13:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
 <167362343145.2212490.16180994187587985655.robh@kernel.org>
In-Reply-To: <167362343145.2212490.16180994187587985655.robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Jan 2023 23:11:47 +0200
Message-ID: <CAA8EJppdA_LZsbF9zbcF=bf-HqOyM=xSNoOX-_7ZA1w5WWExLA@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 01/11] dt-bindings: display/msm: convert
 MDP5 schema to YAML format
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 13 Jan 2023 at 17:26, Rob Herring <robh@kernel.org> wrote:
>
>
> On Fri, 13 Jan 2023 10:37:10 +0200, Dmitry Baryshkov wrote:
> > Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
> >  - MSM8996 has additional "iommu" clock, define it separately
> >  - Add new properties used on some of platforms:
> >    - interconnects, interconnect-names
> >    - iommus
> >    - power-domains
> >    - operating-points-v2, opp-table
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
> >  .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
> >  2 files changed, 138 insertions(+), 132 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230113083720.39224-2-dmitry.baryshkov@linaro.org
>
>
> mdp@1a01000: compatible:0: 'qcom,mdp5' was expected
>         arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb
>
> mdp@1a01000: compatible: ['qcom,msm8953-mdp5', 'qcom,mdp5'] is too long
>         arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

This is because we ended up in the middle of the conversion. msm8953
ended up using a new style of bindings, while the rest used old ones.
This is fixed by the patch 02 (which adds SoC-specific compatibles to
the schema) and patches 6 and 7 that convert the rest of DT.
--
With best wishes
Dmitry
