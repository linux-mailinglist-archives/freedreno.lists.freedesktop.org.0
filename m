Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F91B8FB178
	for <lists+freedreno@lfdr.de>; Tue,  4 Jun 2024 13:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFB810E3FA;
	Tue,  4 Jun 2024 11:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BDqow0mu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560B510E3FA
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 11:55:28 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-57a32b0211aso1090840a12.2
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 04:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717502126; x=1718106926; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q6VdsvIa8zMQRCvSPBfH+t7XShyheFf7xCTS+iDnU7A=;
 b=BDqow0muS04SHEjh0sAAXRLb3Hk7c9GYSmlcb2F1y66guXyKM3vzodOihMNnU1vLDZ
 KFa7nX5ViHGpBltQd6Tx65pXkjpmhAF5WWO8h2Fxuxp26lRvssbKgH6Db9R0HWH0O1cB
 tfDvh7yhv/pM4Zn23KrG5NybaocqiLCZ5rmLL37msPgqSDC0ryFMpwu1Ogaw3PyhnMwg
 3ZmXljRwph1zW1VVsMrvl28YGxTRUgWIa6ng46pRbVlkYCuTudM4jy39OBlriW9hjCpr
 NToRZhbEFiWEQ8rnI8AC/3P9OIW1HYrXYShKxXrWgErabCW7ixu5aXHtoau+wj6j+yd/
 xLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717502126; x=1718106926;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q6VdsvIa8zMQRCvSPBfH+t7XShyheFf7xCTS+iDnU7A=;
 b=XnBCCAYSXGHbSq52Pp2x8S0tY5UxIYDQqNlFEVluctj4mX2cbzAeVM+S75mMbUyVyy
 o1QRejr8P+6xX/vc1WKd6WmXKJvAhm4Tk721jH13rz4aB+X7FIB9vUMX3CJIvNSJqfO/
 Cj683DmiU85uLrkVHMijJr5Uhje3QHfMM9o2K6T45yiXvxlD5fHz+4WyC1oAOeIJsckc
 AXHhOWBSARwNge/WAt/lSby234YSVPwomsgsU6vbTQlErvDjrVaxoYJ6y87QnApXMVAr
 I6qrXmq7RA3KVh9XtcRmSx9FOjScgYVFF1myLCI4xG2sFUQJ7OwiQ8or/p3IcXtuTBWB
 PpAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE+udlivkvjnKGzRlGas5TEmItP3R6BmlfhTkWujPxJp/GuPqrc2PK7PURnyRjmAZALrw+cJQNKrR2n7KyQEV4HYhrJpt+mslIS48VBxtn
X-Gm-Message-State: AOJu0YyEo8GTw95nL+A5g4Bp7iBTtXPykz1xtAwtqsSzI1LuGzzhntSM
 Cg8jqBdHZ0aF2+dX86sDS8KmsOaPqo2Mtdc19iY+iP3NE2iiwnowD+JGgRsuYCg=
X-Google-Smtp-Source: AGHT+IFPMPPfIGwe+ITg80ybaKWLNAXwRZnyLNcFGdUR3AZt9Bjo6BQS8NFYbo5uuwNUOn4vIHjZ3w==
X-Received: by 2002:a17:907:914e:b0:a68:9621:a93c with SMTP id
 a640c23a62f3a-a689621ab6fmr500481766b.8.1717502126376; 
 Tue, 04 Jun 2024 04:55:26 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:a035:2af2:8d85:1f72?
 ([2a00:f41:909a:a11e:a035:2af2:8d85:1f72])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a68b0795942sm489469666b.181.2024.06.04.04.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 04:55:26 -0700 (PDT)
Message-ID: <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
Date: Tue, 4 Jun 2024 13:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Add support for Adreno 505 GPU
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniil Titov <daniilt971@gmail.com>
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 6/4/24 02:20, Barnabás Czémán wrote:
> From: Daniil Titov <daniilt971@gmail.com>
> 
> This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz),
> SDM439 (650 MHz).
> 
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> ---

This all looks very good, just a nit

[...]

> +		/*
> +		 * Increase inactive period to 250 to avoid bouncing
> +		 * the GDSC which appears to make it grumpy
> +		 */
> +		.inactive_period = 250,

Are you sure this is actually necessary?

Konrad
