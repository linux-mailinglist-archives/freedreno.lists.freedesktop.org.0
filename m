Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2035788FB
	for <lists+freedreno@lfdr.de>; Mon, 18 Jul 2022 19:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD4D895B9;
	Mon, 18 Jul 2022 17:57:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F391010FA79;
 Mon, 18 Jul 2022 17:57:00 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id c17so5417318ilq.5;
 Mon, 18 Jul 2022 10:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KadwfvKsdB6hFJzC3V746o2nQAVvLcHZ3Qu965v46xc=;
 b=4Fan1c6nnjZxbgDXjrxf1ELhQH7B1ANSRvv0VxNpdAxjq85N1kFKaZZvoTPFC19dxF
 /mkZ+G2hlZH+NDuqS6b7DQQE0MwOSRKUj53zO8oMqy1QTzWnBFg+DA/NKQvPLDn8UQwC
 iv91LEAChFOXvxo9YaW4zrxKTsrTtbCapkXyZTMospWc/Arrtcu0y/MEvNswFa6Jc8mR
 2bFG1t/gutO1QNAcHnzOS5Vb26RzhUUpyyJk5qriZq71iaDjINoxZmjIF6U2BbEX7ucl
 m6foXsi5Nu9KOfqc9u5PmG906wIk1niy0sm+EKziOehpOcvlyOHR9t8B718++7XGV0wG
 RILA==
X-Gm-Message-State: AJIora875E4Vu7F3wmzxHF2U5bQ3O4VdzvOepYiCCmEWvA0A/AsD1nYh
 /5kJzZgj92Zo6RcsTGbY9g==
X-Google-Smtp-Source: AGRyM1tGJNgLKOPiRqIltb6HhK6tAFREhGMK29FLZF8aSdU4gCDfuv2MMNQ6cx+conSm8HF0qIvd9w==
X-Received: by 2002:a05:6e02:1645:b0:2da:e6be:3dfc with SMTP id
 v5-20020a056e02164500b002dae6be3dfcmr14893733ilu.116.1658167020199; 
 Mon, 18 Jul 2022 10:57:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 p187-20020a0229c4000000b0034161ed8fadsm2811944jap.150.2022.07.18.10.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:56:59 -0700 (PDT)
Received: (nullmailer pid 3249739 invoked by uid 1000);
 Mon, 18 Jul 2022 17:56:58 -0000
Date: Mon, 18 Jul 2022 11:56:58 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20220718175658.GA3249683-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-8-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 07/11] dt-bindings: display/msm: move
 qcom, sc7280-mdss schema to mdss.yaml
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
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 12:00:36 +0300, Dmitry Baryshkov wrote:
> Move schema for qcom,sc7280-mdss from dpu-sc7280.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc7280.yaml      | 148 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml |  19 +++
>  2 files changed, 57 insertions(+), 110 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
