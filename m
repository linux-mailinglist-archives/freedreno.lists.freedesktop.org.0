Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6FC742A5E
	for <lists+freedreno@lfdr.de>; Thu, 29 Jun 2023 18:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D63E10E3E6;
	Thu, 29 Jun 2023 16:12:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209F810E3E3;
 Thu, 29 Jun 2023 16:12:35 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-77acb944bdfso36806739f.0; 
 Thu, 29 Jun 2023 09:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688055155; x=1690647155;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3cbrEba2zKCc7+NLRK37Om5CmAjDmmF+NMGLR2TXNw=;
 b=JizXJAD0wLKpBo3uXfPZWDOeznfJzYQcTqqCfZCd56p+SrdRsNf4cjK68C8hoKfuMv
 b0bV/8pu/KzYFXYcGDl+pLNHs6cBrc39VPsyM2t6V190kn/Zxlx4yhV2Xy9Z3g1OxXjO
 GzIwire+kA6fuN+kWMQOOW7SshzVCg3Xh9WE/IwPAekyW/HCEzZjiv02nA6o//VfjmEF
 nsewAQrfI/cy52WpZyhFfqvKIJPJXYzEeKMLgHiTOqjsz0pN+ExRJm/FX4rgG4FPu+yP
 7IOOp1llwgq4/+tfE/8od9ObAecEAiZtu8JZ6iYVM4BWffZR5LlS6MaduwVn/ds5g1Ff
 CRmA==
X-Gm-Message-State: AC+VfDwxq37kd8TNyTCXv/kuevmoGWOK1luwM75+3VzRdAh/PppOZAys
 wSyeG0sTTnEsgdpHWgVvmQ==
X-Google-Smtp-Source: ACHHUZ705vS8Dn9vGnSlG3J2dxDiTeOe9Cq3FIEpSpo5xeOKdlFlvpHugksZ11fmTkDJxH+5o0uW8Q==
X-Received: by 2002:a5e:a51a:0:b0:783:62af:fbdf with SMTP id
 26-20020a5ea51a000000b0078362affbdfmr11390301iog.14.1688055155018; 
 Thu, 29 Jun 2023 09:12:35 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a5d89d5000000b00784315b7f86sm1856336iot.24.2023.06.29.09.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 09:12:34 -0700 (PDT)
Received: (nullmailer pid 3128049 invoked by uid 1000);
 Thu, 29 Jun 2023 16:12:31 -0000
Date: Thu, 29 Jun 2023 10:12:31 -0600
From: Rob Herring <robh@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <168805515067.3127989.380988000500770065.robh@kernel.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-6-03e430a2078c@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627-sm6125-dpu-v2-6-03e430a2078c@somainline.org>
Subject: Re: [Freedreno] [PATCH v2 06/15] dt-bindings: display/msm:
 sc7180-dpu: Describe SM6125
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 27 Jun 2023 22:14:21 +0200, Marijn Suijten wrote:
> SM6125 is identical to SM6375 except that while downstream also defines
> a throttle clock, its presence results in timeouts whereas SM6375
> requires it to not observe any timeouts.  This is represented by
> reducing the clock array length to 6 so that it cannot be passed.  Note
> that any SoC other than SM6375 (currently SC7180 and SM6350) are
> unconstrained and could either pass or leave out this "throttle" clock.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml   | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

