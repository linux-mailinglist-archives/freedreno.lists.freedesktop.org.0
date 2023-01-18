Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D2F67219E
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 16:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A77910E775;
	Wed, 18 Jan 2023 15:43:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E5410E15B;
 Wed, 18 Jan 2023 15:43:49 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-15eec491b40so14934410fac.12; 
 Wed, 18 Jan 2023 07:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ukaT+V3Vb1FjUPkT6hZm3l611ylAlOtjFyDVedo3F+c=;
 b=P6DzjkzmmYKzZ8uYqa1r6EoeU5qfwRfIyB3GsUT07fGrouHkXNr6H0D+RJu5zc0fY8
 78RAHkYwhe7qvvQH3aKp2JZQatgq0ZjhpYj4M/uUdA/0dehAMKgKBUTurPEDuLdC2vWE
 JVCZde72Qkz0mw0PvceYHEUsfp28T5BJoVQoLwhk6zxemzCNPSXqTqckPzHpUsigyLYO
 zx+mqGqXhR1RsHcnITlz3njwBblHM+Bx185hdhojrdrfo/St2xDUebiOw+t7wlwmv9/A
 6l9mNHZYZMIXPEYRWwk+VQ2+LD31YKd+mjTYVT0ELM3xB1iuvdbGSzylmx/tQlu7UOBd
 kJDg==
X-Gm-Message-State: AFqh2kpCNmxz8i10BIwsU9EQ0KeEOM5vTEh1avFinHhN4Yoa59T1yUC+
 IkaVFxwScYn1bbMoCrXk2g==
X-Google-Smtp-Source: AMrXdXslFOXnulpQe6RkBP46QyXxTX6HLS26sNC2/1L4zrMl2+ezht2EDmducLgMXaHjrnnLaD3ijg==
X-Received: by 2002:a05:6871:1c9:b0:15b:96af:50ac with SMTP id
 q9-20020a05687101c900b0015b96af50acmr3913424oad.29.1674056628728; 
 Wed, 18 Jan 2023 07:43:48 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05687032ca00b0014ff15936casm18355779oac.40.2023.01.18.07.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 07:43:48 -0800 (PST)
Received: (nullmailer pid 54719 invoked by uid 1000);
 Wed, 18 Jan 2023 15:43:47 -0000
Date: Wed, 18 Jan 2023 09:43:47 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <167405662664.54658.957028337731224500.robh@kernel.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
 <20230118041243.1720520-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118041243.1720520-5-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v7 04/11] dt-bindings: display/msm: rename
 mdss nodes to display-subsystem
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 18 Jan 2023 06:12:36 +0200, Dmitry Baryshkov wrote:
> Follow the 'generic names' rule and rename mdss nodes to
> display-subsystem.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> Note, this patch might generate warnings in qcom,sm6115-mdss and
> qcom,qcm2290-mdss examples, but they have been fixed by the commit
> e5266ca38294 ("dt-bindings: display: msm: Rename mdss node name in
> example")
> 
> See https://gitlab.freedesktop.org/drm/msm/-/commit/e5266ca38294
> 
> 
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
