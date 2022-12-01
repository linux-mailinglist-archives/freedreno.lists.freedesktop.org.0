Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6623463F878
	for <lists+freedreno@lfdr.de>; Thu,  1 Dec 2022 20:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2781C10E155;
	Thu,  1 Dec 2022 19:40:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CDF10E155;
 Thu,  1 Dec 2022 19:40:28 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id v82so3141245oib.4;
 Thu, 01 Dec 2022 11:40:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=boNQPL0i0ILb4HhKeMVQSoaXUT08m5V8+ybujR0N0TI=;
 b=Lx7DjTx0/wv6X4vrMwy5xegaG1JkUqiFiX4cZMPeZ7p01DkDvRn6Y6BRFqiRjQK/rf
 vxIOq08ib4FE/sWtbSGWAQHRWJGnSAcWLxb+K+0awRAU3xpGQkbYL7YbWwV0Akhfntcm
 7OJwnkX4omSsQG20ZNZoDAszgLJdzJRGnv1JwNDCgcHeErGcB84PXn5M3bW3EmTWsQNd
 LOTkmOkDBHPoQ8kTfTxjCviCRf8Imp6NPFf5x4aHhJkrAA4ON5fGv82cbh3pSzFIQI4l
 oBr+FWLydvLSB7bZxqF4638MKaf2HkVh8/WPYsyC0815tEnWqM1+ysfhCcCqY+u54SzS
 Hpow==
X-Gm-Message-State: ANoB5plQmCFcFMCbz3rskCcxWWxOMH0WWX/wzdsvIanKDxlPDkwDhUEn
 6WZy/68pcRXKa+Y21KlM4w==
X-Google-Smtp-Source: AA0mqf7EHzfleKI7CO0oX8lnmi1IYx3XscnTMOaiB0J2r2agG3qDO8nklTcidrANIVj1NAux24DAbA==
X-Received: by 2002:a05:6808:152c:b0:354:da02:c05f with SMTP id
 u44-20020a056808152c00b00354da02c05fmr22940884oiw.290.1669923627983; 
 Thu, 01 Dec 2022 11:40:27 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o6-20020acad706000000b003549db40f38sm2128071oig.46.2022.12.01.11.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 11:40:27 -0800 (PST)
Received: (nullmailer pid 1216496 invoked by uid 1000);
 Thu, 01 Dec 2022 19:40:26 -0000
Date: Thu, 1 Dec 2022 13:40:26 -0600
From: Rob Herring <robh@kernel.org>
To: Adam Skladowski <a39.skl@gmail.com>
Message-ID: <166992359520.1215696.1988935137698769756.robh@kernel.org>
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-3-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130200950.144618-3-a39.skl@gmail.com>
Subject: Re: [Freedreno] [PATCH v2 02/12] dt-bindings: thermal: tsens: Add
 SM6115 compatible
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Thara Gopinath <thara.gopinath@gmail.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 21:09:40 +0100, Adam Skladowski wrote:
> Document compatible for tsens on Qualcomm SM6115 platform
> according to downstream dts it ship v2.4 of IP
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Since Daniel is out, applied, thanks!
