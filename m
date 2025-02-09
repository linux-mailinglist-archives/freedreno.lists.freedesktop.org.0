Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75634A2DF1E
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 17:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA0D10E00C;
	Sun,  9 Feb 2025 16:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vCZARA5x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69FA10E0C8
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 16:29:52 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so3865417e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 09 Feb 2025 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739118591; x=1739723391; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CBBaxSpqSP+CW1UdUykgwYZL/97FlmN6t4SFUigusvk=;
 b=vCZARA5xoLLWx6cTnHqqfbuQydjf0N96oCg36O/n+XU96NFKduk09I2TUt+Zj0JjFc
 3Dptk2gcYLfM59Aksg7BoxD1ZesZLs6oghPKscMuWlwCqmt5r9zHE9ydjpqnu/xjDAkw
 jLiaKQjJXYqcobgR8tITL5hSdzRWBpOTWsRQoh0wpHzFD2d/VX3oryQ/9eNfhHO5p5T2
 Eq+lEx8c8ecwc1l/p9WhQH09Fv/9gSt4tInlq8dEJJwzMiGeuxVg79APVeAJjOgsplWj
 Vnvus/SgxFZOfBYRZGrLvapd88PMYSU87Ud7xwURYl6q6CHLOmG8dsIalWO/+2jZYMqq
 z2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739118591; x=1739723391;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBBaxSpqSP+CW1UdUykgwYZL/97FlmN6t4SFUigusvk=;
 b=t/vT0mFR4MJNZssLydKmPZpxw8rQRgtzZzwSRWS/FWSdphEavrznEd8BaS7EHt+x5n
 e/V3C0aVQbJY0H+jMwdhW/HB+bA9zezKMHp4HDHHbQo59ElIzchWPWZhqVknNNt7ZVUS
 bCGLw9EZ5LvZxmDizo8+bS8nvtKHcxtzEMmYqpn8XH9f83IAZCK1shM494/gTQLq+2Qa
 yk7UowHHtfJTg6CLX0phQYA5Coqdd0D5jDN/GZHl09rkK7cUbfGZ91v2p7O0/EWRIVOH
 3tdSmVbySnXCFZocirKEq64vmzhGP3/q8QcN1Gf54GBoKqZcMAoj5BMkKqkFdPhkxfTU
 p1kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9ujBXSANw4Ga4+XA6iH0JQnbN6qwDO+nkqure1+iDZfvn5ARDz805ZiNUbuqPE5aELOePUanFyjA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOuwJXiEd/j6eT8a3J/LS6rpqhSfc+3o/Q0gmAgU2QmRVlihDD
 G/nlmTj3N4PIpUgvBtycUz5YtScjIlXu3XLQFUhIc7iu81TLf/lQ3QN4P2nyj84=
X-Gm-Gg: ASbGnct9+V0lEByjtcHQltm2/JZn6fytr2WOLjALMziLihHA8MukAQtLW5LOPk3YB/Y
 ZNi25y8Y9J4540MUNzWc8jHpthQ5mtaC4R0EZRQUuxojEXMqDHRJSowIgVTEmarruXPucbXEBb0
 taRyrzqUTvjiyENRyKPnNHiBlsIYpPhSyQ6rAm20NBrJLEltcNCPpUj+hPWa+VclOT4N7vlXDBu
 nASbTNqKeVE+xba9+jH/FtU7QHBE2t31/WD0p0mHThV4NIBBeXcIQTsIyj4TSAF6tEHIjU/hCk3
 1x9lmIviUZWDse34oh7CxKehK3niZHiycBAx8+5QkbQFrf25TXaCZRdeh/pH7X1MbYLLkRU=
X-Google-Smtp-Source: AGHT+IFzize2yKjpIdEHEa0CzVZP+PJ8P5Q3H+Z4nzXrwEuHJD8mwDugjc4mCpltXZ8b6WnzCOQMjA==
X-Received: by 2002:a05:6512:12c7:b0:545:d70:93f1 with SMTP id
 2adb3069b0e04-5450d709519mr22207e87.11.1739118590771; 
 Sun, 09 Feb 2025 08:29:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450a76bc6fsm182100e87.241.2025.02.09.08.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 08:29:49 -0800 (PST)
Date: Sun, 9 Feb 2025 18:29:46 +0200
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
Message-ID: <ah6nusoouth7ziu3iscxmafm6cxuwwebxt44ixsjmesp5adwc4@e5lnbztds2xd>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
 <4cfd1ebc-1a95-43d4-b36a-8b183c6dfd16@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cfd1ebc-1a95-43d4-b36a-8b183c6dfd16@quicinc.com>
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

On Wed, Nov 13, 2024 at 02:18:43AM +0530, Akhil P Oommen wrote:
> On 10/30/2024 12:32 PM, Akhil P Oommen wrote:
> > From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > 
> > Enable GPU for sa8775p-ride platform and provide path for zap
> > shader.
> > 
> > Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > index 0c1b21def4b6..4901163df8f3 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > @@ -407,6 +407,14 @@ queue3 {
> >  	};
> >  };
> >  
> > +&gpu {
> > +	status = "okay";
> > +};
> > +
> > +&gpu_zap_shader {
> > +	firmware-name = "qcom/sa8775p/a663_zap.mbn";
> > +};
> > +
> >  &i2c11 {
> >  	clock-frequency = <400000>;
> >  	pinctrl-0 = <&qup_i2c11_default>;
> > 
> 
> Bjorn,
> 
> Please ignore this patch for now. This is probably not the right
> platform dtsi file where gpu should be enabled. I am discussing about
> this internally. Will send a revision or a new patch based on the
> conclusion.

Akhil, any updates on this?

-- 
With best wishes
Dmitry
