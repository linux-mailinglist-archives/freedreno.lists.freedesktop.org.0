Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA8789DEEB
	for <lists+freedreno@lfdr.de>; Tue,  9 Apr 2024 17:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5C0112D5B;
	Tue,  9 Apr 2024 15:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mEV71tiF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CAD1125C6
 for <freedreno@lists.freedesktop.org>; Tue,  9 Apr 2024 15:24:17 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d858501412so73453471fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 09 Apr 2024 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712676255; x=1713281055; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8W6G8HZYeo1iMSpifmT8ORYKphiMz1er5wWw8HHvUlI=;
 b=mEV71tiFJiLuofZX6HD4c4/S1QLNN0XPhDwLHvEwJoRFb4Ubw07CmMg+5bIWpWrsRB
 WuNatVBHVgIa9vT3NRB3e/AKKD5N9+3wJuZImTbFVF3Flk7Igl2Q/ySxe77I1X5lmwYM
 KHe0kid4DijAXK7yL2c8c9x3Tw8nhRRQ6Ln8NRCnZOHT465PeOj+sAjSwqxh0mjUjRQK
 KS/GYuPZsPSYDNyhLIM13i0Nmkxn3hwcHGMPMC8e+gfBgZ0SXmRkgxgiNHM377zqJg3O
 aHYmkOhZ2RWFU5wLjtV9L120kNdUsPPFXxTppjUXIS+/8FjI2m7PmzLC5VgnAYdldX7V
 ebdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712676255; x=1713281055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8W6G8HZYeo1iMSpifmT8ORYKphiMz1er5wWw8HHvUlI=;
 b=pBQCSP1Nkuua5eyuGmrPqWyo9mqmu2JsTa/jnUDWispP32ThmV89FbCoKjLI7URkj5
 Hr0krek3w6rlckuJaeFq93wjI/U7ETCSPy2XaKD2fugIoNBiQ4D7kZgcAdtsNI+LuJx4
 ySXZ31MD3fFpXE1SWS1KHB9Xcsmb7L9V67ozrlTY35O8ILkilrsJp1pTaQRA8xzIMLwi
 ENxmAgFgNla7QqQSF5Inh7tXH//GssdF6ZrQ0vnuIE8o3MzTpwN892xvo28vQkSEt0Ho
 H7/eSu2ABLfw4YOpWePwFSBNalnzvqZsPpRqEDYehfG7Uv/Dmj0jaI/Udzb1E2T4gduC
 VUwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHyMra6KzWwnUWbhI+q0zmy866Fugrwk+LQckiKrzvA3VM6EgRjgJnvmY1vuRe7TdXGl385ZgCrO20nBHWvbpwaojSP0oD7KfKjoWmuF0X
X-Gm-Message-State: AOJu0YwOD/bXBVgd4VFfQ3fr/GKE9S9qiUZHq/YXlvUyt1Av5zoATpKj
 SFV2qSw3sGMYXr7HLDF3whPpMIvnPZ3FMnTL7ACSeY2hLL7LxnKBmy0rJQzuKcM=
X-Google-Smtp-Source: AGHT+IGgmNyquLws0Qkisav6dI35WAm8hEi+6R9A8E+K+p3FMjpmyYxLBNTdF+Phz+qzA9Iy+M4e/Q==
X-Received: by 2002:a2e:7807:0:b0:2d8:3a46:8ab6 with SMTP id
 t7-20020a2e7807000000b002d83a468ab6mr83703ljc.17.1712676255409; 
 Tue, 09 Apr 2024 08:24:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a2e98ca000000b002d0aad9dcfcsm1584958ljj.59.2024.04.09.08.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 08:24:15 -0700 (PDT)
Date: Tue, 9 Apr 2024 18:24:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/6] drm/msm/adreno: Add speedbin data for SM8550 / A740
Message-ID: <4ghhtxjtkfjzxeyrajn26get4d6xiq57swwsjmyialcyfivui6@se3ukxxukspt>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-5-ce2b864251b1@linaro.org>
 <nek4paofg3hturvjwpa2bnsvmicwmvwixzr6e6iuqstemgrqyo@cagcrnzjsne2>
 <0955cabc-fc4e-4790-a82c-7f6f807fe36b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0955cabc-fc4e-4790-a82c-7f6f807fe36b@linaro.org>
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

On Tue, Apr 09, 2024 at 05:13:15PM +0200, Konrad Dybcio wrote:
> 
> 
> On 4/6/24 05:25, Dmitry Baryshkov wrote:
> > On Fri, Apr 05, 2024 at 10:41:33AM +0200, Konrad Dybcio wrote:
> > > Add speebin data for A740, as found on SM8550 and derivative SoCs.
> > > 
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
> > >   1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > index 901ef767e491..c976a485aef2 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > @@ -570,6 +570,20 @@ static const struct adreno_info gpulist[] = {
> > >   		.zapfw = "a740_zap.mdt",
> > >   		.hwcg = a740_hwcg,
> > >   		.address_space_size = SZ_16G,
> > > +		.speedbins = ADRENO_SPEEDBINS(
> > 
> > I think this deserves either a comment or some info in the commit
> > message.
> 
> "this" = ?

I see two types of speedbins here, it would be nice to understand at
least some reason or some defailts for that (if you know them).

-- 
With best wishes
Dmitry
