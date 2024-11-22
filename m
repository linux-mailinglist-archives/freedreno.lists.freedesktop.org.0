Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3499D5D40
	for <lists+freedreno@lfdr.de>; Fri, 22 Nov 2024 11:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F9C10EB43;
	Fri, 22 Nov 2024 10:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ozvfSgYP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B49910EB43
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 10:27:13 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fc968b3545so21601911fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 02:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732271231; x=1732876031; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CaM32T9+cjWvYMHqhuUqWhjRL+hOdvCIE9xX19bPtjY=;
 b=ozvfSgYP9B4YHXj0N/hswNDC/m/Ht6dJjP2vEcLlnHhPQ9S0CZ9SOQdNIIw1GAaStn
 ZYOhFTqJ9zR9pk/KjxqPKfdOQQl8LqVtYHDo4OeJokSODnLhWCC7j7tL6GthuwRMwnJJ
 rIYddDIhqQNYS3JMdGGr66KCp7ftYfHc8zUaX+rRCBvxA0Zx91bc6HuY6Yy2nfd7PpIt
 /LcHprp2SUfK6ctjyhl8zvdNwACsqOPduY9pPdD/7vnAONzkct249DX8KSt3OOQO18Vh
 4xXra4dgrHqCHtC/DqK34mg62hX2g7ji92JU/7TzVHktthAqy2qt15KpN4TRlsDvKojc
 WgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732271231; x=1732876031;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CaM32T9+cjWvYMHqhuUqWhjRL+hOdvCIE9xX19bPtjY=;
 b=ACNYNsZVPSza/efCRPxFApeiev1coW5VFU9xVOwqTHe0VucpFcDU/gO1jSaiJrZpVv
 XfzxrMcVrTMfPfTdyblq9qcEWd88LEAc1CJCByCU1Rr4D9j+IeSWXWbNNaJwQTjjof1p
 ZQJEt1YdX+Wxh9903vdalbzhgGHYnuubqIj+OA5AxyxuwLRn2d4DIFVO7gWIU70fC8EN
 /xOkxYgaj4FaL8CGBsL8+3Atut2N09VsgmJJkNeL5n3TM2SKpw9I9Z3PaOihNzNkBGjl
 JaxzVMMoooVDc1Z9mR9WeEo9c3T1f0+8PljbdduuMskNS2m+xsOpFM1wlnpclvvj74Oy
 KjeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOPjii5XZg/kE7quPm9NL4a71xFoEpeS4OLRuPvuyUJwKWl4KTn7Pe6jppMl8+MIx9CvS13uO2n5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNin4UpiX2I/EDyfvmOa1NBpipTSxNgTAo2Sg6tZKBxhh2bmHr
 dfCFgfr9qqZt4O1aJzjDOl7lb7pCE9VWmftUspxLNucY7vxSW1mHEHpHO8p/ZQI=
X-Gm-Gg: ASbGnctfpqCpv57H+2HmjTjr/ObxnEkyNrGkaamuiMhNaIXU7RVZHdbRmvByqS719t7
 0ZyBwKtkn548BjnxPHez0mgo/TnPvUb5zoqnTP/e4hkg1wD7js6C0zyCC0OQj6igyKT2wX9FKfU
 kWW82Xx3DIxhQ/P/NjcWDXu5525g5mx/H1Jah2w5PiiFLKZlnmsEblqRxl+T30e92oHkWHCePom
 Dld4GSLm3aXb2a/BowroPO7NcTBhKzBFGY6TGyNN3K9TkN9OKQCqtuAjLp7J6fqDOWHPm0OYfSo
 QTghxyXugwYmiz2ZUsonVdWefQiHSg==
X-Google-Smtp-Source: AGHT+IG3oQHashA6tpFb+9+NmJi4GpOI+M8h9JPqYyxeNcEzdxQdY5O2kg12XYaqyKtAV7A8h+5UvA==
X-Received: by 2002:a05:651c:198d:b0:2fb:5b23:edba with SMTP id
 38308e7fff4ca-2ffa712dcb8mr11465241fa.23.1732271231158; 
 Fri, 22 Nov 2024 02:27:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffa7a65786sm2280291fa.63.2024.11.22.02.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 02:27:09 -0800 (PST)
Date: Fri, 22 Nov 2024 12:27:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 8/9] arm64: dts: qcom: Add display support for QCS615
Message-ID: <n7mnldqd2td2cm4uup6mlnmbzyg7unbzvert6kyweopplbfssz@vm3egater24k>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-8-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-8-35252e3a51fe@quicinc.com>
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

On Fri, Nov 22, 2024 at 05:56:51PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add display MDSS and DSI configuration for QCS615 platform.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 186 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 185 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
