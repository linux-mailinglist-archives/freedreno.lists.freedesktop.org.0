Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3DFA319FC
	for <lists+freedreno@lfdr.de>; Wed, 12 Feb 2025 00:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA3310E1B6;
	Tue, 11 Feb 2025 23:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qQ05ZIgB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DB910E770
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 23:53:53 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-543e49a10f5so6460511e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 15:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739318031; x=1739922831; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mNB0MmfPRQPSLrWRY1SRq74tB0O/CjOAHmtycBZsfJA=;
 b=qQ05ZIgBGIjJNlWbORK/G3nvLp7NKlynzaHRkDF5UvXejXH5qMzbE87KXZCgs2Bk1C
 Ss3o54Y+2l3Beo90QgYZRZi/4uM7sls81GOoY/x11zjjNo1HYQzP3S9wQ+HbQZsDCjBz
 YyW7koN/gpo7RZ3/+ew/GwR9mNd1RiIyHarr8xGhbKE0C6YiQdkwANYUrUKYiQfoA6WR
 9x4+po+18AosgrXLTbls2A3DZiqmxuRNR1O+QS527Cpo8to20gpbltk+yMToszFPwX4B
 B2lB72gt7GnUoS1Hc/JVp0rMs+U6kU3vU3FhvDIw3tASiiljtmlVseJxFfGYHKXeF1J0
 amWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739318031; x=1739922831;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mNB0MmfPRQPSLrWRY1SRq74tB0O/CjOAHmtycBZsfJA=;
 b=N1nprvr7ScjS59ZbTfn4W0rlzvErBJszYvRR1WW/AE/Zs0dt0n0HJIc+o7vIE5m1IW
 c/Y0FEBdemTQYjVCSPrK+MGtaA8bpljscBt1C563zPhTC07+cWgjkgvprZVsJcnmrms7
 LeyclAsTOZda2We0pu/bGn2Wc8bxh7cmwNUCmWSPhrfZ07x7w884QQdzvQTtWrkGlaqY
 TpFyaOjCIhvUE52hIrIsRqbFiCmOnTqyWYLVJf6U6CF5z9AVPJoTMEjICVccQGEK6b7q
 qmVpIFNPuv4laF03WH6VmxKWnUL6+2uAIApOjmT27Ke4VDJcqZwxXTeaIkMyxm5gq7BS
 AosA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuWm0juNrYQ9rOdPohoTBmFfsUkKM7eb9SUa1y1XMHIPHBZStp7F1ayhpLL3XoaDBmQwuvvKZbvvg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynOMYHULCib3sAlB31DdF0beGyWVbVkF9JyTvXXu635/o+GgC+
 Whl/HCKI/Pyo099ejAkBuKvfsFvL1bZzJNB6aDew6wxV9bn2WnzQFJat0cbVBNE=
X-Gm-Gg: ASbGncv2Sbd6GNwQ2gD1F7kCqcgMZAXQzPyIF9uVHjWrOwGVX8x9n+Vy6Mv2Sv0BSSV
 M8iH5NP9bU2IVQqjx3HOLAKyIAyVHgmBBqAbBRb1Rak70+E4rxqF2R3Vy6G04YTXU0EX68MRw4p
 PlTNNsjihjWIjplHpmJy/0K6LoUrZu85wkR+8zqZzL14RZaBQiphv5T1yh3QFRY+VKLexjqyz3N
 7yTyhOc7oppqL1HdhpPITHmALd+8kRxaSWTYd2XGlx8xBx4RgECihTl0VuPIRq+3j48Aw08fSCS
 0wUUJ/K5WYXch9vKdB6AhFCyT1npltwTAhBWIjAsGx1cLSjzW0rHP3pl4eTDO/xJsW95JN0=
X-Google-Smtp-Source: AGHT+IGwbos3L4kCpFWC/3x4CQJNOXWn8dkB7g07DoRvEsQZTy9Yn8XdtO0fzsZPGB34qsvjoWUsPw==
X-Received: by 2002:a05:6512:39cf:b0:545:17d:f96b with SMTP id
 2adb3069b0e04-545180eb5f9mr237415e87.14.1739318031273; 
 Tue, 11 Feb 2025 15:53:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441060424asm1681677e87.254.2025.02.11.15.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 15:53:49 -0800 (PST)
Date: Wed, 12 Feb 2025 01:53:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Danila Tikhonov <danila@jiaxyga.com>, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
 konradybcio@kernel.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 sean@poorly.run, 
 marijn.suijten@somainline.org, jonathan@marek.ca, jun.nie@linaro.org,
 fekz115@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7325-nothing-spacewar: Enable
 panel and GPU
Message-ID: <no4yqmep3b6k2s4cnucbujso67iavv57d7vrlnq3qn4vfexfka@secyoh4eqjk4>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-5-danila@jiaxyga.com>
 <4a232b8e-f63e-4f89-aa4e-257165150549@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a232b8e-f63e-4f89-aa4e-257165150549@oss.qualcomm.com>
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

On Tue, Feb 11, 2025 at 02:31:14PM +0100, Konrad Dybcio wrote:
> On 3.02.2025 7:14 PM, Danila Tikhonov wrote:
> > From: Eugene Lepshy <fekz115@gmail.com>
> > 
> > Enable the Adreno GPU and configure the Visionox RM692E5 panel.
> > 
> > Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> > Co-developed-by: Danila Tikhonov <danila@jiaxyga.com>
> > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> > ---
> > Note:
> > Depends on https://lore.kernel.org/linux-arm-msm/20250122-dpu-111-topology-v2-1-505e95964af9@somainline.org/
> > ---
> >  .../boot/dts/qcom/sm7325-nothing-spacewar.dts | 53 ++++++++++++++++++-
> >  1 file changed, 51 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> > index a5cda478bd78..cda317b49d5c 100644
> > --- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
> > @@ -52,6 +52,8 @@ framebuffer0: framebuffer@e1000000 {
> >  			stride = <(1080 * 4)>;
> >  			format = "a8r8g8b8";
> >  
> > +			display = <&panel0>;
> 
> This is allowed by bindings but doesn't seem to do anything
> 
> > +
> >  			clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> >  				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> >  				 <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> > @@ -757,6 +759,10 @@ &gpi_dma1 {
> >  	status = "okay";
> >  };
> >  
> > +&gpu {
> > +	status = "okay";
> > +};
> > +
> >  &gpu_zap_shader {
> >  	firmware-name = "qcom/sm7325/nothing/spacewar/a660_zap.mbn";
> >  };
> > @@ -823,15 +829,44 @@ &ipa {
> >  	status = "okay";
> >  };
> >  
> > -/* MDSS remains disabled until the panel driver is present. */
> > +&mdss {
> > +	status = "okay";
> > +};
> > +
> >  &mdss_dsi {
> >  	vdda-supply = <&vdd_a_dsi_0_1p2>;
> > +	status = "okay";
> >  
> > -	/* Visionox RM692E5 panel */
> > +	panel0: panel@0 {
> 
> Is there going to be a panel1, too? ;)
> 
> Please drop the 0

No, dsi-controller.yaml requires panel@[0-3] and a reg entry.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry
