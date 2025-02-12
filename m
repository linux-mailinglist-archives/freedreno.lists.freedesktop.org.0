Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FF0A3240A
	for <lists+freedreno@lfdr.de>; Wed, 12 Feb 2025 11:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9509410E852;
	Wed, 12 Feb 2025 10:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rEsFI2Xo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E68A10E853
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 10:56:55 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30615661f98so70842811fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 02:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739357813; x=1739962613; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2Sh3RbFHEBFXy8Gx0UkHY8V+uObJHLtwHJzqWdL8vuU=;
 b=rEsFI2Xoghx8MRu9gbqMGnxnjaY5Km9ihmaCHAs2QduY+OjYy8Exdu1VYai4vg2XS/
 WUdPt4Vzw9MFwx0/Rp3BH46cdFZPTyhpWlvp1Q9G1+m6kwgo+VoF+2zLUU7rAgr3QTi0
 NL0Mq+89poRD5qul5eAJqkZhMfXZ9bDJUODycgyHskjGxVnHCmJOfE+HoRZwyM3vky86
 mSf/cJgx+NU6luRq72xwBS7mDfqwvFztBL/KHOA4jnJm46JswmjqvOUVSQpmOr6C47QB
 ojof2VPxkmgxVcsSIFvH4U1xtzGPkX1HccZzdXljJJzkPQtwZl0vRf9B20Ga6pyWCWsq
 kaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739357813; x=1739962613;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Sh3RbFHEBFXy8Gx0UkHY8V+uObJHLtwHJzqWdL8vuU=;
 b=exXLcCabh7AhYCttfZQuRZrsEcFoS+5821gR3QT8ga/hxiMrXL9KyJ4WuIYuVFkNVM
 Nk3eQg1bQBH1UvUNCRpUdldL7XbtAIRx9RCpTj9sYHLWCdpJ5Rw5xBCDT3nbnNvh/Mr8
 Z1KeRhiOuM4RdzrOBfPeuREGVJGlLAN4h65OBswsQTdql7gTICoUgdXcN0hqbLGMFgZq
 BoL8HLicSZXm0jdMdgAcg8/Trr7KpOnCvKjHT3tZ8R6B7I0ekR+J4lfOlJVQ338vZfe+
 jKr9hr8I6izmSUVLIVH0ZOlgHhP0V41uMzyXRkZpfrvAITcTZzSQtoD3MFenGop3x4An
 iYIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDrew1NLNEgq2lk5i7VrllHpduNwugy5hnE87ugyCSMhU8FiexWZXYxC+rVY1DorvGPWyx9b7m7Ww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZewGzOKpCFrYyG4G5+TFfslKROW9bv9wWZLVyu5IzSwWmGH7n
 3pgThnkl1WLnDZnxgP4JU9pGgSoDXEPfqEv3GmzX3+vb8rdbNcoT/ha1hKzR2hs=
X-Gm-Gg: ASbGnctiKhddJG8ppovLdLzM66JRloM+rlkMADfQEyJ4Zrh1MzXqxRgt1rKucTDsfFn
 P4kw4NNuCgUMcXckLWqAiLTmGssimuipNR1rovV1enCuLFmn9DCTK7MYQa6xHHk48kA9q0GGsLP
 4yJiHX2pyGggM4S2p+46MPUY0zncHDHi6Q57xKv3mh6kMpJwaQfX3h14WFmKA/SOqFCYMLFLd9O
 yBxbuAy196gZMaflIHTp9wMPSrj864t8nTUmhluOS3MkQ7ymbqHX33tyJnynIL/BgcAAhNsvJxu
 Z9nG8eOrmbHl2tQb+28b64N2LmxW61ozTOj3w6k/7scf7FNK0vMpW/SHO9RkpiFSmrPmfkE=
X-Google-Smtp-Source: AGHT+IHZQXx3v7w680Qx+ZSGx5WSzNY1jlx0QqT9maGbSAp/UsmN348CsHz3deqPCtQuvMdlKI3eAQ==
X-Received: by 2002:a05:6512:4026:b0:545:6a2:e56 with SMTP id
 2adb3069b0e04-5451818b3bbmr785437e87.37.1739357813106; 
 Wed, 12 Feb 2025 02:56:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450e83820asm788032e87.100.2025.02.12.02.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 02:56:51 -0800 (PST)
