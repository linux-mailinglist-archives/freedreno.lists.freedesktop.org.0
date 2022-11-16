Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF18D62C1AB
	for <lists+freedreno@lfdr.de>; Wed, 16 Nov 2022 15:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884FC10E06D;
	Wed, 16 Nov 2022 14:59:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AD610E06D;
 Wed, 16 Nov 2022 14:59:12 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 t19-20020a9d7753000000b0066d77a3d474so6689321otl.10; 
 Wed, 16 Nov 2022 06:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GG2Tq6+Rxp6EDqdTHOj4cP+DRbjq8GgFfl9nEQ/66eA=;
 b=JiG8yD+K377AXdV6/YM2BNeeGmA6ZqSAc5XWqBFSrp1kQcCP3JqIfBDBr0ME9nMLoz
 Zr8pvNJzr3onFwImg2xj2+kBd5mDCxDXIX/0ABE63SGDDRsq1uGG2L6L3N7hxGnMxOP9
 dwU9JLZFh5T+3Id84QfxtWYnFzo1sQ0yUx1e+JuahwHFx0Tg03HJKJ90UXYqeJzyGZMz
 ikBUx7WcJd9zXmwOjJWSCsSDk1UI9t/0JMd2exbjNtSRLZ/wkb1VPZd8V/AKPxgYDZY/
 blEJGAhSegN0iN7TwBvGUUwUDHAadmVodwnOO3YGlRDBR/dLtf6/s65vv0FbA5Jms4AP
 Elww==
X-Gm-Message-State: ANoB5pmfl+ctb5pDb3iBVIMaHoQ80xo+/Oa4z7cxhQayVl1+IQYTsld+
 4CmMX9p2DvJ8OyCSUsSO8w==
X-Google-Smtp-Source: AA0mqf48FvjuD+IAwK/1wfbeBhUiVH98RSb0f3PIpqZwv0iDrLwWktAN4jSPD17kbnAnznZU+hLEoA==
X-Received: by 2002:a05:6830:1d90:b0:663:bd3a:2e4b with SMTP id
 y16-20020a0568301d9000b00663bd3a2e4bmr11237196oti.157.1668610751657; 
 Wed, 16 Nov 2022 06:59:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j21-20020a544815000000b0035aa617156bsm6135435oij.17.2022.11.16.06.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 06:59:11 -0800 (PST)
Received: (nullmailer pid 3849197 invoked by uid 1000);
 Wed, 16 Nov 2022 14:59:12 -0000
Date: Wed, 16 Nov 2022 08:59:12 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
Message-ID: <166861075192.3849132.17933292251888324677.robh@kernel.org>
References: <20221115133105.980877-1-robert.foss@linaro.org>
 <20221115133105.980877-2-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115133105.980877-2-robert.foss@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 01/12] dt-bindings: display: msm: Add
 qcom, sm8350-dpu binding
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 quic_vpolimer@quicinc.com, vinod.koul@linaro.org,
 Jonathan Marek <jonathan@marek.ca>, vkoul@kernel.org, quic_khsieh@quicinc.com,
 agross@kernel.org, quic_jesszhan@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 robh+dt@kernel.org, bjorn.andersson@linaro.org, sean@poorly.run,
 quic_kalyant@quicinc.com, loic.poulain@linaro.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 15 Nov 2022 14:30:54 +0100, Robert Foss wrote:
> Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema for DPU device
> tree bindings
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8350-dpu.yaml | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
