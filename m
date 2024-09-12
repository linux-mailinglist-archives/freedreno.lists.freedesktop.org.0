Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BE39763A4
	for <lists+freedreno@lfdr.de>; Thu, 12 Sep 2024 09:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E82D10E88C;
	Thu, 12 Sep 2024 07:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vIGrQv7u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA8910E88C
 for <freedreno@lists.freedesktop.org>; Thu, 12 Sep 2024 07:56:45 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f75c0b78fbso7880851fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 12 Sep 2024 00:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726127804; x=1726732604; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rzUy16PQ8SDXmHcug8jXm/7h574vKZnBpTKJTICvI5k=;
 b=vIGrQv7uxOeU9fUw4jiKGb7HMmeY2GV4NKz1phviMLR3zkGiAXv3lJp9G0gvD19xkc
 UJALbvLpo7uPtvjf1+aUjWfG6qiztNJFYXi71+VHjbcBzLMWTRePa4n6voWUOS4hWxES
 Voj7R9EzGvzVbZWYtN/+mtNFIj7hPnpYX6F1wgUlPv6/tt1p1Jxf5ngdg/iwEoE/f2Vl
 QFx4WTi8+l37KzUfunTsCALjCfXuadkmusIre0gy+LfYiPagdS5D1lld8uWqY/jeXF/w
 s9ngkYsPvRGM2WyIR1+s8EJ362O0H/xD8xrhN1Myb26k/4HhZS6zwrKoige/+1gyzOZe
 b9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726127804; x=1726732604;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzUy16PQ8SDXmHcug8jXm/7h574vKZnBpTKJTICvI5k=;
 b=FojnSKfiud37xXE0wFVGkG/K+Qc3IFNrGEQ2Tnh3QaeAruF1E1hkmt4Y+4u2pQ2kjR
 FvZUr/p3EbhGjTyDANM1VDjiSJbBPKHiECUFT7rvOaVEEkOs2Izcua6sBLIDbPi6CdRP
 X41+P4iZNI1nOPfIqyiMNdVH/0XNItlVxllphzcgdvOvueCoqyGyY2qW8i3oB9HsMZnq
 B3u/YhLx9uz2hkVnuSJ3kKniaReHlzKf5LmGiHFlXqDfwBIH4XISBLOH7MubtpSr9vUv
 kzMMfwf22kUrORrQ8BintijtOHLey0CUys7Df1dglNzvPe6xLCU8DpSVs3fIeXVkajEI
 2q1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdhUzd7n8EqLGLzJH+cYH4PqXoTdEEenzjcEF0C8qBEHxX4VyglSrDwq4zQJqJH5Nd3Heh2E+Fqwo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzh+Wdb7DQv4Br3zEgK0jhzno0waoeaL8F1dXZBsHt9UZlRwYMg
 fr597gHv2reGXrIhXdqpgkMWShH8p89WP890Oxr8+A/OTZ/l4anGzMdwQV2xfBA=
X-Google-Smtp-Source: AGHT+IEO+oaR2J+/C5HWt9j3Jqj2WBAglLEJ+Odvyq26KObdZCTNoi/+ljmrdSm1pK1NNmf0NzUFaQ==
X-Received: by 2002:a2e:be91:0:b0:2ef:2016:262e with SMTP id
 38308e7fff4ca-2f787ca97e6mr12162111fa.0.1726127803444; 
 Thu, 12 Sep 2024 00:56:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75c07c897sm18188401fa.75.2024.09.12.00.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 00:56:43 -0700 (PDT)
Date: Thu, 12 Sep 2024 10:56:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH 0/5] Add display support for Qualcomm SA8775P platform
Message-ID: <7fcbvouzb7gq6lclrkgs6pxondvj5wvutyw3swg55ugvzfpvd4@2ph7x7ulxoyv>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912071437.1708969-1-quic_mahap@quicinc.com>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Sep 12, 2024 at 12:44:32PM GMT, Mahadevan wrote:
> Add support for mdss and dpu driver on Qualcomm SA8775P platform.
> 
> ---
> This series depends on following series:
> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/

As such, it probably can not be merged before 6.14 (the mentioned series
will go on 6.13, we usually don't do cross-tree merges into drm). Please
rework the bindings to drop the dependency (it is possible, use fake
nodes instead of using dispcc + ID). Then you can specify that only the
DTS patch depends on the dispcc support, allowing driver changes to go
in first.

> ---
> 
> Mahadevan (5):
>   dt-bindings: display/msm: Document MDSS on SA8775P
>   dt-bindings: display/msm: Document the DPU for SA8775P
>   drm/msm: mdss: Add SA8775P support
>   drm/msm/dpu: Add SA8775P support
>   arm64: dts: qcom: sa8775p: add display dt nodes
> 
>  .../display/msm/qcom,sa8775p-dpu.yaml         | 120 +++++
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 225 ++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  85 +++
>  .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
>  drivers/gpu/drm/msm/msm_mdss.c                |  10 +
>  8 files changed, 931 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