Date: Wed, 12 Feb 2025 12:56:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
Message-ID: <fixmfluomzrdnoyztkd57gjpoqzutlv3m4es5jc7fclhpbauby@7u3ddi6dz4f7>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
 <4cfd1ebc-1a95-43d4-b36a-8b183c6dfd16@quicinc.com>
 <ah6nusoouth7ziu3iscxmafm6cxuwwebxt44ixsjmesp5adwc4@e5lnbztds2xd>
 <271e7b4f-454c-426e-a3f6-dcb55389374e@quicinc.com>
 <iymxe2hmjobctdimupp656xeyhctwd4yswbp2wobaneuzgxedu@cyhjb5ibkqmj>
 <c80ef960-7dc6-42bf-89a1-79e43be2bce0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c80ef960-7dc6-42bf-89a1-79e43be2bce0@quicinc.com>
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

On Wed, Feb 12, 2025 at 12:48:01PM +0530, Akhil P Oommen wrote:
> On 2/12/2025 5:30 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 11, 2025 at 06:41:39PM +0530, Akhil P Oommen wrote:
> >> On 2/9/2025 9:59 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Nov 13, 2024 at 02:18:43AM +0530, Akhil P Oommen wrote:
> >>>> On 10/30/2024 12:32 PM, Akhil P Oommen wrote:
> >>>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>>>
> >>>>> Enable GPU for sa8775p-ride platform and provide path for zap
> >>>>> shader.
> >>>>>
> >>>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 8 ++++++++
> >>>>>  1 file changed, 8 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>>> index 0c1b21def4b6..4901163df8f3 100644
> >>>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>>>> @@ -407,6 +407,14 @@ queue3 {
> >>>>>  	};
> >>>>>  };
> >>>>>  
> >>>>> +&gpu {
> >>>>> +	status = "okay";
> >>>>> +};
> >>>>> +
> >>>>> +&gpu_zap_shader {
> >>>>> +	firmware-name = "qcom/sa8775p/a663_zap.mbn";
> >>>>> +};
> >>>>> +
> >>>>>  &i2c11 {
> >>>>>  	clock-frequency = <400000>;
> >>>>>  	pinctrl-0 = <&qup_i2c11_default>;
> >>>>>
> >>>>
> >>>> Bjorn,
> >>>>
> >>>> Please ignore this patch for now. This is probably not the right
> >>>> platform dtsi file where gpu should be enabled. I am discussing about
> >>>> this internally. Will send a revision or a new patch based on the
> >>>> conclusion.
> >>>
> >>> Akhil, any updates on this?
> >>>
> >>
> >> I am still waiting for the discussion about QCS9075 board dts files [1]
> >> to conclude.
> >>
> >> [1]
> >> https://lore.kernel.org/lkml/Z3eMxl1Af8TOAQW%2F@hu-wasimn-hyd.qualcomm.com/T/
> > 
> > Why? We currently have several boards supported. We can enable GPU on
> > those as your patches are pretty fine. Then we can land Wasim's patches.
> > Not to mention that the discussion seems to be dead, last message was
> > sent almost a month ago.
> > 
> 
> sa8775p is an automotive-grade chipset which has a pretty different
> non-HLOS firmware. One of the major difference is that it has a SAFETY
> monitoring system (using SAIL IP block) which monitors different
> parameters like GPU frequency for eg and it takes control of the entire
> system when it detects an anomaly. That means we cannot use GPU DCVS,
> passive thermal mitigation etc there.
> 
> QCS9075 uses the same SoC but has different NHLOS firmwares that has
> SAIL disabled to make it behave like our regular chipsets. I am aware of
> only QCS9075 boards' GPU spec at the moment. I don't know the complete
> details of the impact of SAIL/SAFE features on GPU and other specs yet,
> so I can't disturb sa8775p-ride/qcs9100-ride boards.

Ack, thanks for the explanation. Indeed, it would be interesting to
understand how that's working together. Do SA8775P / QCS9100 use a
different GMU firmware?

> I can see that Wazim is still discussing about board DTS internally.
> Hopefully he will send out another revision of his series soon.

The discussion stopped a month ago. 

-- 
With best wishes
Dmitry
