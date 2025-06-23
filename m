Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249D2AE366E
	for <lists+freedreno@lfdr.de>; Mon, 23 Jun 2025 09:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615FC10E199;
	Mon, 23 Jun 2025 07:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m3vkHxM5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73CB10E19A
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 07:00:45 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-747e41d5469so3995404b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 00:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750662045; x=1751266845; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=r1kWOkDs7l6DKIrvxwugdor4k3RUV9HV/EqTyaUExsc=;
 b=m3vkHxM5lqRG7a3Arzhg6sG3hYm6nE4MRIhhtLiaslh8u/7aV8tkzRvLTH1cQC7eJo
 Gz7IMBs7nw7xHsV6zo8yBVmWyO7XDzRA0PsiYxtXVsSVaBS/ho8TPf5ZFLh2PoWseyyx
 9NFAnIy5I3m1FW9XsKBK/siMYAHQxVJbaBsV/He9wXcRXGkTD/lavvwQSZvHAYtc2yK+
 h3K1Y34Zn6N25OVHhGZlpJcEh0QmpryFUHgiWH6ZpKX1r0Su4IXRLo2ntRil7+c3eQrR
 7Z+AWbjFZ+fzdqxTT0HvJiNbaUFqxBcPXVCvzifQNl6HM4paNqIeXQEqDQm04VQYsH9O
 vUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750662045; x=1751266845;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r1kWOkDs7l6DKIrvxwugdor4k3RUV9HV/EqTyaUExsc=;
 b=oFoXYk98EDKsW+EmeppKw8sXtHpA8p5aPieeB2oXV3dks3CElzojFnDQIvAgYk4PwI
 IhxOIsKFOyT6q/bcrYSzNHjxRBXxCGsK/2UaNFiDziHc4Qcly1bgjdgdo7NC5QnoBEY6
 y0nJS55KtWAB/LPbbVnyBrMgzXs+Dea6Idph173Sj9PP7Qcea177AFR9RwyEnJoICivm
 hBYHuc8ml2HQKdgIl6hYiM4hCxIFxAK6zzqPgYzFzqGBFiaopOPAm5aXpoOT/RVHSCZG
 D7reLnrU/WURsIhf8ovLdUzRYFJ3fuCPjD/0qH5xbxZ23bmIVoS2vSOHjTYeYIqXcti9
 rcLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO7w5t2MjTgiw+9NW2xCbBydyUY+fYjxYwRJLhvKlGqRjVYOJrFJt4klpyJzmBY2ZsQqa2tgy5wSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd82YmXHGSZjylC9ZbchUINBeKsphw6f43zr7MIup6eMKgSoWT
 k4+BaQP5lsN0gCJFWAR0nE+kRkYrX0kf635UmhMF3rIooNlrDS4MdX1MySOeShTFfPg=
X-Gm-Gg: ASbGncvjxzHO7Eepmu74gh0VCIfHP4xS8jZTQwLtZK1GAU8hG07L8mOys47NmKTzmlw
 ZCtlIB7wkGUyR+2Dv1g/X3y2OMFhH3LnND4Y8AuY71hIl0+RwWNfqAMpCOFzDXZSvSpGyUWMVek
 uIqvsaNjfCdTYpUK7BD5xb7vHjCRHQ5JFKNmTDCJMNtIDOiZXm7+QwKzDI+3fSnpEjCNGP4kW9h
 nontfhxVcAwZ2qUad89idqov+wIJSf//UBpA4TvpEBx5KLwzobtvnkNO9GBbvcqafNLRH091jtW
 JsdDdv7HEpwrzWAyvpe98UAjr0E5BA80GeHOU683doAQSU6oAoExA64NxSQ9OjE=
X-Google-Smtp-Source: AGHT+IEXarhTj8XelbP6w978NQxFdzm3KYgRpu9wOKj/2FZyhLsamJaeZ3ORI0nsqTL5pXTi/4utUw==
X-Received: by 2002:a05:6a00:4fc2:b0:736:35d4:f03f with SMTP id
 d2e1a72fcca58-7490d52ca7cmr17381283b3a.6.1750662044834; 
 Mon, 23 Jun 2025 00:00:44 -0700 (PDT)
Received: from localhost ([122.172.81.72]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7490a6a72afsm7310911b3a.163.2025.06.23.00.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 00:00:44 -0700 (PDT)
Date: Mon, 23 Jun 2025 12:30:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v3 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
Message-ID: <20250623070042.d7ibrjc24gbtfyci@vireshk-i7>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
 <20250620-x1p-adreno-v3-1-56398c078c15@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-x1p-adreno-v3-1-56398c078c15@oss.qualcomm.com>
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

On 20-06-25, 12:24, Akhil P Oommen wrote:
> In some cases, an OPP may have multiple varients to describe the
> differences in the resources between SKUs. As an example, we may
> want to vote different peak bandwidths in different SKUs for the
> same frequency and the OPP node names can have an additional
> integer suffix to denote this difference like below:
> 
>  opp-666000000-0 {
>          opp-hz = /bits/ 64 <666000000>;
>          opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>          opp-peak-kBps = <8171875>;
>          qcom,opp-acd-level = <0xa82d5ffd>;
>          opp-supported-hw = <0xf>;
>  };
> 
>  /* Only applicable for SKUs which has 666Mhz as Fmax */
>  opp-666000000-1 {
>          opp-hz = /bits/ 64 <666000000>;
>          opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>          opp-peak-kBps = <16500000>;
>          qcom,opp-acd-level = <0xa82d5ffd>;
>          opp-supported-hw = <0x10>;
>  };
> 
> Update the regex to allow this usecase.
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> index a27ba7b663d456f964628a91a661b51a684de1be..0bd7d6b69755f5f53a045ba7b5e1d08030d980e6 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> @@ -23,7 +23,7 @@ properties:
>        const: operating-points-v2-adreno
>  
>  patternProperties:
> -  '^opp-[0-9]+$':
> +  '^opp(-[0-9]+){1,2}$':
>      type: object
>      additionalProperties: false

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
