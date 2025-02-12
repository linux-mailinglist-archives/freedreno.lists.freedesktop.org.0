Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282F7A31A19
	for <lists+freedreno@lfdr.de>; Wed, 12 Feb 2025 01:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0320810E1B6;
	Wed, 12 Feb 2025 00:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Co0H3+37";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA86D10E1B6
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 00:01:13 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-307c13298eeso3107151fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 11 Feb 2025 16:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739318472; x=1739923272; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=95tLd2a65K3uyAvTy76sH7lTP+WAFAT2AWBj4Cp36Os=;
 b=Co0H3+37LLLV1TZqcugIaGCcr0kNMVPUzjxcHFEn5unna2iKJBLmtSHtoz8LWnxc9S
 BB+3r3ZviT9CcXqCuJMWLwXV3vnDahGh2oEX6PLxIY4/l6EC5ocWFqpXSzFu3qVoG397
 u5X+qLVsBTp/FoqVu3pUSq37JxVUm6/FWRiOp8LHh/z4n1NeG4EDweG6vRg+7AcbDKiF
 naGAUG9Sr3dt/zG/NMrS/WRFlXeH8zGE+oJtc+vJxLUa0jDHMMMCoAkhh6YjIlnADciK
 xZuBjCD7hKVdcSG8/pGm/52aP1EQWppOqPPMrpsWi7bw9JiU9eyW+0SMKsdfaIrXsAtN
 zgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739318472; x=1739923272;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=95tLd2a65K3uyAvTy76sH7lTP+WAFAT2AWBj4Cp36Os=;
 b=Fs/4Cpf02ChNK3DqMR8usdq/LjO8qJzqC6Jb3nakyeaOqvG3yxM3Q9F1pWqCCBIAaG
 du/RHlOSM88Got6R7LxKIIzN71u2YlTBZ6cdJlolN+j2eApaYTF4c49hqAC4PNBt0K3q
 Zk0n0qrUP0EDSzl0t7zvDOzK6QsYS2Jpc7V02WhnPEIqWzsouF1sqzbdXf0alZr69ZZv
 C9ZVLBh8bnhQr2vE1GHzMNCupVsSfDS/LQ0jWojWbsKN8qlMjeDuwpmyB+16hhkgSRnR
 AN9dWT21zDjvN2gDN03Z4hfFI+Ds2kY97aQcJaI2wAgS9YlHsOgjilx5ghi6eT7gpwE3
 6NCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCspBqVwE1FTAmbR9031iGW5MyuBIMuhJ7L7xv2Zbn7Ro9KI/htKj+bbx2Qvd3qIit2hhV2L11H4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCCIVnNG8lB5YXNZEngFWS9HsDCBxSoo5Jdz0X4R94ay1Fe4LK
 1qwDTxuzx9kQ9C70Vlu44sc/mQ5VwkKXewJDbL9nUUT7LZIv+BHezapPacBFGA0=
X-Gm-Gg: ASbGncs5vctBsDh0ozGSPkjCDphEltsKjk9qiEGUjzGcI7LMB0gHR7G3NKTcjt6h5tI
 ZTjH+SbGyhVVS3/3kZSYnDZ3kHksDz3dkQDc9rTsL9qhJByRxSSbNVGTaCfrHvU9oCrliTtb+g0
 X6+UMrcsabvVebXiMdouBya1vjutr2RaN45iR0rku/psbCxcXKNRyYjmV5rn72U5tKyFJYNVnQQ
 sp1ot7FfDE9JASgb2VcCjK+3LZc18QwULOrI0GNkR7HocliOnTVNYLfxGuApWh1AuDaPSm20dyL
 pa8uCrraYk/vx9/ABoJFHoKZOr05sLuttuOCg8w62WR5tUNx6FYDamlB2qqgmfY5iroJc08=
X-Google-Smtp-Source: AGHT+IH/ZusE/nmTKQwFY64ppd0MMt5jL1ccy9acwns9FM9u2M/3kJwIx3fnSmtuKJScor3EBvhJ1g==
X-Received: by 2002:a2e:965a:0:b0:308:eb31:df9c with SMTP id
 38308e7fff4ca-308f90eb27fmr16259151fa.1.1739318472098; 
 Tue, 11 Feb 2025 16:01:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-308ed7e8621sm8024891fa.87.2025.02.11.16.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 16:01:10 -0800 (PST)
Date: Wed, 12 Feb 2025 02:01:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
Message-ID: <ysk2lewb6qjhmrznt7xc7i3u7kczqliph2dzfg566aoj5cowks@qlbyk6nqakp4>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
 <a3f7bef6-bfc8-4a2e-b979-4aac7908306f@oss.qualcomm.com>
 <fcde9fab-b28a-4e09-b77b-f7c6c3840710@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcde9fab-b28a-4e09-b77b-f7c6c3840710@linaro.org>
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

On Tue, Feb 11, 2025 at 10:07:07AM +0100, Neil Armstrong wrote:
> On 10/02/2025 17:32, Konrad Dybcio wrote:
> > On 10.02.2025 10:32 AM, Neil Armstrong wrote:
> > > The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> > > add the missing cpu-cfg path to fix the dtbs check error.
> > > 
> > > Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
> > >   1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > @@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
> > >   			power-domains = <&dispcc MDSS_GDSC>;
> > > -			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
> > > -			interconnect-names = "mdp0-mem";
> > > +			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
> > 
> > QCOM_ICC_TAG_ALWAYS
> > 
> > > +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
> > 
> > QCOM_ICC_TAG_ACTIVE_ONLY
> > 
> > w that
> 
> So it depends how it articulates with https://lore.kernel.org/all/20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org/
> 
> I can rebase on top of it, it would be simpler, but then the Fixes tag won't work anymore.

It works, it's just that the backporter would need to be slightly more
careful.

> 
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry
