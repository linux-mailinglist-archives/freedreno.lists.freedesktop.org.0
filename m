Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768397637E
	for <lists+freedreno@lfdr.de>; Thu, 12 Sep 2024 09:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5C510E78F;
	Thu, 12 Sep 2024 07:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bpzG8Djz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E8910E78F
 for <freedreno@lists.freedesktop.org>; Thu, 12 Sep 2024 07:53:06 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f761461150so9597211fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 12 Sep 2024 00:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726127584; x=1726732384; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=plV9zVWaER2nVL76z2wZIDE0Ej/fFWbWekwnS0bRoPg=;
 b=bpzG8Djzlq2ZrF9ihhAI7EdlgWa27GL0+/Kn7pXGk5QK+lVz5Mc3mB9lbjxmiWrak6
 /nrjC4mBTSgLoMyRnokz7FMy9P41E5fkrRE5zv/Ij6UcPOrZWnSTy1MWBVfrxTRH8V7h
 n4FmMJXa8V3U8OW8YwCUn7ktDHHk6wRKuTNnay78jGSzhEkS2a4Im6u0FbbsXoYincDY
 XCaqWqWkJQgCbaSPRR7ueJEPuVZ/i6/WGDlUCFyxCkOetptK/bfmT/Yy5uclzeea8eiw
 H9BAqd1lZ4Vz9go2Q5UKS1LCDxJ8/gllp5EMmH32qGY/lyn2pdrmXxGkdeOlB3yrPpi7
 Z0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726127584; x=1726732384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=plV9zVWaER2nVL76z2wZIDE0Ej/fFWbWekwnS0bRoPg=;
 b=ml2ra3NfwebYMofJiPar/MRBBk+0S4YZM3ke/oBscmBZHn7mww7Fh5KGoTxVz2vcKy
 c8vN5SZF9e8SkWlGHMqwMI9TwUGbfnwTCDjjrKtia3/IvSTEDLR0NibVarHxM3xKnlM7
 fOYfZKKDqjm35ajf2kIYhFtpf40YfC2gg4dt5Aqhv6PT8Ufel4mA3C0U+CpGGm422KlB
 CQGeAKYdtiUCcVgIDVsHV7zP2J7Vi5eNmg4/59g1ChqGQzkmV8ga6M0ZdjjxsymBIAZj
 VV6ECoyvPGqiMRbIS65npwT1y7+GZvxrvD0KjKGJqv29J2DxkBQSCfbE0bYEfxVKr1e7
 wtwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmwTvf5Zj9eSTRtvEhOpf9XvKybxmQJCKiyvVdYhJd6eS70elCee3beVbn/8srBuqSZfrC4R77X98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfFg/vBmDw8iV3YZJ+IVCxLDxQa7w72eMMxr8ob4BvRb+hMy23
 31u9RW0VSjdt8YgA+nVbf0RRPlp2Ruev56afBD1f34FrCwXk2RfCbu63RSyGkc8=
X-Google-Smtp-Source: AGHT+IGNAjjrqwXcc00olSCpw8KkiqSQhqCV9M6o89EyqQyNZCGyom+XQTk0RI8UmFhrk56pycAn7Q==
X-Received: by 2002:a2e:a7c1:0:b0:2f6:4a89:9afa with SMTP id
 38308e7fff4ca-2f78e18c52bmr1151811fa.22.1726127584296; 
 Thu, 12 Sep 2024 00:53:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75bffe937sm18013361fa.55.2024.09.12.00.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 00:53:03 -0700 (PDT)
Date: Thu, 12 Sep 2024 10:53:02 +0300
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
Message-ID: <3cpxwtqxapxhvg3w323xr7drv7p5sozrlwgoqscz4dqyuqft5x@x3pqxdjbpca6>
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

You can not support a driver. Also, MDSS, DPU.

> 
> ---
> This series depends on following series:
> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
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
