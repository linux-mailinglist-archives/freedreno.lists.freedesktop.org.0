Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA56166E7A1
	for <lists+freedreno@lfdr.de>; Tue, 17 Jan 2023 21:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE4410E345;
	Tue, 17 Jan 2023 20:21:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD81B10E345;
 Tue, 17 Jan 2023 20:21:24 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-15085b8a2f7so33267517fac.2; 
 Tue, 17 Jan 2023 12:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DK6EUVXiVoF71ZLpplwDGzXo79prqUrJw7XBoWZcTs8=;
 b=KIts0MpUX4/Kn/o0xqbS3RynoKNx8cceGx6dmMwkSfSP/TlpSLIBao0gIGFENZz6TQ
 TeCMMkDWEczOk5MkhUJMHsWi3M4AHwIUn68jeX5/Pk+NbIlrqML6HqveaqA29iUVpSqV
 3f0BAYIfq1Zcp8oLVZ4xl3AIqGBGTezYOMPb+Qpn7bqyRKNOVrpZWrwFhVf43dq2ZAXe
 qZgI5dQcDqRaeKf5q/bpvryYbm7wf5p3ZltegeWBqRnW7YmkS1+aIPx1mJJnBziEz7e/
 nhSpWe7Uo80OWvLvmLRc7U6wJtIv1MlayUfCg6JHW/jq7DOGOEI7ZdQ117jKvbwBLZXC
 KgOA==
X-Gm-Message-State: AFqh2krrFt76GDPGcXkw5X3Cf4vC+huAJMrbz4zLHLjaY5e233E6XMsN
 ZqSshpmdw+NCfwTKSacMmA==
X-Google-Smtp-Source: AMrXdXuCptqQO49Wnk2iCANx4q2uWgP0CeAClw4Io8/MCaW/ZeiGmADjQhFwlr2Yvix9oRBsSVtN6g==
X-Received: by 2002:a05:6870:be90:b0:144:d065:578e with SMTP id
 nx16-20020a056870be9000b00144d065578emr2778298oab.15.1673986883967; 
 Tue, 17 Jan 2023 12:21:23 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l15-20020a4ad9cf000000b004fa6789a085sm722442oou.45.2023.01.17.12.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 12:21:23 -0800 (PST)
Received: (nullmailer pid 3643082 invoked by uid 1000);
 Tue, 17 Jan 2023 20:21:22 -0000
Date: Tue, 17 Jan 2023 14:21:22 -0600
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <167398688215.3643022.13982729074970285092.robh@kernel.org>
References: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
 <20230116225217.1056258-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116225217.1056258-2-bryan.odonoghue@linaro.org>
Subject: Re: [Freedreno] [PATCH v8 1/3] dt-bindings: msm:
 dsi-controller-main: Add compatible strings for every current SoC
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, dianders@chromium.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, robdclark@gmail.com, robh+dt@kernel.org,
 david@ixit.cz, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, airlied@gmail.com,
 swboyd@chromium.org, freedreno@lists.freedesktop.org, agross@kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 16 Jan 2023 22:52:15 +0000, Bryan O'Donoghue wrote:
> Currently we do not differentiate between the various users of the
> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
> compatible string but, the hardware does have some significant differences
> in the number of clocks.
> 
> To facilitate documenting the clocks add the following compatible strings
> 
> - qcom,apq8064-dsi-ctrl
> - qcom,msm8916-dsi-ctrl
> - qcom,msm8953-dsi-ctrl
> - qcom,msm8974-dsi-ctrl
> - qcom,msm8996-dsi-ctrl
> - qcom,msm8998-dsi-ctrl
> - qcom,sc7180-dsi-ctrl
> - qcom,sc7280-dsi-ctrl
> - qcom,sdm660-dsi-ctrl
> - qcom,sdm845-dsi-ctrl
> - qcom,sm8150-dsi-ctrl
> - qcom,sm8250-dsi-ctrl
> - qcom,sm8350-dsi-ctrl
> - qcom,sm8450-dsi-ctrl
> - qcom,sm8550-dsi-ctrl
> - qcom,qcm2290-dsi-ctrl
> 
> Deprecate qcom,dsi-ctrl-6g-qcm2290 in favour of the desired format while we
> do so.
> 
> Several MDSS yaml files exist which document the dsi sub-node.
> For each existing SoC MDSS yaml, provide the right dsi compat string.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 30 ++++++++++++++++---
>  .../bindings/display/msm/qcom,mdss.yaml       |  3 +-
>  .../display/msm/qcom,msm8998-mdss.yaml        |  8 +++--
>  .../display/msm/qcom,sc7180-mdss.yaml         |  6 ++--
>  .../display/msm/qcom,sc7280-mdss.yaml         |  6 ++--
>  .../display/msm/qcom,sdm845-mdss.yaml         |  8 +++--
>  .../display/msm/qcom,sm8150-mdss.yaml         |  8 +++--
>  .../display/msm/qcom,sm8250-mdss.yaml         |  8 +++--
>  .../display/msm/qcom,sm8350-mdss.yaml         |  6 ++--
>  .../display/msm/qcom,sm8450-mdss.yaml         |  4 ++-
>  10 files changed, 63 insertions(+), 24 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
