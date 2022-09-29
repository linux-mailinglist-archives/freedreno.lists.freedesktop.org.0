Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B21765EFE6E
	for <lists+freedreno@lfdr.de>; Thu, 29 Sep 2022 22:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700A110ECB8;
	Thu, 29 Sep 2022 20:09:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228B010ECB0;
 Thu, 29 Sep 2022 20:09:12 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 r136-20020a4a378e000000b004755953bc6cso857171oor.13; 
 Thu, 29 Sep 2022 13:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=GZZiagUs3HUfpeMwbywCyzsEBVOVMqD641TL2LDqp7c=;
 b=CT/sa/Y5gxbeGAmdRatCeLbRw/rRyBk74A/qMVvPBdteAj/COqLwZSHVQNC+H5CAEW
 9F4bx7v95tq9IG1clJnZBuJC3elCnqFcD1dJxvUR/SynW8qbO9Hm/Z9YdOVxaYZD9Es6
 5kWnVBkODuhU6k3eVb8+S/9MDlhcRVL/5XvHDXk97HEJJvKcmpzaaQSUApolgZLcw0UB
 jnEBuGyvNrWD81Xr1HwbteXEYZj6PuTXtwsdyS0nKz6WhUqkZi69uNs+iQEUsKrPT2oh
 p7+Wm8oVPCBkYhh18YVZMHti6kuTf0vqh/21f4OnP2GO2uQfPwogtshXXdrlrgTCrdHH
 DY4A==
X-Gm-Message-State: ACrzQf2smor30a91oB6Bsw6PSieoZF93miQX+sY/eomBKsiFGBkbgOh2
 pz4Auist5X2EhfrKIqnXBu4oT5VSwQ==
X-Google-Smtp-Source: AMsMyM5cV8SitoPg7y58nU1devSHpI02JFb0pExeyBbLcIVHfK4FQ7OAAFPslz4V6wx4F4ys7pwgPw==
X-Received: by 2002:a4a:645:0:b0:475:e496:78f9 with SMTP id
 66-20020a4a0645000000b00475e49678f9mr2055524ooj.13.1664482151091; 
 Thu, 29 Sep 2022 13:09:11 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0568301e1100b00659ba9f2872sm138276otr.77.2022.09.29.13.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 13:09:10 -0700 (PDT)
Received: (nullmailer pid 2658309 invoked by uid 1000);
 Thu, 29 Sep 2022 20:09:09 -0000
Date: Thu, 29 Sep 2022 15:09:09 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <166448214908.2658264.16651014631872750746.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-13-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-13-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v8 12/12] dt-bindings: display/msm: add
 support for the display on SM8250
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 15:36:11 +0300, Dmitry Baryshkov wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM8250 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/mdss-common.yaml     |   4 +-
>  .../bindings/display/msm/qcom,sm8250-dpu.yaml |  92 +++++
>  .../display/msm/qcom,sm8250-mdss.yaml         | 330 ++++++++++++++++++
>  3 files changed, 424 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
